@AbapCatalog.sqlViewName: 'ZIMCESTADIOSOVP'
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
    entitySet: { name: 'EstadiosOVPSet' },
    entityType: { name: 'EstadioOVP' }
}
@Metadata.allowExtensions: true
define view ZIM_C_ESTADIOS_OVP
  as select from ZIM_CO_ESTADIOS_KPI
{

  key id_estadio,
      nome_estadio,
      qtde,
      publico,
      renda

}
