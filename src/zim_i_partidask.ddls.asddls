@AbapCatalog.sqlViewName: 'ZIMIPARTIDASK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partidas, private view, VDM interf view'

@VDM:{
    viewType: #TRANSACTIONAL,
    private: true
}
@Analytics: {
    dataCategory: #FACT,
    dataExtraction.enabled
}
define view ZIM_I_PARTIDASK
  as select from zim_partidas_k
  association [0..1] to SEPM_I_Currency as _Currency on _Currency.Currency = $projection.moeda
  association [1]    to ZIM_I_ESTADIOS  as _Estadio   on _Estadio.id_estadio = $projection.id_estadio
{

      @ObjectModel.readOnly: true
  key id_partida,
  
      data_partida,
      id_rodada,

      @ObjectModel.foreignKey.association: '_Estadio'
      @ObjectModel.text.element:[ 'nome_estadio' ]
      @Consumption.semanticObject: 'ZESTADIOS'
      id_estadio,

      @Semantics.text: true
      _Estadio.nome_estadio as nome_estadio,
      
       publico,

      @ObjectModel.readOnly
      division( publico, _Estadio.capacidade , 2 ) * 100 as PublicoThreshold,

      @Semantics.amount.currencyCode: 'moeda'
      renda,

      @ObjectModel.foreignKey.association: '_Currency'
      @ObjectModel.text.element:[ 'CurrencyName' ]
      @Semantics.currencyCode: true
      moeda,
      
      _Currency,
      
      _Estadio

}
