@AbapCatalog.sqlViewName: 'ZIMIESTADIOSCUBE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cube for Clubes'

@Analytics: {
    dataCategory: #CUBE
}
//@Search.searchable: true
@VDM.viewType: #COMPOSITE
@ObjectModel.representativeKey: 'id_estadio'
define view ZIM_I_ESTADIOS_CUBE
  //  as select from zim_table_function as Clubes
  as select from ZIM_I_ESTADIOS_D as Estadios
  association [0..*] to ZIM_I_PARTIDASK as _Partidas on _Partidas.id_estadio = $projection.id_estadio
{
      //Estadios
  key id_estadio,
      @Semantics.organization.name: true
      nome_estadio,
      @Semantics.address.city: true
      cidade,
      @Semantics.address.region: true
      uf,
      
      @DefaultAggregation: #SUM
      _Partidas.publico as Publico,
      
      @Semantics.amount.currencyCode: 'Moeda'
      @DefaultAggregation: #SUM
      _Partidas.renda as Renda,

      @Semantics.currencyCode: true      
      _Partidas.moeda as Moeda,
      
      _Partidas
}
