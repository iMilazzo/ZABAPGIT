@AbapCatalog.sqlViewName: 'ZIMIPARTIDKCUBE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partidas, public view, VDM cube view'

@VDM.viewType: #COMPOSITE
@ObjectModel:{
    representativeKey: 'id_partida',
    semanticKey: 'id_partida'
}

@Analytics: {
    dataCategory: #CUBE,
    dataExtraction.enabled: true
}

define view ZIM_I_PARTIDASK_CUBE
  as select from ZIM_I_PARTIDASK_VIEW as Partida
  association [1..1] to ZIM_I_ESTADIOS       as _Estadio      on _Estadio.EstadioID = $projection.EstadioID
  association [0..*] to ZIM_I_PARTIDASP_CUBE as _PartidaItems on _PartidaItems.id_partida = $projection.PartidaID
{
  key Partida.id_partida as PartidaID,
      Partida.Data       as Data,

      @ObjectModel.foreignKey.association: '_Estadio'
      @ObjectModel.text.association: '_Estadio'
      @ObjectModel.text.element: ['NomeEstadio']
      Partida.EstadioID,
      Partida.RodadaID,

      /** MEASURES **/
      @DefaultAggregation: #SUM
      Partida.Publico,

      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode : 'Moeda'
      Partida.Renda,


      @Semantics.currencyCode: true
      Partida.Moeda      as Moeda,


      @ObjectModel.readOnly
      @Semantics.text: true
      Partida._Estadio.NomeEstadio,


      _Estadio,
      _PartidaItems
}
