@AbapCatalog.sqlViewName: 'ZIMIESTADIOSVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for CLUBES'

@Search.searchable: true
@OData: {
    entitySet: { name: 'EstadiosVHSet' },
    entityType: { name: 'EstadiosVH' }
}

define view ZIM_I_ESTADIOS_VH
  as select from ZIM_I_ESTADIOS
{
  key id_estadio,
      @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      nome_estadio      
}
