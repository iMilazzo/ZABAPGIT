@AbapCatalog.sqlViewName: 'ZIMCPARTIDASQ1'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.query: true
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Partidas, public view, VDM consum view'
@VDM.viewType: #CONSUMPTION
define view ZIM_C_PARTIDAS_QUERY
  as select from ZIM_I_PARTIDAS_CUBE as Partida
{
  //Partida
  @EndUserText.label: 'ID da Rodada'
  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  RodadaID,
  
  @EndUserText.label: 'ID da Partida'
  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  PartidaID,

  @EndUserText.label: 'Estádio'
  @AnalyticsDetails.query.display: #TEXT
  @AnalyticsDetails.query.axis: #FREE
  @ObjectModel.text.element: ['NomeEstadio']
  @Consumption.valueHelp: '_estadio'
  @Consumption.semanticObject: 'NomeEstadio'
  @ObjectModel.text.association: '_estadio'
  Estadio,

  @EndUserText.label: 'ID do Time A'
  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  @ObjectModel.text.element: ['NomeTimeA']
  @Consumption.valueHelp: '_clube_A'
  TimeA,

  @EndUserText.label: 'ID do Time B'
  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  @ObjectModel.text.element: ['NomeTimeB']
  @Consumption.valueHelp: '_clube_B'
  TimeB,

  @AnalyticsDetails.query.display: #KEY
  @AnalyticsDetails.query.axis: #FREE
  Data,
  
  @AnalyticsDetails.query.display: #KEY
  @AnalyticsDetails.query.axis: #FREE
  Moeda,

  @EndUserText.label: 'Jogos'
  @AnalyticsDetails.query.axis: #FREE  
  QtdeJogos,
  
  Publico,

  @EndUserText.label: 'Placar A'
  @AnalyticsDetails.query.axis: #FREE  
  Placar_Time_A,

  @EndUserText.label: 'Placar B'
  @AnalyticsDetails.query.axis: #FREE  
  Placar_Time_B,
  
  Pontos_A,
  Pontos_B,
  Renda,

    @ObjectModel.readOnly
    @Semantics.text: true
    _estadio.NomeEstadio,
    
    @ObjectModel.readOnly
    @Semantics.text: true
    _clube_A.NomeTime as NomeTimeA,

    @ObjectModel.readOnly
    @Semantics.text: true
    _clube_B.NomeTime as NomeTimeB
    
}
