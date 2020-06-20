@AbapCatalog.sqlViewName: 'ZIMIPARTIDKBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Part., private view, VDM interface view'

//@VDM.viewType: #TRANSACTIONAL
    
@ObjectModel:{
    modelCategory: #BUSINESS_OBJECT,
    compositionRoot: true,
    transactionalProcessingEnabled: true,
    transactionalProcessingUnitRoot: true,
    writeActivePersistence: 'ZIM_PARTIDAS_K',
//    draftEnabled: true,
//    writeDraftPersistence: 'ZIM_PARTIDAS_K_D',
    representativeKey: 'id_partida',
    semanticKey: ['id_partida'],
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true
}
define view ZIM_I_PARTIDAS_K_BOPF as select from zim_partidas_k as PartidaHdr
    association [0..*] to ZIM_I_PARTIDAS_P_BOPF as _PartidaItm on _PartidaItm.id_partida = PartidaHdr.id_partida
{

    key id_partida,
    id_estadio,
    @Semantics.businessDate.at: true
    data,
    id_rodada,
    publico,
    @Semantics.amount.currencyCode: 'moeda'
    renda,
    @Semantics.currencyCode: true
    moeda,
    
    @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
    _PartidaItm
}
