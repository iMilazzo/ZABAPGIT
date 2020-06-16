@AbapCatalog.sqlViewName: 'ZIMIPARTIDASCUBE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partidas, public view, VDM cube view'
@VDM.private: true
@VDM.viewType: #BASIC
@Analytics.dataCategory: #CUBE
@Analytics.dataExtraction.enabled: true
define view ZIM_I_PARTIDAS_CUBE
  as select from ZIM_I_PARTIDAS_VIEW as Partida
  //    association [0..1] to I_CalendarDate as _CalendarDate on _CalendarDate.CalendarDate = $projection.Data
  association [1..1] to ZIM_I_ESTADIOS    as _estadio on _estadio.EstadioID = $projection.Estadio
  association [1..1] to ZIM_I_CLUBES_VIEW as _clube_A on _clube_A.ClubeID = $projection.TimeA
  association [1..1] to ZIM_I_CLUBES_VIEW as _clube_B on _clube_B.ClubeID = $projection.TimeB
{
  key Partida.id_rodada     as RodadaID,
  key Partida.id_partida    as PartidaID,

      @ObjectModel.foreignKey.association: '_estadio'
      @ObjectModel.text.association: '_estadio'
      @ObjectModel.text.element: ['NomeEstadio']
  key Partida.id_estadio    as Estadio,

      @ObjectModel.foreignKey.association: '_clube_A'
      @ObjectModel.text.association: '_clube_A'
      @ObjectModel.text.element: ['NomeTimeA']
  key Partida.id_time_a     as TimeA,

      @ObjectModel.foreignKey.association: '_clube_B'
      @ObjectModel.text.association: '_clube_B'
      @ObjectModel.text.element: ['NomeTimeB']
  key Partida.id_time_b     as TimeB,

      Partida.Data          as Data,

      /** MEASURES **/
      @DefaultAggregation: #SUM
      Partida.Publico       as Publico,

      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode : 'Moeda'
      Partida.Renda         as Renda,


      @Semantics.currencyCode: true
      Partida.Moeda         as Moeda,

      @DefaultAggregation: #SUM
      1 as QtdeJogos,

      @DefaultAggregation: #SUM
      Partida.Placar_Time_A as Placar_Time_A,

      @DefaultAggregation: #SUM
      Partida.Placar_Time_B as Placar_Time_B,

      @EndUserText.label: 'PontosA'
      @DefaultAggregation: #SUM
      case when Partida.Placar_Time_A > Partida.Placar_Time_B then 3
           when Partida.Placar_Time_A = Partida.Placar_Time_B then 1
           else 0
      end                   as Pontos_A,

      @EndUserText.label: 'PontosB'
      @DefaultAggregation: #SUM
      case when Partida.Placar_Time_A < Partida.Placar_Time_B then 3
           when Partida.Placar_Time_A = Partida.Placar_Time_B then 1
           else 0
      end                   as Pontos_B,

        @ObjectModel.readOnly
        @Semantics.text: true
        Partida._estadio.nomeestadio as NomeEstadio,

        @ObjectModel.readOnly
        @Semantics.text: true
        Partida._clube_A.NomeTime as NomeTimeA,

        @ObjectModel.readOnly
        @Semantics.text: true
        Partida._clube_B.NomeTime as NomeTimeB,

      _estadio,
      _clube_A,
      _clube_B
}
