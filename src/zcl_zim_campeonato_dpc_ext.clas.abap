class ZCL_ZIM_CAMPEONATO_DPC_EXT definition
  public
  inheriting from ZCL_ZIM_CAMPEONATO_DPC
  create public .

public section.
protected section.

  methods ZIM_I_CAMPEONATO_CREATE_ENTITY
    redefinition .
  methods ZIM_I_CLUBES_BAS_CREATE_ENTITY
    redefinition .
  methods ZIM_I_CLUBES_BAS_UPDATE_ENTITY
    redefinition .
  methods ZIM_I_ELENCOS_BA_CREATE_ENTITY
    redefinition .
  methods ZIM_I_ELENCOS_BA_UPDATE_ENTITY
    redefinition .
  methods ZIM_I_ESTADIOS_B_CREATE_ENTITY
    redefinition .
  methods ZIM_I_ESTADIOS_B_DELETE_ENTITY
    redefinition .
  methods ZIM_I_ESTADIOS_B_UPDATE_ENTITY
    redefinition .
  methods ZIM_I_CLUBES_BAS_DELETE_ENTITY
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZIM_CAMPEONATO_DPC_EXT IMPLEMENTATION.


  METHOD zim_i_campeonato_create_entity.

    DATA: l_request_input_data TYPE zcl_zim_campeonato_mpc=>ts_zim_i_campeonatotype,
          l_zim_clube          TYPE zim_clubes,
          l_returncode         TYPE inri-returncode,
          l_id_clube           TYPE zim_id.

* Read Request Data
    io_data_provider->read_entry_data( IMPORTING es_data = l_request_input_data ).

    IF l_request_input_data-id_clube IS NOT INITIAL AND
       l_request_input_data-nome_time IS NOT INITIAL.

      SELECT SINGLE * INTO @DATA(ls_clube) FROM zim_clubes WHERE id_clube = @l_request_input_data-id_clube.
      IF sy-subrc NE 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( l_zim_clube ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        WHILE l_subrc = 0.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_zim_clube TO FIELD-SYMBOL(<fs_field_create>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_request_input_data TO FIELD-SYMBOL(<fs_field_web>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          <fs_field_create> = <fs_field_web>.

        ENDWHILE.

        INSERT zim_clubes FROM l_zim_clube.

        IF sy-subrc = 0.

          GET TIME STAMP FIELD DATA(l_createdat).
          l_zim_clube-created_at = l_createdat.
          l_zim_clube-created_by = sy-uname.

          er_entity = CORRESPONDING #( l_zim_clube ). "Fill Exporting parameter ER_ENTITY

        ENDIF.

      ELSE.

      ENDIF.

    ENDIF.
  ENDMETHOD.


  method ZIM_I_CLUBES_BAS_CREATE_ENTITY.
    DATA: l_request_input_data TYPE zcl_zim_campeonato_mpc=>ts_zim_i_campeonatotype,
          l_zim_clube          TYPE zim_clubes,
          l_returncode         TYPE inri-returncode,
          l_id_clube           TYPE zim_id.

* Read Request Data
    io_data_provider->read_entry_data( IMPORTING es_data = l_request_input_data ).

    IF l_request_input_data-id_clube IS NOT INITIAL AND
       l_request_input_data-nome_time IS NOT INITIAL.

      SELECT SINGLE * INTO @DATA(ls_clube) FROM zim_clubes WHERE id_clube = @l_request_input_data-id_clube.
      IF sy-subrc NE 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( l_zim_clube ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        WHILE l_subrc = 0.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_zim_clube TO FIELD-SYMBOL(<fs_field_create>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_request_input_data TO FIELD-SYMBOL(<fs_field_web>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          <fs_field_create> = <fs_field_web>.

        ENDWHILE.

        INSERT zim_clubes FROM l_zim_clube.

        IF sy-subrc = 0.

          GET TIME STAMP FIELD DATA(l_createdat).
          l_zim_clube-created_at = l_createdat.
          l_zim_clube-created_by = sy-uname.

          er_entity = CORRESPONDING #( l_zim_clube ). "Fill Exporting parameter ER_ENTITY

        ENDIF.

      ELSE.

      ENDIF.

    ENDIF.  endmethod.


  METHOD zim_i_clubes_bas_delete_entity.

    DATA(l_id_key) = VALUE #( it_key_tab[ name = 'IdClube' ]-value OPTIONAL ).
    IF l_id_key IS NOT INITIAL.

* Delete record from table ZUSERINFO
      DELETE FROM zim_clubes WHERE id_clube = l_id_key.

    ENDIF.

  ENDMETHOD.


  METHOD zim_i_clubes_bas_update_entity.

    DATA: ls_request_input_data TYPE zcl_zim_campeonato_mpc=>tt_zim_i_clubes_basictype.

* Get key values
    DATA(lv_id_key) = VALUE #( it_key_tab[ name = 'IdClube' ]-value OPTIONAL ).

    IF lv_id_key IS NOT INITIAL.

* Read request data
      io_data_provider->read_entry_data( IMPORTING es_data = ls_request_input_data ).

      SELECT SINGLE * INTO @DATA(ls_clube) FROM zim_clubes WHERE id_clube = @lv_id_key.
      IF sy-subrc EQ 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( ls_clube ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        WHILE l_subrc = 0.

          ASSIGN COMPONENT sy-index OF STRUCTURE ls_clube TO FIELD-SYMBOL(<fs_field_old>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_request_input_data TO FIELD-SYMBOL(<fs_field_new>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.
          IF <fs_field_new> IS NOT INITIAL.
            <fs_field_old> = <fs_field_new>.
          ENDIF.

        ENDWHILE.

* Update fields of table ZBOOKS
        GET TIME STAMP FIELD DATA(l_changedat).

        UPDATE zim_clubes SET nome_time = ls_clube-nome_time
                          nome_completo = ls_clube-nome_completo
                             id_estadio = ls_clube-id_estadio
                           nome_tecnico = ls_clube-nome_tecnico
                               fundacao = ls_clube-fundacao
                             changed_at = l_changedat
                             changed_by = sy-uname
                         WHERE id_clube = lv_id_key.

        IF sy-subrc = 0.

          er_entity = CORRESPONDING #( ls_clube ). "Fill exporting parameter ER_ENTITY

        ENDIF.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  method ZIM_I_ELENCOS_BA_CREATE_ENTITY.

    DATA:
      l_request_input_data TYPE zcl_zim_campeonato_mpc=>ts_zim_i_estadios_basic_tottyp,
      l_record             TYPE zim_elencos,
      l_returncode         TYPE inri-returncode.

* Read Request Data
    io_data_provider->read_entry_data( IMPORTING es_data = l_request_input_data ).

    IF l_request_input_data-id_estadio IS NOT INITIAL AND
       l_request_input_data-nome_estadio IS NOT INITIAL.

      SELECT SINGLE * INTO @DATA(ls_estadio) FROM zim_estadios WHERE id_estadio = @l_request_input_data-id_estadio.
      IF sy-subrc NE 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( l_record ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        WHILE l_subrc = 0.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_record TO FIELD-SYMBOL(<fs_field_create>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_request_input_data TO FIELD-SYMBOL(<fs_field_web>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          <fs_field_create> = <fs_field_web>.

        ENDWHILE.

        INSERT zim_elencos FROM l_record.

        IF sy-subrc = 0.

*          GET TIME STAMP FIELD DATA(l_createdat).
*          l_record-created_at = l_createdat.
*          l_record-created_by = sy-uname.

          er_entity = CORRESPONDING #( l_record ). "Fill Exporting parameter ER_ENTITY

        ENDIF.

      ELSE.

      ENDIF.

    ENDIF.

  endmethod.


  METHOD zim_i_elencos_ba_update_entity.

    DATA: ls_request_input_data TYPE zcl_zim_campeonato_mpc=>ts_zim_i_elencos_basictype.

* Get key values
    DATA(lv_id_clube) = VALUE #( it_key_tab[ name = 'IdClube' ]-value OPTIONAL ).
    DATA(lv_id_jogador) = VALUE #( it_key_tab[ name = 'IdJogador' ]-value OPTIONAL ) .

    IF lv_id_clube IS NOT INITIAL and lv_id_jogador is not initial.

* Read request data
      io_data_provider->read_entry_data( IMPORTING es_data = ls_request_input_data ).

      SELECT SINGLE * INTO @DATA(ls_elenco) FROM zim_elencos WHERE id_clube = @lv_id_clube and id_jogador = @lv_id_jogador.
      IF sy-subrc EQ 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( ls_elenco ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        WHILE l_subrc = 0.

          ASSIGN COMPONENT sy-index OF STRUCTURE ls_elenco TO FIELD-SYMBOL(<fs_field_old>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_request_input_data TO FIELD-SYMBOL(<fs_field_new>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.
          IF <fs_field_new> IS NOT INITIAL.
            <fs_field_old> = <fs_field_new>.
          ENDIF.

        ENDWHILE.

* Update fields of table ZIM_elencoS
        GET TIME STAMP FIELD DATA(l_changedat).

        UPDATE zim_elencos SET camisa = ls_elenco-camisa
                              posicao = ls_elenco-posicao
                       WHERE id_clube = lv_id_clube
                        AND id_jogador = lv_id_jogador.

        IF sy-subrc = 0.

          er_entity = CORRESPONDING #( ls_elenco ). "Fill exporting parameter ER_ENTITY

        ENDIF.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD zim_i_estadios_b_create_entity.

    DATA:
      l_request_input_data TYPE zcl_zim_campeonato_mpc=>ts_zim_i_estadios_basic_tottyp,
      l_record             TYPE zim_estadios,
      l_returncode         TYPE inri-returncode.

* Read Request Data
    io_data_provider->read_entry_data( IMPORTING es_data = l_request_input_data ).

    IF l_request_input_data-id_estadio IS NOT INITIAL AND
       l_request_input_data-nome_estadio IS NOT INITIAL.

      SELECT SINGLE * INTO @DATA(ls_estadio) FROM zim_estadios WHERE id_estadio = @l_request_input_data-id_estadio.
      IF sy-subrc NE 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( l_record ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        WHILE l_subrc = 0.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_record TO FIELD-SYMBOL(<fs_field_create>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_request_input_data TO FIELD-SYMBOL(<fs_field_web>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          <fs_field_create> = <fs_field_web>.

        ENDWHILE.

        INSERT zim_estadios FROM l_record.

        IF sy-subrc = 0.

          GET TIME STAMP FIELD DATA(l_createdat).
          l_record-created_at = l_createdat.
          l_record-created_by = sy-uname.

          er_entity = CORRESPONDING #( l_record ). "Fill Exporting parameter ER_ENTITY

        ENDIF.

      ELSE.

      ENDIF.

    ENDIF.
  ENDMETHOD.


  METHOD zim_i_estadios_b_delete_entity.

    DATA(l_id_key) = VALUE #( it_key_tab[ name = 'IdEstadio' ]-value OPTIONAL ).
    IF l_id_key IS NOT INITIAL.

* Delete record from table ZUSERINFO
      DELETE FROM zim_estadios WHERE id_estadio = l_id_key.

    ENDIF.

ENDMETHOD.


  method ZIM_I_ESTADIOS_B_UPDATE_ENTITY.

    DATA: ls_request_input_data TYPE zcl_zim_campeonato_mpc=>ts_zim_i_estadios_basic_tottyp.

* Get key values
    DATA(lv_id_key) = VALUE #( it_key_tab[ name = 'IdEstadio' ]-value OPTIONAL ).

    IF lv_id_key IS NOT INITIAL.

* Read request data
      io_data_provider->read_entry_data( IMPORTING es_data = ls_request_input_data ).

      SELECT SINGLE * INTO @DATA(ls_estadio) FROM zim_estadios WHERE id_estadio = @lv_id_key.
      IF sy-subrc EQ 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( ls_estadio ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        WHILE l_subrc = 0.

          ASSIGN COMPONENT sy-index OF STRUCTURE ls_estadio TO FIELD-SYMBOL(<fs_field_old>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_request_input_data TO FIELD-SYMBOL(<fs_field_new>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.
          IF <fs_field_new> IS NOT INITIAL.
            <fs_field_old> = <fs_field_new>.
          ENDIF.

        ENDWHILE.

* Update fields of table ZIM_ESTADIOS
        GET TIME STAMP FIELD DATA(l_changedat).

        UPDATE zim_estadios SET nome_estadio = ls_estadio-nome_estadio
                                      cidade = ls_estadio-cidade
                                          uf = ls_estadio-uf
                                  capacidade = ls_estadio-capacidade
                                     geocode = ls_estadio-geocode
                                    latitude = ls_estadio-latitude
                                   longitude = ls_estadio-longitude
                                  changed_at = l_changedat
                                  changed_by = sy-uname
                            WHERE id_estadio = lv_id_key.

        IF sy-subrc = 0.

          er_entity = CORRESPONDING #( ls_estadio ). "Fill exporting parameter ER_ENTITY

        ENDIF.

      ENDIF.

    ENDIF.

  endmethod.
ENDCLASS.
