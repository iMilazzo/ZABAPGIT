@AbapCatalog.sqlViewName: 'ZIMIPARTIDPVIEW'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Part., private view, VDM interface view'
@VDM.viewType: #BASIC

@ObjectModel:{
    representativeKey: ['id_partida', 'id_item'],
    semanticKey: 'id_item',
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZIM_PARTIDAS_P',
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true
}
define view ZIM_I_PARTIDASP_VIEW as select from zim_partidas_p as PartidaItem
    association [1..1] to ZIM_I_CLUBES_VIEW as _Clube on _Clube.ClubeID = $projection.ClubeID
{

    key PartidaItem.id_partida,
    key PartidaItem.id_item,
    @ObjectModel.text.association: '_Clube'
    @ObjectModel.foreignKey.association: '_Clube'
    PartidaItem.id_clube as ClubeID,
    PartidaItem.placar as Placar,
    PartidaItem.pontos as Pontos,

    _Clube
    
}
