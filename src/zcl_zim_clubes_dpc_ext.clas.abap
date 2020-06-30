class ZCL_ZIM_CLUBES_DPC_EXT definition
  public
  inheriting from ZCL_ZIM_CLUBES_DPC
  create public .

public section.
protected section.

  methods ZIM_C_CLUBES_CREATE_ENTITY
    redefinition .
  methods ZIM_C_CLUBES_DELETE_ENTITY
    redefinition .
  methods ZIM_C_CLUBES_UPDATE_ENTITY
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZIM_CLUBES_DPC_EXT IMPLEMENTATION.


  METHOD zim_c_clubes_create_entity.
**TRY.
*CALL METHOD SUPER->ZIM_C_CLUBES_CREATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**    io_data_provider        =
**  IMPORTING
**    er_entity               =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
    DATA:
      ls_data  TYPE zcl_zim_clubes_mpc=>ts_zim_c_clubestype,
      lx_os_ex TYPE REF TO cx_os_object_existing.

    io_data_provider->read_entry_data( IMPORTING es_data = ls_data ).

    CONVERT DATE sy-datlo TIME sy-timlo INTO TIME STAMP DATA(l_timestamp) TIME ZONE sy-zonlo.

    TRY.

        er_entity = VALUE #(
                      LET lo_data = zca_zim_clubes=>agent->create_persistent(
                       i_id_clube = ls_data-id_clube
                     i_id_estadio = ls_data-id_estadio
                      i_nome_time = ls_data-nome_time
                  i_nome_completo = ls_data-nome_completo
                       i_fundacao = ls_data-fundacao
                   i_nome_tecnico = ls_data-nome_tecnico
                     i_created_by = sy-uname
                     i_created_at = l_timestamp )
                   IN
                         id_clube = lo_data->get_id_clube( )
                       id_estadio = lo_data->get_id_estadio( )
                        nome_time = lo_data->get_nome_time( )
                    nome_completo = lo_data->get_nome_completo( )
                         fundacao = lo_data->get_fundacao( )
                     nome_tecnico = lo_data->get_nome_tecnico( )
                       created_at = lo_data->get_created_at( )
                       created_by = lo_data->get_created_by( )
                       changed_at = lo_data->get_changed_at( )
                       changed_by = lo_data->get_changed_by( ) ).

        COMMIT WORK.

      CATCH cx_os_object_existing INTO lx_os_ex.
        "TODO: Error handling goes here...
    ENDTRY.

  ENDMETHOD.


  METHOD zim_c_clubes_delete_entity.
**TRY.
*CALL METHOD SUPER->ZIM_C_CLUBES_DELETE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
    DATA:
      lx_os_ex         TYPE REF TO cx_os_object_existing,
      lx_obj_not_found TYPE REF TO cx_os_object_not_found..

    CHECK it_key_tab[] IS NOT INITIAL.

    TRY.

        DATA(lo_zim_clubes) = zca_zim_clubes=>agent->get_persistent(
                             i_id_clube = VALUE #( it_key_tab[ name = |id_clube| ]-value OPTIONAL ) ).

        zca_zim_clubes=>agent->if_os_factory~delete_persistent( lo_zim_clubes ).

        COMMIT WORK.

      CATCH cx_os_object_existing INTO lx_os_ex.
        "TODO: Error handling goes here...
      CATCH cx_os_object_not_found INTO lx_obj_not_found.
        "TODO: Error handling goes here...

    ENDTRY.

  ENDMETHOD.


  method ZIM_C_CLUBES_UPDATE_ENTITY.
**TRY.
*CALL METHOD SUPER->ZIM_C_CLUBES_UPDATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**    io_data_provider        =
**  IMPORTING
**    er_entity               =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.

    DATA:
      ls_zim_clubes    TYPE zcl_zim_clubes_mpc=>ts_zim_c_clubestype,
      lx_os_ex         TYPE REF TO cx_os_object_existing,
      lx_obj_not_found TYPE REF TO cx_os_object_not_found..

    CHECK it_key_tab[] IS NOT INITIAL.

    io_data_provider->read_entry_data( IMPORTING es_data = ls_zim_clubes ).

    CONVERT DATE sy-datlo TIME sy-timlo INTO TIME STAMP DATA(l_timestamp) TIME ZONE sy-zonlo.
    data(l_id_clube) = VALUE #( it_key_tab[ name = |id_clube| ]-value OPTIONAL ).

    TRY.

        DATA(lo_zim_clubes) = zca_zim_clubes=>agent->get_persistent(
                             i_id_clube = VALUE #( it_key_tab[ name = |id_clube| ]-value OPTIONAL ) ).

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( ls_zim_clubes ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        WHILE l_subrc = 0.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_zim_clubes TO FIELD-SYMBOL(<fs_field_set>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          IF <fs_field_set> IS NOT INITIAL.

            DATA(meth) = |SET_| && lt_comp[ sy-index ]-name.
            DATA(ptab) = VALUE abap_parmbind_tab( ( name = 'I_' && lt_comp[ sy-index ]-name
                                                     kind = cl_abap_objectdescr=>exporting
                                                    value = REF #( <fs_field_set> ) ) ).
            CALL METHOD lo_zim_clubes->(meth)
              PARAMETER-TABLE
                ptab.

          ENDIF.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE er_entity TO FIELD-SYMBOL(<fs_field_get>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          meth = |GET_| && lt_comp[ sy-index ]-name.
          ptab = VALUE abap_parmbind_tab( ( name = 'I_' && lt_comp[ sy-index ]-name
                                            kind = cl_abap_objectdescr=>importing
                                           value = REF #( <fs_field_get> ) ) ).

          CALL METHOD lo_zim_clubes->(meth)
            PARAMETER-TABLE
              ptab.

        ENDWHILE.

        COMMIT WORK.

      CATCH cx_os_object_existing INTO lx_os_ex.
        "TODO: Error handling goes here...
      CATCH cx_os_object_not_found INTO lx_obj_not_found.
        "TODO: Error handling goes here...

    ENDTRY.


  endmethod.
ENDCLASS.
