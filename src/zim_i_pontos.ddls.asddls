@AbapCatalog.sqlViewName: 'ZIMIPONTOS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Pontos, private view, VDM interface view'
@VDM.viewType: #BASIC

@ObjectModel:{
    representativeKey: 'id_clube',
    semanticKey: 'id_clube'
}

define view ZIM_I_PONTOS as select from ZIM_I_CLUBES_VIEW as Clubes
    
    association [0..*] to ZIM_I_PARTIDAS_VIEW as _PartidasA on _PartidasA.id_time_a = $projection.ClubeID
    association [0..*] to ZIM_I_PARTIDAS_VIEW as _PartidasB on _PartidasB.id_time_b = $projection.ClubeID
{

    key Clubes.ClubeID,
        Clubes.NomeTime,

      @EndUserText.label: 'Pontos'
      @DefaultAggregation: #SUM
      case when _PartidasA.Placar_Time_A > _PartidasB.Placar_Time_B then 3
           when _PartidasA.Placar_Time_A < _PartidasB.Placar_Time_B then 3
           when _PartidasA.Placar_Time_A = _PartidasB.Placar_Time_B then 1
           else 0
      end as Pontos

    
}
