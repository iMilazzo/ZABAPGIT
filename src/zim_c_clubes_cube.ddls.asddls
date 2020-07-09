@AbapCatalog.sqlViewName: 'ZIMCCLUBESCUBE'
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
@ObjectModel.representativeKey: 'id_clube'
define view ZIM_C_CLUBES_CUBE
  as select from ZIM_I_CLUBES_CUBE as Clubes
//  as select from zim_table_function as Clubes
//  left outer join ZIM_C_PARTIDASP as Items on Items.id_clube = Clubes.id_clube
//  association [0..*] to ZIM_C_PARTIDASP as _Items on _Items.id_clube = $projection.id_clube

//  left outer join ZIM_C_PARTIDASK as Header on Header.id_partida = Items.id_partida
{

      @AnalyticsDetails.query.display: #KEY_TEXT
  key id_clube,

      @Semantics.organization.name: true
      nome_time,

//      //      Header.data_partida,
//      @AnalyticsDetails.query.sortDirection: #ASC
      @EndUserText.label: 'Qtde de Gols'
      @DefaultAggregation: #SUM
      TotalGols,

//      @AnalyticsDetails.query.sortDirection: #ASC
      @EndUserText.label: 'Pontuação'
      @DefaultAggregation: #SUM
      TotalPontos

}
