@AbapCatalog.sqlViewName: 'ZIMCOCLUBESKPI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'KPI for Clubes'

@Analytics: {
    dataCategory: #CUBE,
    dataExtraction.enabled
}
@VDM.viewType: #COMPOSITE
define view ZIM_CO_CLUBES_KPI
  as select from ZIM_I_CLUBES_KPI
{

      @ObjectModel.text.element:[ 'nome_time' ]
      @Consumption.semanticObject: 'ZCLUBESOP'
  key id_clube,

      @Semantics.text: true
      nome_time,

      @DefaultAggregation: #SUM
      sum( quantidade ) as qtde,

      @DefaultAggregation: #SUM
      sum( gols )       as gols,

      @DefaultAggregation: #SUM
      sum( pontos )     as pontos,

      _Items

}
group by
  id_clube,
  nome_time
