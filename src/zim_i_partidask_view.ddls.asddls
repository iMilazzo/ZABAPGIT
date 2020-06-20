@AbapCatalog.sqlViewName: 'ZIMIPARTIDKVIEW'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Part., private view, VDM interface view'
@VDM.viewType: #BASIC

@ObjectModel:{
    representativeKey: 'id_partida',
    semanticKey: 'id_partida',
    modelCategory: #BUSINESS_OBJECT,
    compositionRoot: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZIM_PARTIDAS_K',
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true
}
define view ZIM_I_PARTIDASK_VIEW
  as select from zim_partidas_k as Partida
  association [1..1] to ZIM_I_ESTADIOS_BOPF  as _Estadio      on _Estadio.id_estadio = $projection.EstadioID
  association [0..*] to ZIM_I_PARTIDASP_VIEW as _PartidasItem on _PartidasItem.id_partida = $projection.id_partida

{

  key Partida.id_partida,
      Partida.id_estadio as EstadioID,
      Partida.data       as Data,
      Partida.id_rodada  as RodadaID,
      @Semantics.quantity
      Partida.publico    as Publico,
      @Semantics.amount.currencyCode : 'Moeda'
      Partida.renda      as Renda,
      @Semantics.currencyCode: true
      Partida.moeda      as Moeda,

      _Estadio,
      
      @ObjectModel.association.type:  [#TO_COMPOSITION_CHILD  ]
      _PartidasItem
}
