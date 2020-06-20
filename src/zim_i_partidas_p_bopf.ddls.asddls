@AbapCatalog.sqlViewName: 'ZIMIPARTIDPBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Part., private view, VDM interface view'

//@VDM.viewType: #TRANSACTIONAL

@ObjectModel:{
    modelCategory: #BUSINESS_OBJECT,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZIM_PARTIDAS_P',
//    draftEnabled: true,
//    writeDraftPersistence: 'ZIM_PARTIDAS_P_D',    
    representativeKey: 'id_item',
    semanticKey: ['id_partida', 'id_item'],
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true
}

define view ZIM_I_PARTIDAS_P_BOPF
  as select from zim_partidas_p as PartidaItm
  association [1..1] to ZIM_I_PARTIDAS_K_BOPF as _PartidaHdr on _PartidaHdr.id_partida = PartidaItm.id_partida
{

      //PartidaItm
  key id_partida,
  key id_item,
      id_clube,
      placar,
      pontos,

    @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]      
     _PartidaHdr
}
