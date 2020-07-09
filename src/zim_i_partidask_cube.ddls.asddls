@AbapCatalog.sqlViewName: 'ZIMIPARTIDKCUBE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partidas, private view, VDM interf view'

@Analytics: {
    dataCategory: #CUBE
}
define view ZIM_I_PARTIDASK_CUBE
  as select from ZIM_I_PARTIDASK
  association [0..1] to SEPM_I_Currency as _Currency on _Currency.Currency = $projection.moeda
  association [1]    to ZIM_I_ESTADIOS_D  as _Estadio   on _Estadio.id_estadio = $projection.id_estadio
{

      @ObjectModel.readOnly: true
  key id_partida,
  
      data_partida,
      
      id_rodada,

//      @ObjectModel.foreignKey.association: '_Estadio'
//      @ObjectModel.text.element:[ 'nome_estadio' ]
//      @Consumption.valueHelp: '_Estadio'
//      @Consumption.semanticObject: 'ZESTADIOS'
      id_estadio,
      
      @Semantics.text: true
      nome_estadio,

      @DefaultAggregation: #SUM
      @EndUserText.label: 'Público'
      publico,

      @ObjectModel.readOnly
      @DefaultAggregation: #MAX
      PublicoThreshold,


      @ObjectModel.readOnly
      case when PublicoThreshold >= 66 then 3
           when PublicoThreshold >= 33 then 2
           else 1 end as PublicoCritical,


      @Semantics.amount.currencyCode: 'moeda'
      @DefaultAggregation: #SUM
      renda,

      @Semantics.currencyCode: true
      
      moeda,
      
      _Currency,
      
      _Estadio

}
