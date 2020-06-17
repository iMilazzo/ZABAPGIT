@AbapCatalog.sqlViewName: 'ZIMIPARTIDPCUBE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partidas, public view, VDM cube view'

@VDM.viewType: #BASIC
@ObjectModel:{
    representativeKey: 'id_item',
    semanticKey: 'id_item'
}

@Analytics: {
    dataCategory: #CUBE,
    dataExtraction.enabled: true
}

define view ZIM_I_PARTIDASP_CUBE
  as select from ZIM_I_PARTIDASP_VIEW as PartidasItem
  association [1..1] to ZIM_I_CLUBES_VIEW as _Clube on _Clube.ClubeID = $projection.ClubeID
  association [1..1] to ZIM_I_PARTIDASK_VIEW as _Partidas on _Partidas.id_partida = $projection.id_partida
{
  key PartidasItem.id_partida,
  key PartidasItem.id_item,

      @ObjectModel.foreignKey.association: '_Clube'
      @ObjectModel.text.association: '_Clube'
      @ObjectModel.text.element: ['NomeTime']
      PartidasItem.ClubeID,

      @DefaultAggregation: #SUM
      1 as QtdeJogos,

      @DefaultAggregation: #SUM
      PartidasItem.Placar,

      @DefaultAggregation: #SUM
      PartidasItem.Pontos,


      @ObjectModel.readOnly
      @Semantics.text: true
      PartidasItem._Clube.NomeTime,

      _Clube,
      _Partidas
}
