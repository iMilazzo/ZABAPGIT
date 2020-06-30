class ZCL_ZIM_CLUBES_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  interfaces IF_SADL_GW_MODEL_EXPOSURE_DATA .

  types:
   TS_ZIM_C_CLUBESTYPE type ZIMCCLUBES .
  types:
   TT_ZIM_C_CLUBESTYPE type standard table of TS_ZIM_C_CLUBESTYPE .
  types:
   TS_ZIM_I_ELENCOS_BASICTYPE type ZIMIELENCOSBASIC .
  types:
   TT_ZIM_I_ELENCOS_BASICTYPE type standard table of TS_ZIM_I_ELENCOS_BASICTYPE .
  types:
   TS_ZIM_I_ESTADIOS_BASIC_TOTTYP type ZIMIESTADBASTOT .
  types:
   TT_ZIM_I_ESTADIOS_BASIC_TOTTYP type standard table of TS_ZIM_I_ESTADIOS_BASIC_TOTTYP .
  types:
   TS_ZIM_I_PARTIDASP_BASICTYPE type ZIMIPARTIDASPBAS .
  types:
   TT_ZIM_I_PARTIDASP_BASICTYPE type standard table of TS_ZIM_I_PARTIDASP_BASICTYPE .

  constants GC_ZIM_C_CLUBESTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZIM_C_CLUBESType' ##NO_TEXT.
  constants GC_ZIM_I_ELENCOS_BASICTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZIM_I_ELENCOS_BASICType' ##NO_TEXT.
  constants GC_ZIM_I_ESTADIOS_BASIC_TOTTYP type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZIM_I_ESTADIOS_BASIC_TOTType' ##NO_TEXT.
  constants GC_ZIM_I_PARTIDASP_BASICTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ZIM_I_PARTIDASP_BASICType' ##NO_TEXT.

  methods DEFINE
    redefinition .
  methods GET_LAST_MODIFIED
    redefinition .
protected section.
private section.

  methods DEFINE_RDS_4
    raising
      /IWBEP/CX_MGW_MED_EXCEPTION .
  methods GET_LAST_MODIFIED_RDS_4
    returning
      value(RV_LAST_MODIFIED_RDS) type TIMESTAMP .
ENDCLASS.



CLASS ZCL_ZIM_CLUBES_MPC IMPLEMENTATION.


  method DEFINE.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*

model->set_schema_namespace( 'ZIM_CLUBES_SRV' ).

define_rds_4( ).
get_last_modified_rds_4( ).
  endmethod.


  method DEFINE_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
    TRY.
        if_sadl_gw_model_exposure_data~get_model_exposure( )->expose( model )->expose_vocabulary( vocab_anno_model ).
      CATCH cx_sadl_exposure_error INTO DATA(lx_sadl_exposure_error).
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_med_exception
          EXPORTING
            previous = lx_sadl_exposure_error.
    ENDTRY.
  endmethod.


  method GET_LAST_MODIFIED.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS         &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL  &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                   &*
*&                                                                     &*
*&---------------------------------------------------------------------*


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20200628234749'.                  "#EC NOTEXT
 DATA: lv_rds_last_modified TYPE timestamp .
  rv_last_modified = super->get_last_modified( ).
  IF rv_last_modified LT lc_gen_date_time.
    rv_last_modified = lc_gen_date_time.
  ENDIF.
 lv_rds_last_modified =  GET_LAST_MODIFIED_RDS_4( ).
 IF rv_last_modified LT lv_rds_last_modified.
 rv_last_modified  = lv_rds_last_modified .
 ENDIF .
  endmethod.


  method GET_LAST_MODIFIED_RDS_4.
*&---------------------------------------------------------------------*
*&           Generated code for the MODEL PROVIDER BASE CLASS          &*
*&                                                                     &*
*&  !!!NEVER MODIFY THIS CLASS. IN CASE YOU WANT TO CHANGE THE MODEL   &*
*&        DO THIS IN THE MODEL PROVIDER SUBCLASS!!!                    &*
*&                                                                     &*
*&---------------------------------------------------------------------*
*   This code is generated for Reference Data Source
*   4
*&---------------------------------------------------------------------*
    CONSTANTS: co_gen_date_time TYPE timestamp VALUE '20200629024750'.
    TRY.
        rv_last_modified_rds = CAST cl_sadl_gw_model_exposure( if_sadl_gw_model_exposure_data~get_model_exposure( ) )->get_last_modified( ).
      CATCH cx_root.
        rv_last_modified_rds = co_gen_date_time.
    ENDTRY.
    IF rv_last_modified_rds < co_gen_date_time.
      rv_last_modified_rds = co_gen_date_time.
    ENDIF.
  endmethod.


  method IF_SADL_GW_MODEL_EXPOSURE_DATA~GET_MODEL_EXPOSURE.
    CONSTANTS: co_gen_timestamp TYPE timestamp VALUE '20200629024750'.
    DATA(lv_sadl_xml) =
               |<?xml version="1.0" encoding="utf-16"?>|  &
               |<sadl:definition xmlns:sadl="http://sap.com/sap.nw.f.sadl" syntaxVersion="" >|  &
               | <sadl:dataSource type="CDS" name="ZIM_C_CLUBES" binding="ZIM_C_CLUBES" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_I_ELENCOS_BASIC" binding="ZIM_I_ELENCOS_BASIC" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_I_ESTADIOS_BASIC_TOT" binding="ZIM_I_ESTADIOS_BASIC_TOT" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_I_PARTIDASP_BASIC" binding="ZIM_I_PARTIDASP_BASIC" />|  &
               |<sadl:resultSet>|  &
               |<sadl:structure name="ZIM_C_CLUBES" dataSource="ZIM_C_CLUBES" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_ELENCO" binding="_ELENCO" target="ZIM_I_ELENCOS_BASIC" cardinality="zeroToMany" />|  &
               | <sadl:association name="TO_ESTADIO" binding="_ESTADIO" target="ZIM_I_ESTADIOS_BASIC_TOT" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_PARTIDASITM" binding="_PARTIDASITM" target="ZIM_I_PARTIDASP_BASIC" cardinality="zeroToMany" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZIM_I_ELENCOS_BASIC" dataSource="ZIM_I_ELENCOS_BASIC" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZIM_I_ESTADIOS_BASIC_TOT" dataSource="ZIM_I_ESTADIOS_BASIC_TOT" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ZIM_I_PARTIDASP_BASIC" dataSource="ZIM_I_PARTIDASP_BASIC" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |</sadl:resultSet>|  &
               |</sadl:definition>| .

   ro_model_exposure = cl_sadl_gw_model_exposure=>get_exposure_xml( iv_uuid      = CONV #( 'ZIM_CLUBES' )
                                                                    iv_timestamp = co_gen_timestamp
                                                                    iv_sadl_xml  = lv_sadl_xml ).
  endmethod.
ENDCLASS.
