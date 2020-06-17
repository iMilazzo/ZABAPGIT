@AbapCatalog.sqlViewName: 'ZIMCPARTIDPQ1'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.query: true
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Partidas, public view, VDM consum view'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
define view ZIM_C_PARTIDASP_QUERY
  as select from ZIM_I_PARTIDASP_CUBE as PartidasItem
{

  @EndUserText.label: 'ID da Partida'
  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  id_partida as PartidaID,

  @EndUserText.label: 'ID da Partida'
  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  id_item    as ItemID,


  @EndUserText.label: 'ID do Time'
  @AnalyticsDetails.query.display: #TEXT
  @AnalyticsDetails.query.axis: #FREE
  @ObjectModel.text.element: ['NomeTime']
  @Consumption.valueHelp: '_Clube'
  ClubeID,

  @EndUserText.label: 'Jogos'
  @AnalyticsDetails.query.axis: #FREE
  QtdeJogos,

  @EndUserText.label: 'Placar'
  @AnalyticsDetails.query.axis: #FREE
  Placar,

  @EndUserText.label: 'Pontos'
  @AnalyticsDetails.query.axis: #FREE
  Pontos,

  @ObjectModel.readOnly
  @Semantics.text: true
  _Clube.NomeTime

}
