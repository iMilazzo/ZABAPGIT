@AbapCatalog.sqlViewName: 'ZIMICLUBESVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for CLUBES'

@Search.searchable: true

define view ZIM_I_CLUBES_VH
  as select from zim_clubes
{
  //zim_clubes
  key id_clube,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.8
  nome_time

}
