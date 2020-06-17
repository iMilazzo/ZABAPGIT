@AbapCatalog.sqlViewName: 'ZIMIPONTOS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Pontos, private view, VDM interface view'

@VDM.viewType: #BASIC

@ObjectModel:{
    representativeKey: 'id_clube',
    semanticKey: 'id_clube'
}

define view ZIM_I_PONTOS2 as select from ZIM_I_PARTIDAS_VIEW as Partidas

  association [1..1] to ZIM_I_CLUBES_VIEW as _clube_A on _clube_A.ClubeID = Partidas.id_time_a
  association [1..1] to ZIM_I_CLUBES_VIEW as _clube_B on _clube_B.ClubeID = Partidas.id_time_b

{
      @EndUserText.label: 'Clube'
      @DefaultAggregation: #SUM
      case when Partidas.Placar_Time_A > Partidas.Placar_Time_B then _clube_A.NomeTime
           when Partidas.Placar_Time_A < Partidas.Placar_Time_B then _clube_B.NomeTime
           else _clube_A.NomeTime
      end as Clube,
              
      @EndUserText.label: 'Pontos'
      @DefaultAggregation: #SUM
      case when Partidas.Placar_Time_A > Partidas.Placar_Time_B then 3
           when Partidas.Placar_Time_A < Partidas.Placar_Time_B then 3
           when Partidas.Placar_Time_A = Partidas.Placar_Time_B then 1
           else 0
      end as Pontos    
}
