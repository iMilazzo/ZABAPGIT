@AbapCatalog.sqlViewName: 'ZIMICLUBESJOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF for CLUBES'

@Search.searchable: true
@VDM.viewType: #TRANSACTIONAL
@ObjectModel:{
    
  transactionalProcessingEnabled: true,
  writeActivePersistence: 'ZIM_CLUBES',
//  draftEnabled: true,
//  writeDraftPersistence: 'ZIM_CLUBES_D',

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
  entityChangeStateId: 'changed_at',

  representativeKey: ['id_clube'],
  semanticKey: ['id_clube']

}

define view ZIM_I_CLUBES_JOIN
  as select from ZIM_I_CLUBES_BASIC as Clubes
  association [1..1] to ZIM_I_CLUBES_DESC_BOPF as _Desc on _Desc.id_clube = $projection.id_clube
  association [1..1] to ZIM_I_CLUBES_LOGO_BOPF as _Logo on _Logo.id_clube = $projection.id_clube
  association [1..1] to ZIM_I_ESTADIOS_NEW as _Estadio on _Estadio.id_estadio = $projection.id_estadio
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

      _Desc,
      _Logo,
      _Estadio
}
