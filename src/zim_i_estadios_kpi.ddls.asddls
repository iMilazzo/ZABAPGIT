@AbapCatalog.sqlViewName: 'ZIMIESTADIOSSKPI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'KPI for Estadios'

@VDM.viewType: #BASIC
//@Analytics.query: true
define view ZIM_I_ESTADIOS_KPI
  as select from ZIM_I_ESTADIOS as Estadio
  association [0..*] to ZIM_I_PARTIDASK as _Partidas on _Partidas.id_estadio = $projection.id_estadio

{
      @ObjectModel.text.element:[ 'nome_estadio' ]
      @Consumption.semanticObject: 'ZESTADIOS'
  key id_estadio,

      @Semantics.text: true
      nome_estadio,

      @DefaultAggregation: #SUM
      1                 as quantidade,

      @DefaultAggregation: #SUM
      _Partidas.publico as publico,

      @DefaultAggregation: #SUM
      _Partidas.renda   as renda,

      _Partidas

}
