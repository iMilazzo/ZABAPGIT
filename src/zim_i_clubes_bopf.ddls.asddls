@AbapCatalog.sqlViewName: 'ZIMICLUBESBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF for CLUBES'

@Search.searchable: true
@VDM.viewType: #TRANSACTIONAL
@ObjectModel:{
    
  modelCategory: #BUSINESS_OBJECT,
  compositionRoot: true,
  transactionalProcessingEnabled: true,
  
  writeActivePersistence: 'ZIM_CLUBES',
//  draftEnabled: true,
//  writeDraftPersistence: 'ZIM_CLUBES_D',

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
  entityChangeStateId: 'changed_at',

  representativeKey: ['id_clube'],
  semanticKey: ['id_clube'],
  dataCategory: #HIERARCHY

}

define view ZIM_I_CLUBES_BOPF
  as select from ZIM_I_CLUBES_BASIC as Clubes
  association [0..1] to ZIM_I_CLUBES_DESC_BOPF as _Desc on _Desc.id_clube = $projection.id_clube
  association [0..1] to ZIM_I_CLUBES_LOGO_BOPF as _Logo on _Logo.id_clube = $projection.id_clube
  association [0..1] to ZIM_I_ESTADIOS_BOPF as _Estadio on _Estadio.id_estadio = $projection.id_estadio
  association [0..*] to ZIM_I_ELENCOS_BOPF as _Elenco on _Elenco.id_clube = $projection.id_clube
  association [0..*] to ZIM_I_PARTIDASP_BOPF as _PartidasItm on _PartidasItm.id_clube = $projection.id_clube
  
{
      //ZIM_I_CLUBES_BASIC
      @ObjectModel.mandatory: true
  key id_clube,
  
      @ObjectModel.foreignKey.association: '_Estadio'
      @Consumption.labelElement: '_Estadio.nome_estadio'
      id_estadio,
      
      @ObjectModel.mandatory: true
      @Semantics.text:true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      nome_time,
      
      @Semantics.text:true
      nome_completo,
      
      fundacao,
      
      @Semantics.text:true
      nome_tecnico,
      
//      filename,
      
      @Semantics.systemDateTime.createdAt: true
      created_at,
      
      @Semantics.user.createdBy: true
      created_by,
      
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at,
      
      @Semantics.user.lastChangedBy: true
      changed_by,

      @ObjectModel.association.type: [ #TO_COMPOSITION_CHILD ]
      _Elenco,
      
//      _Estadio.nome_estadio,

//      @ObjectModel.association.type: [ #TO_COMPOSITION_CHILD ]
      _Estadio,
      _Desc,
      _Logo,
      _PartidasItm
}
