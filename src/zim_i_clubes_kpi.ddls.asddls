@AbapCatalog.sqlViewName: 'ZIMICLUBESKPI'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'KPI for Clubes'

@VDM.viewType: #BASIC
//@Analytics.query: true
define view ZIM_I_CLUBES_KPI
  as select from ZIM_I_CLUBES as Clubes
  association [0..*] to ZIM_I_PARTIDASP as _Items on _Items.id_clube = $projection.id_clube

{
      @ObjectModel.text.element:[ 'nome_time' ]
      @Consumption.semanticObject: 'ZCLUBESOP'
  key id_clube,
      
      @Semantics.text: true
      nome_time,

      @DefaultAggregation: #SUM
      1             as quantidade,

      @DefaultAggregation: #SUM
      _Items.placar as gols,

      @DefaultAggregation: #SUM
      _Items.pontos as pontos,

      _Items

}
