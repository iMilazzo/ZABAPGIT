@AbapCatalog.sqlViewName: 'ZIMCPARTIDKQ1'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.query: true
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Partidas, public view, VDM consum view'
@VDM.viewType: #CONSUMPTION
@OData.publish: true

@UI.selectionPresentationVariant: [{
    qualifier: 'KPIRendaPorRodada',
    presentationVariantQualifier: 'KPIRendaPorRodada',
    selectionVariantQualifier: 'KPIRendaPorRodada'
},{
    qualifier: 'Default',
    presentationVariantQualifier: 'Default',
    selectionVariantQualifier: 'Default'
}]

@UI.presentationVariant: [{
    qualifier: 'KPIRendaPorRodada',
    text: 'KPI: Renda por Rodada',
    visualizations: [{
        type: #AS_CHART,
        qualifier: 'ChartRendaPorRodada'
    },{
        type: #AS_DATAPOINT,
        qualifier: 'RendaPorRodada'
    }]
},{
    qualifier: 'FilterPartidasPorRodadas',
    text: 'Filter: Partidas por Rodadas',
    visualizations: [{
        type: #AS_CHART,
        qualifier: 'ChartPartidasPorRodadas'
    }]
},{
    qualifier: 'Default',
    visualizations: [{
        type: #AS_CHART,
        qualifier: 'ChartDefault'
    }]
}]

@UI.selectionVariant: [{
    qualifier: 'KPIRendaPorRodada',
    text: 'Default'
},{
    qualifier: 'Default',
    text: 'Default'
}]

@UI.chart: [{
    qualifier: 'ChartRendaPorRodada',
    chartType: #COLUMN,
    dimensions:  [ 'RodadaID' ], 
    measures:  [ 'Renda' ],
    dimensionAttributes: [{
        dimension: 'RodadaID',
        role: #CATEGORY
    }],
    measureAttributes: [{
        measure: 'Renda',
        role: #AXIS_1
    }]
},{
    qualifier: 'ChartPublicoPorRodadas',
    chartType: #DONUT,
    dimensions:  [ 'RodadaID' ], 
    measures:  [ 'Publico' ],
    dimensionAttributes: [{
        dimension: 'RodadaID',
        role: #CATEGORY
    }],
    measureAttributes: [{
        measure: 'Publico',
        role: #AXIS_1
    }]
},{
    qualifier: 'ChartDefault',
    chartType: #COLUMN,
    dimensions:  [ 'PartidaID', 'RodadaID' ], 
    measures:  [ 'Publico' ],
    dimensionAttributes: [{
        dimension: 'RodadaID',
        role: #SERIES
    },{
        dimension: 'PartidaID',
        role: #CATEGORY
    }],
    measureAttributes: [{
        measure: 'Publico',
        role: #AXIS_1
    }]
}]
define view ZIM_C_PARTIDASK_QUERY
  as select from ZIM_I_PARTIDASK_CUBE as Partidas
{
  @EndUserText.label: 'ID da Partida'
  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  PartidaID,

  @AnalyticsDetails.query.display: #KEY_TEXT
  @AnalyticsDetails.query.axis: #FREE
  Data,

  @EndUserText.label: 'ID do Estádio'
  @AnalyticsDetails.query.display: #KEY_TEXT
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
