@AbapCatalog.sqlViewName: 'ZIMCPARITDKCUBE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cube for Partidas'

@Analytics: {
    query: true
}
@VDM.viewType: #CONSUMPTION
@OData.publish: true
@Metadata.allowExtensions: true
@ObjectModel: {
    representativeKey: ['id_partida', 'id_estadio'],    
    resultSet.sizeCategory: #XS
}
define view ZIM_C_PARTIDASK_CUBE
  as select from ZIM_I_PARTIDASK_CUBE as Partidas  
  
  
{

    @EndUserText.label: 'Partida'
    id_partida,

    @EndUserText.label: 'Data da Partida'
    data_partida,
    
    @EndUserText.label: 'Rodada'
    id_rodada,

    @ObjectModel.foreignKey.association: '_Estadio'
    @ObjectModel.text.element:[ 'nome_estadio' ]
//    @Consumption.valueHelp: '_Estadio'
    @Consumption.semanticObject: 'ZESTADIOS'
    @AnalyticsDetails.query.display: #KEY_TEXT
    id_estadio,

    @Semantics.text: true
    nome_estadio,    

    @EndUserText.label: 'Público'
    @DefaultAggregation: #SUM
    publico,
    
    @ObjectModel.readOnly
    PublicoThreshold,

    @ObjectModel.readOnly
    PublicoCritical,

    @EndUserText.label: 'Renda'
    @Semantics.amount.currencyCode: 'moeda'
    @DefaultAggregation: #SUM
    renda,
    
    @Semantics.currencyCode: true
    moeda

}
