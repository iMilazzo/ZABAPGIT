class ZCL_ZIM_CLUBES_MPC definition
  public
  inheriting from /IWBEP/CL_MGW_PUSH_ABS_MODEL
  create public .

public section.

  interfaces IF_SADL_GW_MODEL_EXPOSURE_DATA .

  types:
    begin of TS_SEPM_I_CURRENCYTYPE.
      include type SEPM_ICURRENCY.
  types:
      T_CURRENCY type SEPM_ICURRENCYT-CURRENCYNAME,
    end of TS_SEPM_I_CURRENCYTYPE .
  types:
   TT_SEPM_I_CURRENCYTYPE type standard table of TS_SEPM_I_CURRENCYTYPE .
  types:
   TS_SEPM_I_CURRENCYTEXTTYPE type SEPM_ICURRENCYT .
  types:
   TT_SEPM_I_CURRENCYTEXTTYPE type standard table of TS_SEPM_I_CURRENCYTEXTTYPE .
  types:
    begin of TS_SEPM_I_LANGUAGETYPE.
      include type SEPM_ILANGUAGE.
  types:
      T_LANGUAGE type SEPM_ILANGUAGET-LANGUAGENAME,
    end of TS_SEPM_I_LANGUAGETYPE .
  types:
   TT_SEPM_I_LANGUAGETYPE type standard table of TS_SEPM_I_LANGUAGETYPE .
  types:
   TS_SEPM_I_LANGUAGETEXTTYPE type SEPM_ILANGUAGET .
  types:
   TT_SEPM_I_LANGUAGETEXTTYPE type standard table of TS_SEPM_I_LANGUAGETEXTTYPE .
  types:
   TS_CLUBESSETTYPE type ZIMCCLUBES .
  types:
   TT_CLUBESSETTYPE type standard table of TS_CLUBESSETTYPE .
  types:
   TS_DESCRIPTIONSSETTYPE type ZIMCCLUBESDESC .
  types:
   TT_DESCRIPTIONSSETTYPE type standard table of TS_DESCRIPTIONSSETTYPE .
  types:
   TS_LOGOSSETTYPE type ZIMCCLUBESLOGO .
  types:
   TT_LOGOSSETTYPE type standard table of TS_LOGOSSETTYPE .
  types:
   TS_ELENCOSSETTYPE type ZIMCELENCOS .
  types:
   TT_ELENCOSSETTYPE type standard table of TS_ELENCOSSETTYPE .
  types:
   TS_ESTADIOSSETTYPE type ZIMCESTADIOS .
  types:
   TT_ESTADIOSSETTYPE type standard table of TS_ESTADIOSSETTYPE .
  types:
   TS_JOGADORESSETTYPE type ZIMIJOGADOR .
  types:
   TT_JOGADORESSETTYPE type standard table of TS_JOGADORESSETTYPE .
  types:
   TS_PARTIDASHDRSETTYPE type ZIMCPARTIDAS .
  types:
   TT_PARTIDASHDRSETTYPE type standard table of TS_PARTIDASHDRSETTYPE .
  types:
   TS_PARTIDASITMSETTYPE type ZIMCPARTIDASP .
  types:
   TT_PARTIDASITMSETTYPE type standard table of TS_PARTIDASITMSETTYPE .
  types:
   TS_CLUBESVHSETTYPE type ZIMICLUBESVH .
  types:
   TT_CLUBESVHSETTYPE type standard table of TS_CLUBESVHSETTYPE .
  types:
   TS_ESTADIOSVHSETTYPE type ZIMIESTADIOSVH .
  types:
   TT_ESTADIOSVHSETTYPE type standard table of TS_ESTADIOSVHSETTYPE .
  types:
   TS_JOGADORESVHSETTYPE type ZIMIJOGADORVH .
  types:
   TT_JOGADORESVHSETTYPE type standard table of TS_JOGADORESVHSETTYPE .

  constants GC_CLUBESSETTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ClubesSetType' ##NO_TEXT.
  constants GC_CLUBESVHSETTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ClubesVHSetType' ##NO_TEXT.
  constants GC_DESCRIPTIONSSETTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'DescriptionsSetType' ##NO_TEXT.
  constants GC_ELENCOSSETTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'ElencosSetType' ##NO_TEXT.
  constants GC_ESTADIOSSETTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'EstadiosSetType' ##NO_TEXT.
  constants GC_ESTADIOSVHSETTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'EstadiosVHSetType' ##NO_TEXT.
  constants GC_JOGADORESSETTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'JogadoresSetType' ##NO_TEXT.
  constants GC_JOGADORESVHSETTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'JogadoresVHSetType' ##NO_TEXT.
  constants GC_LOGOSSETTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'LogosSetType' ##NO_TEXT.
  constants GC_PARTIDASHDRSETTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'PartidasHdrSetType' ##NO_TEXT.
  constants GC_PARTIDASITMSETTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'PartidasItmSetType' ##NO_TEXT.
  constants GC_SEPM_I_CURRENCYTEXTTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SEPM_I_CurrencyTextType' ##NO_TEXT.
  constants GC_SEPM_I_CURRENCYTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SEPM_I_CurrencyType' ##NO_TEXT.
  constants GC_SEPM_I_LANGUAGETEXTTYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SEPM_I_LanguageTextType' ##NO_TEXT.
  constants GC_SEPM_I_LANGUAGETYPE type /IWBEP/IF_MGW_MED_ODATA_TYPES=>TY_E_MED_ENTITY_NAME value 'SEPM_I_LanguageType' ##NO_TEXT.

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


  CONSTANTS: lc_gen_date_time TYPE timestamp VALUE '20200709160458'.                  "#EC NOTEXT
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
    CONSTANTS: co_gen_date_time TYPE timestamp VALUE '20200709160458'.
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
    CONSTANTS: co_gen_timestamp TYPE timestamp VALUE '20200709160458'.
    DATA(lv_sadl_xml) =
               |<?xml version="1.0" encoding="utf-16"?>|  &
               |<sadl:definition xmlns:sadl="http://sap.com/sap.nw.f.sadl" syntaxVersion="" >|  &
               | <sadl:dataSource type="CDS" name="SEPM_I_CURRENCY" binding="SEPM_I_CURRENCY" />|  &
               | <sadl:dataSource type="CDS" name="SEPM_I_CURRENCYTEXT" binding="SEPM_I_CURRENCYTEXT" />|  &
               | <sadl:dataSource type="CDS" name="SEPM_I_LANGUAGE" binding="SEPM_I_LANGUAGE" />|  &
               | <sadl:dataSource type="CDS" name="SEPM_I_LANGUAGETEXT" binding="SEPM_I_LANGUAGETEXT" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_C_CLUBES" binding="ZIM_C_CLUBES" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_C_CLUBES_DESC" binding="ZIM_C_CLUBES_DESC" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_C_CLUBES_LOGO" binding="ZIM_C_CLUBES_LOGO" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_C_ELENCOS" binding="ZIM_C_ELENCOS" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_C_ESTADIOS" binding="ZIM_C_ESTADIOS" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_C_JOGADORES" binding="ZIM_C_JOGADORES" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_C_PARTIDASK" binding="ZIM_C_PARTIDASK" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_C_PARTIDASP" binding="ZIM_C_PARTIDASP" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_I_CLUBES_VH" binding="ZIM_I_CLUBES_VH" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_I_ESTADIOS_VH" binding="ZIM_I_ESTADIOS_VH" />|  &
               | <sadl:dataSource type="CDS" name="ZIM_I_JOGADOR_VH" binding="ZIM_I_JOGADOR_VH" />|  &
               |<sadl:resultSet>|  &
               |<sadl:structure name="SEPM_I_Currency" dataSource="SEPM_I_CURRENCY" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_TEXT" binding="_TEXT" target="SEPM_I_CurrencyText" cardinality="zeroToMany" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="SEPM_I_CurrencyText" dataSource="SEPM_I_CURRENCYTEXT" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_CURRENCY" binding="_CURRENCY" target="SEPM_I_Currency" cardinality="one" />|  &
               | <sadl:association name="TO_LANGUAGE" binding="_LANGUAGE" target="SEPM_I_Language" cardinality="zeroToOne" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="SEPM_I_Language" dataSource="SEPM_I_LANGUAGE" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_TEXT" binding="_TEXT" target="SEPM_I_LanguageText" cardinality="zeroToMany" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="SEPM_I_LanguageText" dataSource="SEPM_I_LANGUAGETEXT" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_LANGUAGE" binding="_LANGUAGE" target="SEPM_I_Language" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_TRANSLATIONLANGUAGE" binding="_TRANSLATIONLANGUAGE" target="SEPM_I_Language" cardinality="zeroToOne" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ClubesSet" dataSource="ZIM_C_CLUBES" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_DESC" binding="_DESC" target="DescriptionsSet" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_ELENCO" binding="_ELENCO" target="ElencosSet" cardinality="oneToMany" />|  &
               | <sadl:association name="TO_ESTADIO" binding="_ESTADIO" target="EstadiosSet" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_ITEMS" binding="_ITEMS" target="PartidasItmSet" cardinality="zeroToMany" />|  &
               | <sadl:association name="TO_LOGO" binding="_LOGO" target="LogosSet" cardinality="zeroToOne" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="DescriptionsSet" dataSource="ZIM_C_CLUBES_DESC" maxEditMode="RO" exposure="TRUE" >| .
      lv_sadl_xml = |{ lv_sadl_xml }| &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_CLUBE" binding="_CLUBE" target="ClubesSet" cardinality="zeroToOne" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="LogosSet" dataSource="ZIM_C_CLUBES_LOGO" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_CLUBE" binding="_CLUBE" target="ClubesSet" cardinality="zeroToOne" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ElencosSet" dataSource="ZIM_C_ELENCOS" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_CLUBE" binding="_CLUBE" target="ClubesSet" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_JOGADOR" binding="_JOGADOR" target="JogadoresSet" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_JOGADORVH" binding="_JOGADORVH" target="JogadoresVHSet" cardinality="zeroToOne" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="EstadiosSet" dataSource="ZIM_C_ESTADIOS" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_CLUBES" binding="_CLUBES" target="ClubesSet" cardinality="zeroToMany" />|  &
               | <sadl:association name="TO_PARTIDASHDR" binding="_PARTIDASHDR" target="PartidasHdrSet" cardinality="zeroToMany" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="JogadoresSet" dataSource="ZIM_C_JOGADORES" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_ELENCO" binding="_ELENCO" target="ElencosSet" cardinality="zeroToMany" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="PartidasHdrSet" dataSource="ZIM_C_PARTIDASK" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_CURRENCY" binding="_CURRENCY" target="SEPM_I_Currency" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_ESTADIO" binding="_ESTADIO" target="EstadiosSet" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_ESTADIOVH" binding="_ESTADIOVH" target="EstadiosVHSet" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_ITEMS" binding="_ITEMS" target="PartidasItmSet" cardinality="zeroToMany" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="PartidasItmSet" dataSource="ZIM_C_PARTIDASP" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               | <sadl:association name="TO_CLUBE" binding="_CLUBE" target="ClubesSet" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_CLUBEVH" binding="_CLUBEVH" target="ClubesVHSet" cardinality="zeroToOne" />|  &
               | <sadl:association name="TO_HEADER" binding="_HEADER" target="PartidasHdrSet" cardinality="zeroToOne" />|  &
               |</sadl:structure>|  &
               |<sadl:structure name="ClubesVHSet" dataSource="ZIM_I_CLUBES_VH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>|  &
               |<sadl:structure name="EstadiosVHSet" dataSource="ZIM_I_ESTADIOS_VH" maxEditMode="RO" exposure="TRUE" >|  &
               | <sadl:query name="SADL_QUERY">|  &
               | </sadl:query>|  &
               |</sadl:structure>| .
      lv_sadl_xml = |{ lv_sadl_xml }| &
               |<sadl:structure name="JogadoresVHSet" dataSource="ZIM_I_JOGADOR_VH" maxEditMode="RO" exposure="TRUE" >|  &
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
