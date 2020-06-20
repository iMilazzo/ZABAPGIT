@AbapCatalog.sqlViewName: 'ZIMIESTADIOSVH'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Estadios, private view, VDM interf view'
@Search.searchable: true
@ObjectModel.dataCategory: #VALUE_HELP
define view ZIM_I_ESTADIOS_VH
  as select from zim_estadios as Estadios
{
  key id_estadio,
      @ObjectModel.text.association: '_Text'
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      nomeestadio
}
