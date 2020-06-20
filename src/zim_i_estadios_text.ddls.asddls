@AbapCatalog.sqlViewName: 'ZIMIESTADIOSTX'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Estadios, private view, VDM interf view'
@Search.searchable: true
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'id_estadio'

define view ZIM_I_ESTADIOS_TEXT
  as select from zim_estadios as Estadios
{
  key id_estadio,

      @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      nomeestadio
}
