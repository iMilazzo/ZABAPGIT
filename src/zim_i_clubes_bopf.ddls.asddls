@AbapCatalog.sqlViewName: 'ZIMICLUBESBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clubes, private view, VDM interface view'

@Analytics.dataCategory: #DIMENSION

@VDM.viewType: #BASIC
@ObjectModel:{
    modelCategory: #BUSINESS_OBJECT,
    representativeKey: 'id_clube',
    semanticKey: 'id_clube',
    compositionRoot: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZIM_CLUBES',
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true
}
define view ZIM_I_CLUBES_BOPF
  as select from zim_clubes

  association [1..1] to ZIM_I_ESTADIOS_BOPF as _estadio on _estadio.id_estadio = $projection.id_clube
  association [1..1] to zim_clubes_desc   as _desc    on _desc.id_clube = $projection.id_clube
  association [1..1] to zim_clubes_logo   as _logo    on _logo.id_clube = $projection.id_clube
  association [0..*] to ZIM_I_ELENCO_TEXT as _elencos on _elencos.Clube = $projection.id_clube
//  association [0..*] to ZIM_I_PARTIDAS_bopf as _partidas_A on _partidas_A.id_time_a = $projection.id_clube
//  association [0..*] to ZIM_I_PARTIDAS_VIEW as _partidas_B on _partidas_B.id_time_b = $projection.id_clube

{
  key id_clube,
  key id_estadio,
      nometime as NomeTime,
      nomecompleto as NomeCompleto,
      fundacao as Fundacao,
      tecnico as Tecnico,
      filename,

      _estadio,
      _desc,
      _logo,
      _elencos
      
//      @ObjectModel.association.type:  [#TO_COMPOSITION_CHILD  ]      
//      _partidas_A,

//      @ObjectModel.association.type:  [#TO_COMPOSITION_CHILD  ]      
//      _partidas_B
      
}
