@AbapCatalog.sqlViewName: 'ZIMCESTADIOSCUBE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cube for Clubes'

@Analytics: {
    query: true
}
@VDM.viewType: #CONSUMPTION
@OData.publish: true
@Metadata.allowExtensions: true
@ObjectModel.representativeKey: 'id_estadio'
define view ZIM_C_ESTADIOS_CUBE
  as select from ZIM_I_ESTADIOS_CUBE as Clubes
  association [0..*] to ZIM_C_PARTIDASK as _Partidas on _Partidas.id_estadio = $projection.id_estadio
{

      //Clubes
      @AnalyticsDetails.query.display: #KEY_TEXT
  key id_estadio,
  
      @Semantics.organization.name: true
      @Semantics.text: true
      nome_estadio,
      
      cidade,
      uf,
      
      @EndUserText.label: 'Público'
      @DefaultAggregation: #SUM
      _Partidas.publico as Publico,
      
      @EndUserText.label: 'Valor Arrecadado'
      @Semantics.amount.currencyCode: 'Moeda'
      @DefaultAggregation: #SUM
      _Partidas.renda as Renda,
      
      @Semantics.currencyCode: true
      @Semantics.text: true
      _Partidas.moeda as Moeda,
      
      /* Associations */
      //Clubes
      _Partidas

}
