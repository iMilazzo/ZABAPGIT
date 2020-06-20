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
    association [0..1] to ZIM_I_PARTIDASK_VIEW as _PartidaHeader on _PartidaHeader.id_partida = $projection.id_partida
{

    key PartidaItem.id_partida,
    key PartidaItem.id_item,
    @ObjectModel: {
        text.element: ['NomeTime'],
        text.association: '_Clube',
        foreignKey.association: '_Clube'
    }    
    PartidaItem.id_clube as ClubeID,
    PartidaItem.placar as Placar,
    PartidaItem.pontos as Pontos,

    @ObjectModel.readOnly
    @Semantics.text: true
    _Clube.NomeTime,


    _Clube,
    @ObjectModel.association.type:  [#TO_COMPOSITION_ROOT ] 
    _PartidaHeader
    
}
