@AbapCatalog.sqlViewName: 'ZIMCOESTADIOSKPI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'KPI for Estadios'

@Analytics: {
    dataCategory: #CUBE,
    dataExtraction.enabled
}
@VDM.viewType: #COMPOSITE
define view ZIM_CO_ESTADIOS_KPI
  as select from ZIM_I_ESTADIOS_KPI
{

  key id_estadio,
      nome_estadio,

      @EndUserText.label: 'Qtde'
      @DefaultAggregation: #SUM
      sum(quantidade) as qtde,

      @EndUserText.label: 'Público'
      @DefaultAggregation: #SUM
      sum(publico)    as publico,

      @EndUserText.label: 'Renda'
      @DefaultAggregation: #SUM
      sum(renda)      as renda
}
group by
  id_estadio,
  nome_estadio
