@AbapCatalog.sqlViewName: 'ZIMICLUBESVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for CLUBES'

@Search.searchable: true
@OData: {
    entitySet: { name: 'ClubesVHSet' },
    entityType: { name: 'ClubesVH' }
}
define view ZIM_I_CLUBES_VH
  as select from ZIM_I_CLUBES
{

  key id_clube,
      @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      nome_time

}
