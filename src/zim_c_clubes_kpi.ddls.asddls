@AbapCatalog.sqlViewName: 'ZIMCCLUBESKPI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'KPI for Clubes'

@Analytics: {
    query: true
}
@OData: {
    entitySet: { name: 'ClubesKPISet' },
    entityType: { name: 'ClubeKPI' }
}
@VDM.viewType: #CONSUMPTION
@OData.publish: true
@Metadata.allowExtensions: true
define view ZIM_C_CLUBES_KPI
  as select from ZIM_CO_CLUBES_KPI
{

  key id_clube,
      nome_time,
      qtde,

      @DefaultAggregation: #FORMULA
      @AnalyticsDetails.query.formula: '(pontos / (qtde * 3)) * 100'
      @AnalyticsDetails.query.decimals: 2
      1 as kpi,
      
      gols,
      pontos

}
