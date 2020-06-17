"! <p class="shorttext synchronized" lang="en">Fill tables from XLS file</p>
CLASS zcl_upload_xls DEFINITION PUBLIC FINAL.
  PUBLIC SECTION.

    INTERFACES: if_oo_adt_classrun.

    TYPES:
      ty_s_zim_clubes TYPE zim_clubes,
      ty_t_zim_clubes TYPE SORTED TABLE OF ty_s_zim_clubes
                      WITH UNIQUE KEY primary_key COMPONENTS id_clube,

      BEGIN OF ty_s_file,
        filename TYPE string,
        content  TYPE xstring,
      END OF ty_s_file.

    METHODS: start.

  PRIVATE SECTION.

    METHODS:
      "! <p class="shorttext synchronized" lang="en">Get File method</p>
      get_file IMPORTING !i_file       TYPE string OPTIONAL
               RETURNING VALUE(r_file) TYPE string,

      "! <p class="shorttext synchronized" lang="en">Get File method</p>
      read_file IMPORTING !i_file       TYPE string OPTIONAL
                RETURNING VALUE(r_file) TYPE ty_s_file,

      "! <p class="shorttext synchronized" lang="en">Upload XLS method</p>
      upload_xls IMPORTING !is_file TYPE ty_s_file,

      "! <p class="shorttext synchronized" lang="en">Upload binary file</p>
      upload_logo IMPORTING !is_file TYPE ty_s_file,

      fill_zim_clubes IMPORTING !i_table TYPE STANDARD TABLE,
      fill_zim_elencos IMPORTING !i_table TYPE STANDARD TABLE,
      fill_zim_jogadores IMPORTING !i_table TYPE STANDARD TABLE,
      fill_zim_estadios IMPORTING !i_table TYPE STANDARD TABLE,
      fill_zim_partidas_k IMPORTING !i_table TYPE STANDARD TABLE,
      fill_zim_partidas_p IMPORTING !i_table TYPE STANDARD TABLE,
      fill_zim_gols IMPORTING !i_table TYPE STANDARD TABLE,

      create_guid RETURNING VALUE(r_guid) TYPE guid,
      get_id IMPORTING !i_nometime TYPE zim_nometime
             RETURNING VALUE(r_id) TYPE id,
      convert_date IMPORTING !i_date_string TYPE string
                   RETURNING VALUE(r_date)  TYPE datum .


ENDCLASS.



CLASS zcl_upload_xls IMPLEMENTATION.

**********************************************************************
  METHOD if_oo_adt_classrun~main.

    upload_xls( read_file( get_file( 'C:\Users\imilazzo\Downloads\clubes.xlsx' ) ) ).
    upload_logo( read_file( get_file( 'C:\Users\imilazzo\Downloads\clubes.zip' ) ) ).

  ENDMETHOD.

**********************************************************************
  METHOD start.

    upload_xls( read_file( get_file( ) ) ).
    upload_logo( read_file( get_file( ) ) ).

  ENDMETHOD.

**********************************************************************
  METHOD get_file.

    DATA: tl_filetable   TYPE filetable,
          l_rc           TYPE i,
          l_window_title TYPE string,
          l_extension    TYPE string.

*    cl_demo_input=>request( EXPORTING text = 'Nome do Arquivo:' CHANGING field = p_file ).
    IF i_file IS INITIAL.

      MESSAGE s001(zim_futebol).

      CLEAR tl_filetable[].

      l_extension    = '*.png, *.csv, *.xls'.
      l_window_title = 'Escolha o arquivo'.

      CALL METHOD cl_gui_frontend_services=>file_open_dialog
        EXPORTING
          window_title            = l_window_title
          default_extension       = l_extension
        CHANGING
          file_table              = tl_filetable
          rc                      = l_rc
        EXCEPTIONS
          file_open_dialog_failed = 1
          cntl_error              = 2
          error_no_gui            = 3
          not_supported_by_gui    = 4
          OTHERS                  = 5.

      IF ( sy-subrc IS NOT INITIAL ).
        RETURN.
      ENDIF.

      r_file = VALUE #( tl_filetable[ 1 ] OPTIONAL ).

    ELSE.
      r_file = i_file.
    ENDIF.

  ENDMETHOD.

**********************************************************************
  METHOD read_file.

    DATA : lt_records      TYPE solix_tab,
           l_headerxstring TYPE xstring,
           l_filelength    TYPE i.


    IF i_file IS NOT INITIAL.

      MESSAGE s002(zim_futebol) WITH i_file.

      r_file-filename = i_file.

      CALL FUNCTION 'GUI_UPLOAD'
        EXPORTING
          filename                = i_file
          filetype                = 'BIN'
        IMPORTING
          filelength              = l_filelength
          header                  = l_headerxstring
        TABLES
          data_tab                = lt_records
        EXCEPTIONS
          file_open_error         = 1
          file_read_error         = 2
          no_batch                = 3
          gui_refuse_filetransfer = 4
          invalid_type            = 5
          no_authority            = 6
          unknown_error           = 7
          bad_data_format         = 8
          header_not_allowed      = 9
          separator_not_allowed   = 10
          header_too_long         = 11
          unknown_dp_error        = 12
          access_denied           = 13
          dp_out_of_memory        = 14
          disk_full               = 15
          dp_timeout              = 16
          OTHERS                  = 17.

      IF sy-subrc EQ 0.

        CALL FUNCTION 'SCMS_BINARY_TO_XSTRING'
          EXPORTING
            input_length = l_filelength
          IMPORTING
            buffer       = r_file-content
          TABLES
            binary_tab   = lt_records
          EXCEPTIONS
            failed       = 1
            OTHERS       = 2.

      ENDIF.

    ENDIF.

  ENDMETHOD.

**********************************************************************
  METHOD upload_xls.

    DATA : l_filelength TYPE i.

    IF ( is_file-content IS NOT INITIAL ).

      MESSAGE s003(zim_futebol).

      TRY .
          DATA(lo_excel_ref) = NEW cl_fdt_xl_spreadsheet(
                                  document_name = is_file-filename
                                  xdocument     = is_file-content ) .

        CATCH cx_fdt_excel_core.
          "Implement suitable error handling here
      ENDTRY .

      "Get List of Worksheets
      lo_excel_ref->if_fdt_doc_spreadsheet~get_worksheet_names(
        IMPORTING
          worksheet_names = DATA(lt_worksheets) ).

      IF NOT lt_worksheets IS INITIAL.

        LOOP AT lt_worksheets INTO DATA(l_woksheet).

          DATA(lo_data_ref) = lo_excel_ref->if_fdt_doc_spreadsheet~get_itab_from_worksheet( l_woksheet ).
          ASSIGN lo_data_ref->* TO FIELD-SYMBOL(<fs_table>).

          DATA(l_method) = |FILL_| && l_woksheet.
          MESSAGE s004(zim_futebol) WITH l_method.
          CALL METHOD (l_method) EXPORTING i_table = <fs_table>.

          FREE:
                <fs_table>,
                lo_data_ref.

        ENDLOOP.

      ENDIF.

    ENDIF.

    FREE: lt_worksheets,
          lo_excel_ref.

  ENDMETHOD.

**********************************************************************
  METHOD fill_zim_clubes.

    DATA:
      wl_zim_clubes      TYPE zim_clubes,
      wl_zim_clubes_desc TYPE zim_clubes_desc.

    MESSAGE s005(zim_futebol) WITH 'ZIM_CLUBES'.

    DELETE FROM zim_clubes.
    DELETE FROM zim_clubes_desc.

    CLEAR sy-subrc.


    LOOP AT i_table ASSIGNING FIELD-SYMBOL(<fs_data>) FROM 2.

      WHILE sy-subrc = 0.

        ASSIGN COMPONENT sy-index OF STRUCTURE <fs_data> TO FIELD-SYMBOL(<fs_field>).
        IF sy-subrc = 0 .

          IF sy-index < 10.

            ASSIGN COMPONENT sy-index OF STRUCTURE wl_zim_clubes TO FIELD-SYMBOL(<fs_zim_clube>).
            IF sy-subrc = 0 .

              IF sy-index = 6.

                <fs_zim_clube> = convert_date( <fs_field> ).

              ELSE.

                <fs_zim_clube> = <fs_field>.

              ENDIF.

            ENDIF.

          ELSE.

            ASSIGN COMPONENT 'DESCRICAO' OF STRUCTURE wl_zim_clubes_desc TO FIELD-SYMBOL(<fs_zim_clube_desc>).
            IF sy-subrc = 0 .
              <fs_zim_clube_desc> = <fs_field>.
            ENDIF.

          ENDIF.

        ENDIF.

      ENDWHILE .

*      wl_zim_clubes-guid = create_guid( ).
      wl_zim_clubes_desc-id_clube = wl_zim_clubes-id_clube.

      MODIFY zim_clubes FROM wl_zim_clubes.
      MODIFY zim_clubes_desc FROM wl_zim_clubes_desc.

    ENDLOOP .

  ENDMETHOD.

**********************************************************************
  METHOD fill_zim_estadios.

    DATA:
      wl_zim_estadio TYPE zim_estadios.

    MESSAGE s005(zim_futebol) WITH 'ZIM_ESTADIOS'.

    DELETE FROM zim_estadios.

    CLEAR sy-subrc.


    LOOP AT i_table ASSIGNING FIELD-SYMBOL(<fs_data>) FROM 2.

      WHILE sy-subrc = 0.

        ASSIGN COMPONENT sy-index OF STRUCTURE <fs_data> TO FIELD-SYMBOL(<fs_field>).
        IF sy-subrc = 0 .

          ASSIGN COMPONENT sy-index OF STRUCTURE wl_zim_estadio TO FIELD-SYMBOL(<fs_zim_estadio>).
          IF sy-subrc = 0 .

            <fs_zim_estadio> = <fs_field>.

          ENDIF.

        ENDIF.

      ENDWHILE .


      MODIFY zim_estadios FROM wl_zim_estadio.

    ENDLOOP .

  ENDMETHOD.

**********************************************************************
  METHOD fill_zim_jogadores.

    DATA:
      wl_zim_jogador TYPE zim_jogadores.

    MESSAGE s005(zim_futebol) WITH 'ZIM_JOGADORES'.

    DELETE FROM zim_jogadores.

    CLEAR sy-subrc.


    LOOP AT i_table ASSIGNING FIELD-SYMBOL(<fs_data>) FROM 2.

      WHILE sy-subrc = 0.

        ASSIGN COMPONENT sy-index OF STRUCTURE <fs_data> TO FIELD-SYMBOL(<fs_field>).
        IF sy-subrc = 0 .

          ASSIGN COMPONENT sy-index OF STRUCTURE wl_zim_jogador TO FIELD-SYMBOL(<fs_zim_jogador>).
          IF sy-subrc = 0 .

            <fs_zim_jogador> = <fs_field>.

          ENDIF.

        ENDIF.

      ENDWHILE .

      MODIFY zim_jogadores FROM wl_zim_jogador.

    ENDLOOP .

  ENDMETHOD.

**********************************************************************
  METHOD fill_zim_elencos.

    DATA:
      wl_zim_elenco TYPE zim_elencos.

    MESSAGE s005(zim_futebol) WITH 'ZIM_ELENCOS'.

    DELETE FROM zim_elencos.
    CLEAR sy-subrc.

    LOOP AT i_table ASSIGNING FIELD-SYMBOL(<fs_data>) FROM 2.

      WHILE sy-subrc = 0.

        ASSIGN COMPONENT sy-index OF STRUCTURE <fs_data> TO FIELD-SYMBOL(<fs_field>).
        IF sy-subrc = 0 .

          ASSIGN COMPONENT sy-index OF STRUCTURE wl_zim_elenco TO FIELD-SYMBOL(<fs_zim_clube>).
          IF sy-subrc = 0 .

            <fs_zim_clube> = <fs_field>.

          ENDIF.

        ENDIF.

      ENDWHILE .

      MODIFY zim_elencos FROM wl_zim_elenco.

    ENDLOOP .

  ENDMETHOD.

**********************************************************************
  METHOD fill_zim_gols.

    DATA:
      wl_zim_gol TYPE zim_gols.

    MESSAGE s005(zim_futebol) WITH 'ZIM_GOLS'.

    DELETE FROM zim_gols.

    CLEAR sy-subrc.

    LOOP AT i_table ASSIGNING FIELD-SYMBOL(<fs_data>) FROM 2.

      WHILE sy-subrc = 0.

        ASSIGN COMPONENT sy-index OF STRUCTURE <fs_data> TO FIELD-SYMBOL(<fs_field>).
        IF sy-subrc = 0 .

          ASSIGN COMPONENT sy-index OF STRUCTURE wl_zim_gol TO FIELD-SYMBOL(<fs_zim_gol>).
          IF sy-subrc = 0 .

            <fs_zim_gol> = <fs_field>.

          ENDIF.

        ENDIF.

      ENDWHILE .

      MODIFY zim_gols FROM wl_zim_gol.

    ENDLOOP .

  ENDMETHOD.

**********************************************************************
  METHOD fill_zim_partidas_k.

    DATA:
      wl_zim_partida_k TYPE zim_partidas_k.

    MESSAGE s005(zim_futebol) WITH 'ZIM_PARTIDAS_K'.

    DELETE FROM zim_partidas_k.
    CLEAR sy-subrc.

    LOOP AT i_table ASSIGNING FIELD-SYMBOL(<fs_data>) FROM 2.

      WHILE sy-subrc = 0.

        ASSIGN COMPONENT sy-index OF STRUCTURE <fs_data> TO FIELD-SYMBOL(<fs_field>).
        IF sy-subrc = 0 .

          ASSIGN COMPONENT sy-index OF STRUCTURE wl_zim_partida_k TO FIELD-SYMBOL(<fs_zim_partida_k>).
          IF sy-subrc = 0 .

            IF sy-index = 3.
              <fs_zim_partida_k> = convert_date( <fs_field> ).
            ELSE.

              <fs_zim_partida_k> = <fs_field>.
            ENDIF.

          ENDIF.

        ENDIF.

      ENDWHILE .

      MODIFY zim_partidas_k FROM wl_zim_partida_k.

    ENDLOOP .

  ENDMETHOD.

**********************************************************************
  METHOD fill_zim_partidas_p.

    DATA:
      wl_zim_partida_p TYPE zim_partidas_p.

    MESSAGE s005(zim_futebol) WITH 'ZIM_PARTIDAS_P'.

    DELETE FROM zim_partidas_p.
    CLEAR sy-subrc.

    LOOP AT i_table ASSIGNING FIELD-SYMBOL(<fs_data>) FROM 2.

      WHILE sy-subrc = 0.

        ASSIGN COMPONENT sy-index OF STRUCTURE <fs_data> TO FIELD-SYMBOL(<fs_field>).
        IF sy-subrc = 0 .

          ASSIGN COMPONENT sy-index OF STRUCTURE wl_zim_partida_p TO FIELD-SYMBOL(<fs_zim_partida_p>).
          IF sy-subrc = 0 .

            <fs_zim_partida_p> = <fs_field>.

          ENDIF.

        ENDIF.

      ENDWHILE .

      MODIFY zim_partidas_p FROM wl_zim_partida_p.

    ENDLOOP .

  ENDMETHOD.

**********************************************************************
  METHOD upload_logo.

    TYPES:
      BEGIN OF ty_s_splice_entry,
        name       TYPE string,
        offset     TYPE i,
        length     TYPE i,
        compressed TYPE i,
      END OF ty_s_splice_entry .

    TYPES:
      ty_t_splice_entries TYPE STANDARD TABLE OF ty_s_splice_entry WITH DEFAULT KEY .

    DELETE FROM zim_clubes_logo.

    SELECT id_clube, filename
      FROM zim_clubes
      INTO TABLE @DATA(tl_clubes).

    IF is_file-filename IS NOT INITIAL.

      IF is_file-content IS NOT INITIAL.

        DATA(lo_zip) = NEW cl_abap_zip( ).
        lo_zip->load( is_file-content ).
        DATA(t_splice_entries) = lo_zip->splice( is_file-content ).

        LOOP AT t_splice_entries INTO DATA(wl_splice).

          lo_zip->get( EXPORTING name = wl_splice-name
                       IMPORTING content = DATA(content) ).

          DATA(wl_clube) = VALUE #( tl_clubes[ filename = wl_splice-name ] OPTIONAL ).
          DATA(wa_zim_clubes_logo) = VALUE zim_clubes_logo(
                                   id_clube = wl_clube-id_clube
                                   filename = wl_splice-name
                                    content = content ).

          MESSAGE s009(zim_futebol) WITH wl_splice-name.
          MODIFY zim_clubes_logo FROM wa_zim_clubes_logo .

          CLEAR content.

        ENDLOOP.

      ENDIF.

    ENDIF.

    FREE: lo_zip.

  ENDMETHOD.

**********************************************************************
  METHOD create_guid.

    DATA(system_uuid) = cl_uuid_factory=>create_system_uuid( ).

    TRY.
        r_guid = system_uuid->create_uuid_x16( ).

      CATCH cx_uuid_error.
        ...
    ENDTRY.

  ENDMETHOD.

**********************************************************************
  METHOD convert_date.

    DATA: l_converted_date(10) TYPE c.

    l_converted_date = i_date_string .

    "date format YYYY/MM/DD
    FIND REGEX '^\d{4}[/|-]\d{1,2}[/|-]\d{1,2}$' IN l_converted_date.
    IF sy-subrc = 0.
      CALL FUNCTION '/SAPDMC/LSM_DATE_CONVERT'
        EXPORTING
          date_in             = l_converted_date
          date_format_in      = 'DYMD'
          to_output_format    = ' '
          to_internal_format  = 'X'
        IMPORTING
          date_out            = l_converted_date
        EXCEPTIONS
          illegal_date        = 1
          illegal_date_format = 2
          no_user_date_format = 3
          OTHERS              = 4.
    ELSE.

      " date format DD/MM/YYYY
      FIND REGEX '^\d{1,2}[/|-]\d{1,2}[/|-]\d{4}$' IN l_converted_date.
      IF sy-subrc = 0.
        CALL FUNCTION '/SAPDMC/LSM_DATE_CONVERT'
          EXPORTING
            date_in             = l_converted_date
            date_format_in      = 'DDMY'
            to_output_format    = ' '
            to_internal_format  = 'X'
          IMPORTING
            date_out            = l_converted_date
          EXCEPTIONS
            illegal_date        = 1
            illegal_date_format = 2
            no_user_date_format = 3
            OTHERS              = 4.
      ENDIF.

    ENDIF.

    IF sy-subrc = 0.
      r_date = l_converted_date .
    ENDIF.
  ENDMETHOD.

**********************************************************************
  METHOD get_id.

    SELECT id_clube
      FROM zim_clubes
     WHERE nometime = @i_nometime
      INTO TABLE @DATA(tl_id).

    r_id = VALUE #( tl_id[ 1 ]-id_clube OPTIONAL ).

  ENDMETHOD.

ENDCLASS.
