@AbapCatalog.sqlViewName: 'ZIMCPARTIDKQ1'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.query: true
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Partidas, public view, VDM consum view'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
define view ZIM_C_PARTIDASK_QUERY
  as select from ZIM_I_PARTIDASK_CUBE as Partidas
{
  @EndUserText.label: 'ID da Partida'
  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  PartidaID,

  @AnalyticsDetails.query.display: #KEY
  @AnalyticsDetails.query.axis: #FREE
  Data,

  @EndUserText.label: 'ID do Estádio'
  @AnalyticsDetails.query.display: #TEXT
  @AnalyticsDetails.query.axis: #FREE
  @ObjectModel.text.element: ['NomeEstadio']
  @Consumption.valueHelp: '_Estadio'
  @Consumption.semanticObject: 'NomeEstadio'
  @ObjectModel.text.association: '_Estadio'
  EstadioID,

  //Partida
  @EndUserText.label: 'ID da Rodada'
  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  RodadaID,

  @AnalyticsDetails.query.display: #KEY
  @AnalyticsDetails.query.axis: #FREE
  Moeda,

  Publico,

  Renda,

  @ObjectModel.readOnly
  @Semantics.text: true
  _Estadio.NomeEstadio

}
