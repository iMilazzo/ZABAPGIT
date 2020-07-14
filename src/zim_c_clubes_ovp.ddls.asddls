@AbapCatalog.sqlViewName: 'ZIMCCLUBESOVP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Overview Page for Clubes'

@Analytics: {
    query: true
}
@VDM.viewType: #CONSUMPTION
@OData: {
    publish: true,
    entitySet: { name: 'ClubesOVPSet' },
    entityType: { name: 'ClubeOVP' }
}
@Metadata.allowExtensions: true
define view ZIM_C_CLUBES_OVP
  as select from ZIM_CO_CLUBES_KPI
{
      @ObjectModel.text.element:[ 'nome_time' ]
      @Consumption.semanticObject: 'ZCLUBESOP'
  key id_clube,
      
      @Semantics.text: true
      nome_time,
      
      @EndUserText.label: 'Gols'
      @DefaultAggregation: #SUM
      gols,

      @EndUserText.label: 'Pontos'
      @DefaultAggregation: #SUM
      pontos

}
