interface ZIF_IM_C_PARTIDAS_BOPF_C
  public .


  interfaces /BOBF/IF_LIB_CONSTANTS .

  constants:
    BEGIN OF SC_ACTION,
      BEGIN OF ZIM_C_PARTIDAS_BOPF,
 CREATE_ZIM_C_PARTIDAS_BOPF     TYPE /BOBF/ACT_KEY VALUE '000C299270591EDAABFFE44B175D451B',
 DELETE_ZIM_C_PARTIDAS_BOPF     TYPE /BOBF/ACT_KEY VALUE '000C299270591EDAABFFE44B175DC51B',
 LOCK_ZIM_C_PARTIDAS_BOPF       TYPE /BOBF/ACT_KEY VALUE '000C299270591EDAABFFE44B175C851B',
 SAVE_ZIM_C_PARTIDAS_BOPF       TYPE /BOBF/ACT_KEY VALUE '000C299270591EDAABFFE44B175E451B',
 UNLOCK_ZIM_C_PARTIDAS_BOPF     TYPE /BOBF/ACT_KEY VALUE '000C299270591EDAABFFE44B175CC51B',
 UPDATE_ZIM_C_PARTIDAS_BOPF     TYPE /BOBF/ACT_KEY VALUE '000C299270591EDAABFFE44B175D851B',
 VALIDATE_ZIM_C_PARTIDAS_BOPF   TYPE /BOBF/ACT_KEY VALUE '000C299270591EDAABFFE44B175E051B',
      END OF ZIM_C_PARTIDAS_BOPF,
    END OF SC_ACTION .
  constants:
    BEGIN OF SC_ACTION_ATTRIBUTE,
        BEGIN OF ZIM_C_PARTIDAS_BOPF,
        BEGIN OF LOCK_ZIM_C_PARTIDAS_BOPF,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
 LEGACY_DAC_KEY                 TYPE STRING VALUE 'LEGACY_DAC_KEY',
        END OF LOCK_ZIM_C_PARTIDAS_BOPF,
        BEGIN OF UNLOCK_ZIM_C_PARTIDAS_BOPF,
 GENERIC                        TYPE STRING VALUE 'GENERIC',
 EDIT_MODE                      TYPE STRING VALUE 'EDIT_MODE',
 ALL_NONE                       TYPE STRING VALUE 'ALL_NONE',
 SCOPE                          TYPE STRING VALUE 'SCOPE',
 FORCE_INVALIDATION             TYPE STRING VALUE 'FORCE_INVALIDATION',
 LOCK_PARAMETER_BUFFER          TYPE STRING VALUE 'LOCK_PARAMETER_BUFFER',
 LEGACY_DAC_KEY                 TYPE STRING VALUE 'LEGACY_DAC_KEY',
        END OF UNLOCK_ZIM_C_PARTIDAS_BOPF,
      END OF ZIM_C_PARTIDAS_BOPF,
    END OF SC_ACTION_ATTRIBUTE .
  constants:
    BEGIN OF SC_ALTERNATIVE_KEY,
      BEGIN OF ZIM_C_PARTIDAS_BOPF,
 DB_KEY                         TYPE /BOBF/OBM_ALTKEY_KEY VALUE '000C299270591EDAABFFE44B175F851B',
      END OF ZIM_C_PARTIDAS_BOPF,
    END OF SC_ALTERNATIVE_KEY .
  constants:
    BEGIN OF SC_ASSOCIATION,
      BEGIN OF ZIM_C_PARTIDAS_BOPF,
 LOCK                           TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299270591EDAABFFE44B175C651B',
 MESSAGE                        TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299270591EDAABFFE44B175C251B',
 PROPERTY                       TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299270591EDAABFFE44B175D251B',
      END OF ZIM_C_PARTIDAS_BOPF,
      BEGIN OF ZIM_C_PARTIDAS_BOPF_LOCK,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299270591EDAABFFE44B175EA51B',
      END OF ZIM_C_PARTIDAS_BOPF_LOCK,
      BEGIN OF ZIM_C_PARTIDAS_BOPF_MESSAGE,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299270591EDAABFFE44B175E851B',
      END OF ZIM_C_PARTIDAS_BOPF_MESSAGE,
      BEGIN OF ZIM_C_PARTIDAS_BOPF_PROPERTY,
 TO_PARENT                      TYPE /BOBF/OBM_ASSOC_KEY VALUE '000C299270591EDAABFFE44B175EC51B',
      END OF ZIM_C_PARTIDAS_BOPF_PROPERTY,
    END OF SC_ASSOCIATION .
  constants:
    BEGIN OF SC_ASSOCIATION_ATTRIBUTE,
      BEGIN OF ZIM_C_PARTIDAS_BOPF,
        BEGIN OF PROPERTY,
 ALL_NODE_PROPERTY              TYPE STRING VALUE 'ALL_NODE_PROPERTY',
 ALL_NODE_ATTRIBUTE_PROPERTY    TYPE STRING VALUE 'ALL_NODE_ATTRIBUTE_PROPERTY',
 ALL_ASSOCIATION_PROPERTY       TYPE STRING VALUE 'ALL_ASSOCIATION_PROPERTY',
 ALL_ASSOCIATION_ATTRIBUTE_PROP TYPE STRING VALUE 'ALL_ASSOCIATION_ATTRIBUTE_PROP',
 ALL_ACTION_PROPERTY            TYPE STRING VALUE 'ALL_ACTION_PROPERTY',
 ALL_ACTION_ATTRIBUTE_PROPERTY  TYPE STRING VALUE 'ALL_ACTION_ATTRIBUTE_PROPERTY',
 ALL_QUERY_PROPERTY             TYPE STRING VALUE 'ALL_QUERY_PROPERTY',
 ALL_QUERY_ATTRIBUTE_PROPERTY   TYPE STRING VALUE 'ALL_QUERY_ATTRIBUTE_PROPERTY',
 ALL_SUBTREE_PROPERTY           TYPE STRING VALUE 'ALL_SUBTREE_PROPERTY',
        END OF PROPERTY,
      END OF ZIM_C_PARTIDAS_BOPF,
    END OF SC_ASSOCIATION_ATTRIBUTE .
  constants:
    SC_BO_KEY  TYPE /BOBF/OBM_BO_KEY VALUE '000C299270591EDAABFFE44B175B851B' .
  constants:
    SC_BO_NAME TYPE /BOBF/OBM_NAME VALUE 'ZIM_C_PARTIDAS_BOPF' .
  constants:
    BEGIN OF SC_DETERMINATION,
      BEGIN OF ZIM_C_PARTIDAS_BOPF,
 ACTION_AND_FIELD_CONTROL       TYPE /BOBF/DET_KEY VALUE '000C299270591EDAABFFE44B175FA51B',
      END OF ZIM_C_PARTIDAS_BOPF,
    END OF SC_DETERMINATION .
  constants:
    SC_MODEL_VERSION TYPE /BOBF/CONF_VERSION VALUE '00000' .
  constants:
    BEGIN OF SC_NODE,
 ZIM_C_PARTIDAS_BOPF            TYPE /BOBF/OBM_NODE_KEY VALUE '000C299270591EDAABFFE44B175BC51B',
 ZIM_C_PARTIDAS_BOPF_LOCK       TYPE /BOBF/OBM_NODE_KEY VALUE '000C299270591EDAABFFE44B175C451B',
 ZIM_C_PARTIDAS_BOPF_MESSAGE    TYPE /BOBF/OBM_NODE_KEY VALUE '000C299270591EDAABFFE44B175C051B',
 ZIM_C_PARTIDAS_BOPF_PROPERTY   TYPE /BOBF/OBM_NODE_KEY VALUE '000C299270591EDAABFFE44B175D051B',
    END OF SC_NODE .
  constants:
    BEGIN OF SC_NODE_ATTRIBUTE,
      BEGIN OF ZIM_C_PARTIDAS_BOPF,
  NODE_DATA                      TYPE STRING VALUE 'NODE_DATA',
  ID_RODADA                      TYPE STRING VALUE 'ID_RODADA',
  ID_PARTIDA                     TYPE STRING VALUE 'ID_PARTIDA',
  ID_ESTADIO                     TYPE STRING VALUE 'ID_ESTADIO',
  ID_TIME_A                      TYPE STRING VALUE 'ID_TIME_A',
  ID_TIME_B                      TYPE STRING VALUE 'ID_TIME_B',
  DATA                           TYPE STRING VALUE 'DATA',
  PUBLICO                        TYPE STRING VALUE 'PUBLICO',
  RENDA                          TYPE STRING VALUE 'RENDA',
  MOEDA                          TYPE STRING VALUE 'MOEDA',
  PLACAR_TIME_A                  TYPE STRING VALUE 'PLACAR_TIME_A',
  PLACAR_TIME_B                  TYPE STRING VALUE 'PLACAR_TIME_B',
      END OF ZIM_C_PARTIDAS_BOPF,
    END OF SC_NODE_ATTRIBUTE .
  constants:
    BEGIN OF SC_NODE_CATEGORY,
      BEGIN OF ZIM_C_PARTIDAS_BOPF,
 ROOT                           TYPE /BOBF/OBM_NODE_CAT_KEY VALUE '000C299270591EDAABFFE44B175BE51B',
      END OF ZIM_C_PARTIDAS_BOPF,
    END OF SC_NODE_CATEGORY .
endinterface.