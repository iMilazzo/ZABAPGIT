class ZCL_ZIM_CLUBES_DPC_EXT definition
  public
  inheriting from ZCL_ZIM_CLUBES_DPC
  create public .

public section.
protected section.

  methods CLUBESSET_CREATE_ENTITY
    redefinition .
  methods CLUBESSET_DELETE_ENTITY
    redefinition .
  methods CLUBESSET_UPDATE_ENTITY
    redefinition .
  methods ELENCOSSET_CREATE_ENTITY
    redefinition .
  methods ELENCOSSET_DELETE_ENTITY
    redefinition .
  methods ESTADIOSSET_CREATE_ENTITY
    redefinition .
  methods ESTADIOSSET_DELETE_ENTITY
    redefinition .
  methods ESTADIOSSET_UPDATE_ENTITY
    redefinition .
  methods JOGADORESSET_CREATE_ENTITY
    redefinition .
  methods JOGADORESSET_DELETE_ENTITY
    redefinition .
  methods JOGADORESSET_UPDATE_ENTITY
    redefinition .
  methods PARTIDASHDRSET_CREATE_ENTITY
    redefinition .
  methods PARTIDASHDRSET_DELETE_ENTITY
    redefinition .
  methods PARTIDASHDRSET_UPDATE_ENTITY
    redefinition .
  methods PARTIDASITMSET_CREATE_ENTITY
    redefinition .
  methods PARTIDASITMSET_DELETE_ENTITY
    redefinition .
  methods PARTIDASITMSET_UPDATE_ENTITY
    redefinition .
  methods ELENCOSSET_UPDATE_ENTITY
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZIM_CLUBES_DPC_EXT IMPLEMENTATION.


  METHOD clubesset_create_entity.

    DATA:
      l_request_input_data TYPE zcl_zim_clubes_mpc=>ts_clubessettype,
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
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( ls_clube ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        DO lines( lt_comp ) TIMES.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_zim_clube TO FIELD-SYMBOL(<fs_field_create>).

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_request_input_data TO FIELD-SYMBOL(<fs_field_web>).

          IF <fs_field_create> IS ASSIGNED AND <fs_field_web> IS ASSIGNED.
            <fs_field_create> = <fs_field_web>.
          ENDIF.

          UNASSIGN:
                   <fs_field_create>,
                   <fs_field_web>.

        ENDDO.

        IF l_zim_clube IS NOT INITIAL.

          GET TIME STAMP FIELD DATA(l_createdat).
          l_zim_clube-created_at = l_createdat.
          l_zim_clube-created_by = sy-uname.

          INSERT zim_clubes FROM l_zim_clube.

          IF sy-subrc = 0.

            er_entity = CORRESPONDING #( l_zim_clube ). "Fill Exporting parameter ER_ENTITY

          ENDIF.

        ENDIF.

      ELSE.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  method CLUBESSET_DELETE_ENTITY.

    DATA(l_id_key) = VALUE #( it_key_tab[ name = 'id_clube' ]-value OPTIONAL ).
    IF l_id_key IS NOT INITIAL.

      DELETE FROM zim_clubes WHERE id_clube = l_id_key.

    ENDIF.

  endmethod.


  METHOD clubesset_update_entity.

    DATA: ls_request_input_data TYPE zcl_zim_clubes_mpc=>ts_clubessettype.

* Get key values
    DATA(lv_id_key) = VALUE #( it_key_tab[ name = 'id_clube' ]-value OPTIONAL ).

    IF lv_id_key IS NOT INITIAL.

* Read request data
      io_data_provider->read_entry_data( IMPORTING es_data = ls_request_input_data ).

      SELECT SINGLE * INTO @DATA(ls_clube) FROM zim_clubes WHERE id_clube = @lv_id_key.
      IF sy-subrc EQ 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( ls_clube ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        DO lines( lt_comp ) TIMES.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_clube TO FIELD-SYMBOL(<fs_field_old>).

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_request_input_data TO FIELD-SYMBOL(<fs_field_new>).

          IF <fs_field_new> IS ASSIGNED AND <fs_field_old> IS ASSIGNED.
            <fs_field_old> = <fs_field_new>.
          ENDIF.

          UNASSIGN:
                   <fs_field_new>,
                   <fs_field_old>.

        ENDdo.

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


  METHOD elencosset_create_entity.

    DATA:
      l_request_input_data TYPE zcl_zim_clubes_mpc=>ts_elencossettype,
      l_zim_elenco         TYPE zim_elencos,
      l_returncode         TYPE inri-returncode,
      l_id_elenco          TYPE zim_id.

* Read Request Data
    io_data_provider->read_entry_data( IMPORTING es_data = l_request_input_data ).

    IF l_request_input_data-id_clube IS NOT INITIAL AND
       l_request_input_data-id_jogador IS NOT INITIAL.

      SELECT SINGLE * INTO @DATA(ls_elenco)
        FROM zim_elencos
       WHERE id_clube = @l_request_input_data-id_clube
         AND id_jogador = @l_request_input_data-id_jogador.

      IF sy-subrc NE 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( l_zim_elenco ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        DO lines( lt_comp ) TIMES.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_zim_elenco TO FIELD-SYMBOL(<fs_field_create>).
          IF sy-subrc <> 0.
*            EXIT.
          ENDIF.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_request_input_data TO FIELD-SYMBOL(<fs_field_web>).
          IF sy-subrc <> 0.
*            EXIT.
          ENDIF.

          IF <fs_field_create> IS ASSIGNED AND <fs_field_web> IS ASSIGNED.
            <fs_field_create> = <fs_field_web>.
          ENDIF.

          UNASSIGN:
                   <fs_field_create>,
                   <fs_field_web>.


        ENDDO.

        IF l_zim_elenco IS NOT INITIAL.
*        GET TIME STAMP FIELD DATA(l_createdat).
*        l_zim_elenco-created_at = l_createdat.
*        l_zim_elenco-created_by = sy-uname.

          INSERT zim_elencos FROM l_zim_elenco.

          IF sy-subrc = 0.

            er_entity = CORRESPONDING #( l_zim_elenco ). "Fill Exporting parameter ER_ENTITY

          ENDIF.

        ENDIF.

      ELSE.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD elencosset_delete_entity.

    DATA(l_id_clube) = VALUE #( it_key_tab[ name = 'id_clube' ]-value OPTIONAL ).
    DATA(l_id_jogador) = VALUE #( it_key_tab[ name = 'id_jogador' ]-value OPTIONAL ).

    IF l_id_clube IS NOT INITIAL AND
       l_id_jogador IS NOT INITIAL.

      DELETE FROM zim_elencos WHERE id_clube = l_id_clube AND id_jogador = l_id_jogador.

    ENDIF.

  ENDMETHOD.


  METHOD elencosset_update_entity.

    DATA: ls_request_input_data TYPE zcl_zim_clubes_mpc=>ts_elencossettype.

* Get key values
    DATA(lv_id_clube) = VALUE #( it_key_tab[ name = 'id_clube' ]-value OPTIONAL ).
    DATA(lv_id_jogador) = VALUE #( it_key_tab[ name = 'id_jogador' ]-value OPTIONAL ).

    IF lv_id_clube IS NOT INITIAL AND
       lv_id_jogador IS NOT INITIAL.

* Read request data
      io_data_provider->read_entry_data( IMPORTING es_data = ls_request_input_data ).

      SELECT SINGLE * INTO @DATA(ls_elenco) FROM zim_elencos WHERE id_clube = @lv_id_clube AND id_jogador = @lv_id_jogador.
      IF sy-subrc EQ 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( ls_elenco ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        DO lines( lt_comp ) TIMES.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_elenco TO FIELD-SYMBOL(<fs_field_old>).

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_request_input_data TO FIELD-SYMBOL(<fs_field_new>).

          IF <fs_field_new> IS ASSIGNED AND <fs_field_old> IS ASSIGNED.
            <fs_field_old> = <fs_field_new>.
          ENDIF.

          UNASSIGN:
                   <fs_field_new>,
                   <fs_field_old>.

        ENDDO.

        UPDATE zim_elencos SET posicao = ls_elenco-posicao
                                camisa = ls_elenco-camisa
                        WHERE id_clube = lv_id_clube
                        AND id_jogador = lv_id_jogador.

        IF sy-subrc = 0.

          er_entity = CORRESPONDING #( ls_elenco ). "Fill exporting parameter ER_ENTITY

        ENDIF.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD estadiosset_create_entity.

    DATA: l_request_input_data TYPE zcl_zim_clubes_mpc=>ts_estadiossettype,
          l_zim_estadio        TYPE zim_estadios,
          l_returncode         TYPE inri-returncode,
          l_id_clube           TYPE zim_id.

* Read Request Data
    io_data_provider->read_entry_data( IMPORTING es_data = l_request_input_data ).

    IF l_request_input_data-id_estadio IS NOT INITIAL AND
       l_request_input_data-nome_estadio IS NOT INITIAL.

      SELECT SINGLE * INTO @DATA(ls_estadio) FROM zim_estadios WHERE id_estadio = @l_request_input_data-id_estadio.
      IF sy-subrc NE 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( l_zim_estadio ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        DO lines( lt_comp ) TIMES.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_zim_estadio TO FIELD-SYMBOL(<fs_field_create>).

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_request_input_data TO FIELD-SYMBOL(<fs_field_web>).

          IF <fs_field_create> IS ASSIGNED AND <fs_field_web> IS ASSIGNED.
            <fs_field_create> = <fs_field_web>.
          ENDIF.

          UNASSIGN:
                   <fs_field_create>,
                   <fs_field_web>.

        ENDDO.

        IF l_zim_estadio IS NOT INITIAL.

          GET TIME STAMP FIELD DATA(l_createdat).
          l_zim_estadio-created_at = l_createdat.
          l_zim_estadio-created_by = sy-uname.

          INSERT zim_estadios FROM l_zim_estadio.

          IF sy-subrc = 0.

            er_entity = CORRESPONDING #( l_zim_estadio ). "Fill Exporting parameter ER_ENTITY

          ENDIF.

        ENDIF.

      ELSE.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD estadiosset_delete_entity.

    DATA(l_id_key) = VALUE #( it_key_tab[ name = 'id_estadio' ]-value OPTIONAL ).
    IF l_id_key IS NOT INITIAL.

* Delete record from table ZUSERINFO
      DELETE FROM zim_estadios WHERE id_estadio = l_id_key.

    ENDIF.

  ENDMETHOD.


  method ESTADIOSSET_UPDATE_ENTITY.

    DATA: ls_request_input_data TYPE zcl_zim_clubes_mpc=>ts_estadiossettype.

* Get key values
    DATA(lv_id_key) = VALUE #( it_key_tab[ name = 'id_estadio' ]-value OPTIONAL ).

    IF lv_id_key IS NOT INITIAL.

* Read request data
      io_data_provider->read_entry_data( IMPORTING es_data = ls_request_input_data ).

      SELECT SINGLE * INTO @DATA(ls_estadio) FROM zim_estadios WHERE id_estadio = @lv_id_key.
      IF sy-subrc EQ 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( ls_estadio ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        DO lines( lt_comp ) TIMES.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_estadio TO FIELD-SYMBOL(<fs_field_old>).

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_request_input_data TO FIELD-SYMBOL(<fs_field_new>).

          IF <fs_field_new> IS ASSIGNED AND <fs_field_old> IS ASSIGNED.
            <fs_field_old> = <fs_field_new>.
          ENDIF.

          UNASSIGN:
                   <fs_field_new>,
                   <fs_field_old>.

        ENDdo.

* Update fields of table ZBOOKS
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


  METHOD jogadoresset_create_entity.

    DATA: l_request_input_data TYPE zcl_zim_clubes_mpc=>ts_jogadoressettype,
          l_zim_jogador        TYPE zim_jogadores,
          l_returncode         TYPE inri-returncode,
          l_id_jogador         TYPE zim_id.

* Read Request Data
    io_data_provider->read_entry_data( IMPORTING es_data = l_request_input_data ).

    IF l_request_input_data-id_jogador IS NOT INITIAL AND
       l_request_input_data-nome_jogador IS NOT INITIAL.

      SELECT SINGLE * INTO @DATA(ls_jogador) FROM zim_jogadores WHERE id_jogador = @l_request_input_data-id_jogador.
      IF sy-subrc NE 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( l_zim_jogador ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        DO lines( lt_comp ) TIMES.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_zim_jogador TO FIELD-SYMBOL(<fs_field_create>).

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_request_input_data TO FIELD-SYMBOL(<fs_field_web>).

          IF <fs_field_create> IS ASSIGNED AND <fs_field_web> IS ASSIGNED.
            <fs_field_create> = <fs_field_web>.
          ENDIF.

          UNASSIGN:
                   <fs_field_create>,
                   <fs_field_web>.

        ENDDO.

        IF l_zim_jogador IS NOT INITIAL.

          GET TIME STAMP FIELD DATA(l_createdat).
          l_zim_jogador-created_at = l_createdat.
          l_zim_jogador-created_by = sy-uname.

          INSERT zim_jogadores FROM l_zim_jogador.

          IF sy-subrc = 0.

            er_entity = CORRESPONDING #( l_zim_jogador ). "Fill Exporting parameter ER_ENTITY

          ENDIF.

        ENDIF.

      ELSE.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD jogadoresset_delete_entity.

    DATA(l_id_key) = VALUE #( it_key_tab[ name = 'id_jogador' ]-value OPTIONAL ).
    IF l_id_key IS NOT INITIAL.

* Delete record from table ZUSERINFO
      DELETE FROM zim_jogadores WHERE id_jogador = l_id_key.

    ENDIF.

  ENDMETHOD.


  METHOD jogadoresset_update_entity.

    DATA: ls_request_input_data TYPE zcl_zim_clubes_mpc=>ts_jogadoressettype.

* Get key values
    DATA(lv_id_key) = VALUE #( it_key_tab[ name = 'id_jogador' ]-value OPTIONAL ).

    IF lv_id_key IS NOT INITIAL.

* Read request data
      io_data_provider->read_entry_data( IMPORTING es_data = ls_request_input_data ).

      SELECT SINGLE * INTO @DATA(ls_jogador) FROM zim_jogadores WHERE id_jogador = @lv_id_key.
      IF sy-subrc EQ 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( ls_jogador ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        DO lines( lt_comp ) TIMES.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_jogador TO FIELD-SYMBOL(<fs_field_old>).

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_request_input_data TO FIELD-SYMBOL(<fs_field_new>).

          IF <fs_field_new> IS ASSIGNED AND <fs_field_old> IS ASSIGNED.
            <fs_field_old> = <fs_field_new>.
          ENDIF.

          UNASSIGN:
                   <fs_field_new>,
                   <fs_field_old>.

        ENDDO.

        UPDATE zim_jogadores SET nome_jogador = ls_jogador-nome_jogador
                                   changed_at = ls_jogador-changed_at
                                   changed_by = sy-uname
                             WHERE id_jogador = lv_id_key.

        IF sy-subrc = 0.

          er_entity = CORRESPONDING #( ls_jogador ). "Fill exporting parameter ER_ENTITY

        ENDIF.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD partidashdrset_create_entity.

    DATA:
      l_request_input_data TYPE zcl_zim_clubes_mpc=>ts_partidashdrsettype,
      l_zim_partida_k      TYPE zim_partidas_k,
      l_returncode         TYPE inri-returncode,
      l_id_partida_k       TYPE zim_id.

* Read Request Data
    io_data_provider->read_entry_data( IMPORTING es_data = l_request_input_data ).

    SELECT SINGLE * INTO @DATA(ls_partida_k) FROM zim_partidas_k WHERE id_partida = @l_request_input_data-id_partida.
    IF sy-subrc NE 0.

      IF l_request_input_data-id_partida IS INITIAL.
        SELECT MAX( id_partida ) FROM zim_partidas_k INTO @DATA(l_id_partida).
        l_request_input_data-id_partida = l_id_partida + 1.
      ENDIF.

      DATA(l_subrc) = sy-subrc.
      DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
      lr_structdescr ?= cl_abap_structdescr=>describe_by_data( l_zim_partida_k ).
      DATA(lt_comp) = lr_structdescr->get_components( ).

      DO lines( lt_comp ) TIMES.

        ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_zim_partida_k TO FIELD-SYMBOL(<fs_field_create>).

        ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_request_input_data TO FIELD-SYMBOL(<fs_field_web>).

        IF <fs_field_create> IS ASSIGNED AND <fs_field_web> IS ASSIGNED.
          <fs_field_create> = <fs_field_web>.
        ENDIF.

        UNASSIGN:
                 <fs_field_create>,
                 <fs_field_web>.

      ENDDO.

      IF l_zim_partida_k IS NOT INITIAL.
*          GET TIME STAMP FIELD DATA(l_createdat).
*          l_zim_partida_k-created_at = l_createdat.
*          l_zim_partida_k-created_by = sy-uname.

        INSERT zim_partidas_k FROM l_zim_partida_k.

        IF sy-subrc = 0.

          er_entity = CORRESPONDING #( l_zim_partida_k ). "Fill Exporting parameter ER_ENTITY

        ENDIF.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  method PARTIDASHDRSET_DELETE_ENTITY.

    DATA(l_id_key) = VALUE #( it_key_tab[ name = 'id_partida' ]-value OPTIONAL ).
    IF l_id_key IS NOT INITIAL.

* Delete record from table ZUSERINFO
      DELETE FROM zim_partidas_k WHERE id_partida = l_id_key.

    ENDIF.

  endmethod.


  METHOD partidashdrset_update_entity.

    DATA: ls_request_input_data TYPE zcl_zim_clubes_mpc=>ts_partidashdrsettype.

* Get key values
    DATA(lv_id_key) = VALUE #( it_key_tab[ name = 'id_partida' ]-value OPTIONAL ).

    IF lv_id_key IS NOT INITIAL.

* Read request data
      io_data_provider->read_entry_data( IMPORTING es_data = ls_request_input_data ).

      SELECT SINGLE * INTO @DATA(ls_partida) FROM zim_partidas_k WHERE id_partida = @lv_id_key.
      IF sy-subrc EQ 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( ls_partida ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        DO lines( lt_comp ) TIMES.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_partida TO FIELD-SYMBOL(<fs_field_old>).

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_request_input_data TO FIELD-SYMBOL(<fs_field_new>).

          IF <fs_field_new> IS ASSIGNED AND <fs_field_old> IS ASSIGNED.
            <fs_field_old> = <fs_field_new>.
          ENDIF.

          UNASSIGN:
                   <fs_field_new>,
                   <fs_field_old>.

        ENDDO.

* Update fields of table ZBOOKS
        GET TIME STAMP FIELD DATA(l_changedat).

        UPDATE zim_partidas_k SET data_partida = ls_partida-data_partida
                                     id_rodada = ls_partida-id_rodada
                                    id_estadio = ls_partida-id_estadio
                                       publico = ls_partida-publico
                                         renda = ls_partida-renda
                                         moeda = ls_partida-moeda
                              WHERE id_partida = lv_id_key.

        IF sy-subrc = 0.

          er_entity = CORRESPONDING #( ls_partida ). "Fill exporting parameter ER_ENTITY

        ENDIF.

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD partidasitmset_create_entity.

    DATA:
      l_request_input_data TYPE zcl_zim_clubes_mpc=>ts_partidasitmsettype,
      l_zim_partida_p      TYPE zim_partidas_p,
      l_returncode         TYPE inri-returncode,
      l_id_partida_p       TYPE zim_id.

* Read Request Data
    io_data_provider->read_entry_data( IMPORTING es_data = l_request_input_data ).

    IF l_request_input_data-id_partida IS INITIAL.
      l_request_input_data-id_partida = VALUE #( it_key_tab[ name = 'id_partida' ]-value OPTIONAL ).
    ENDIF.

    SELECT SINGLE * INTO @DATA(ls_partida_p)
      FROM zim_partidas_p
     WHERE id_partida = @l_request_input_data-id_partida
       AND id_item = @l_request_input_data-id_item.

    IF sy-subrc NE 0.

      IF l_request_input_data-id_item IS INITIAL.
        SELECT MAX( id_item ) FROM zim_partidas_p WHERE id_partida = @l_request_input_data-id_partida INTO @DATA(l_item).
        l_request_input_data-id_item = l_item + 1.
      ENDIF.

      DATA(l_subrc) = sy-subrc.
      DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
      lr_structdescr ?= cl_abap_structdescr=>describe_by_data( l_zim_partida_p ).
      DATA(lt_comp) = lr_structdescr->get_components( ).

      DO lines( lt_comp ) TIMES.

        ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_zim_partida_p TO FIELD-SYMBOL(<fs_field_create>).

        ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE l_request_input_data TO FIELD-SYMBOL(<fs_field_web>).

        IF <fs_field_create> IS ASSIGNED AND <fs_field_web> IS ASSIGNED.
          <fs_field_create> = <fs_field_web>.
        ENDIF.

        UNASSIGN:
                 <fs_field_create>,
                 <fs_field_web>.

      ENDDO.

      IF l_zim_partida_p IS NOT INITIAL.
*          GET TIME STAMP FIELD DATA(l_createdat).
*          l_zim_partida_p-created_at = l_createdat.
*          l_zim_partida_p-created_by = sy-uname.

        INSERT zim_partidas_p FROM l_zim_partida_p.

        IF sy-subrc = 0.

          er_entity = CORRESPONDING #( l_zim_partida_p ). "Fill Exporting parameter ER_ENTITY

        ENDIF.

      ENDIF.


    ENDIF.

  ENDMETHOD.


  METHOD partidasitmset_delete_entity.

    DATA(l_id_partida) = VALUE #( it_key_tab[ name = 'id_partida' ]-value OPTIONAL ).
    DATA(l_id_item) = VALUE #( it_key_tab[ name = 'id_item' ]-value OPTIONAL ).

    IF l_id_partida IS NOT INITIAL AND
       l_id_item IS NOT INITIAL.

      DELETE FROM zim_partidas_p WHERE id_partida = l_id_partida
                                   AND id_item = l_id_item.

    ENDIF.

  ENDMETHOD.


  METHOD partidasitmset_update_entity.

    DATA: ls_request_input_data TYPE zcl_zim_clubes_mpc=>ts_partidasitmsettype.

* Get key values
    DATA(lv_id_partida) = VALUE #( it_key_tab[ name = 'id_partida' ]-value OPTIONAL ).
    DATA(lv_id_item) = VALUE #( it_key_tab[ name = 'id_item' ]-value OPTIONAL ).

    IF lv_id_partida IS NOT INITIAL AND
       lv_id_item IS NOT INITIAL.

* Read request data
      io_data_provider->read_entry_data( IMPORTING es_data = ls_request_input_data ).

      SELECT SINGLE * INTO @DATA(ls_partida_p) FROM zim_partidas_p WHERE id_partida = @lv_id_partida.
      IF sy-subrc EQ 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( ls_partida_p ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        DO lines( lt_comp ) TIMES.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_partida_p TO FIELD-SYMBOL(<fs_field_old>).

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_request_input_data TO FIELD-SYMBOL(<fs_field_new>).

          IF <fs_field_new> IS ASSIGNED AND <fs_field_old> IS ASSIGNED.
            <fs_field_old> = <fs_field_new>.
          ENDIF.

          UNASSIGN:
                   <fs_field_new>,
                   <fs_field_old>.
        ENDDO.

        UPDATE zim_partidas_p SET   id_clube = ls_partida_p-id_clube
                                      placar = ls_partida_p-placar
                                      pontos = ls_partida_p-pontos
                            WHERE id_partida = lv_id_partida
                                 AND id_item = lv_id_item.

        IF sy-subrc = 0.

          er_entity = CORRESPONDING #( ls_partida_p ). "Fill exporting parameter ER_ENTITY

        ENDIF.

      ENDIF.

    ENDIF.

  ENDMETHOD.
ENDCLASS.
