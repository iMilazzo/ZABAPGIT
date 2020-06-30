@AbapCatalog.sqlViewName: 'ZIMIPARTIDPBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF for PartidasP'

@VDM.viewType: #TRANSACTIONAL
@ObjectModel:{

  writeActivePersistence: 'ZIM_PARTIDAS_P',
  writeDraftPersistence: 'ZIM_PARTIDAS_PD',

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,

  representativeKey: ['id_item'],
  semanticKey: ['id_partida', 'id_item']

}
define view ZIM_I_PARTIDASP_BOPF
  as select from ZIM_I_PARTIDASP_BASIC as Item
  association [1..1] to ZIM_I_PARTIDASK_BOPF as _Header on _Header.id_partida = Item.id_partida
  association [1..1] to ZIM_I_CLUBES_BOPF as _Clube on _Clube.id_clube = Item.id_clube
  
{

      @ObjectModel.mandatory: true
  key id_partida,
      @ObjectModel.mandatory: true
  key id_item,
      id_clube,
      placar,
      pontos,
      
      _Clube,
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT ]
      _Header

}
