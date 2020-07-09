@AbapCatalog.sqlViewName: 'ZIMICLUBESCUBE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cube for Clubes'

@Analytics: {
    dataCategory: #CUBE,
    dataExtraction.enabled
}
//@Search.searchable: true
@VDM.viewType: #COMPOSITE
@ObjectModel.representativeKey: 'id_clube'
define view ZIM_I_CLUBES_CUBE
  //  as select from zim_table_function as Clubes
  as select from ZIM_I_CLUBES as Clubes
  //  join zim_table_function as _Pontuacao on _Pontuacao.id_clube = Clubes.id_clube
  ////  //  left outer join ZIM_C_PARTIDASP as Items on Items.id_clube = Clubes.id_clube
  association [0..*] to ZIM_I_PARTIDASP as _Items on _Items.id_clube = $projection.id_clube
  //
  //  //  left outer join ZIM_C_PARTIDASK as Header on Header.id_partida = Items.id_partida
{

  key id_clube,

//      @Search: {
//        defaultSearchElement: true,
//        fuzzinessThreshold: 0.7
//      }
      @EndUserText.quickInfo: 'Nome do Time de Futebol'
      @Semantics.organization.name: true
      nome_time,

      @EndUserText.quickInfo: 'Quantidade de gols'
      @DefaultAggregation: #SUM
      _Items.placar as TotalGols,
      //      totalgols as TotalGols,

      @EndUserText.quickInfo: 'Quantidade de Pontos'
      @DefaultAggregation: #SUM
      _Items.pontos as TotalPontos,
      //      totalpontos as TotalPontos

      _Items
}
