@AbapCatalog.sqlViewName: 'ZIMIPARTIDKBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF for PartidasK'

@VDM.viewType: #TRANSACTIONAL
@ObjectModel:{

  modelCategory: #BUSINESS_OBJECT,
  compositionRoot: true,
  transactionalProcessingEnabled: true,

  writeActivePersistence: 'ZIM_PARTIDAS_K',
  draftEnabled: true,
  writeDraftPersistence: 'ZIM_PARTIDAS_KD',

  lifecycle.enqueue.expiryBehavior    : #RELATIVE_TO_LAST_CHANGE,
  lifecycle.enqueue.expiryInterval    : 'PT15M',
  
  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,

  representativeKey: ['id_partida'],
  semanticKey: ['id_partida']

}
define view ZIM_I_PARTIDASK_BOPF
  as select from ZIM_I_PARTIDASK_BASIC as Partida
//  association [1..*] to ZIM_I_PARTIDASP_BOPF as _Items on _Items.id_partida = Partida.id_partida
//  association [1..1] to ZIM_I_ESTADIOS_BOPF as _Estadio on _Estadio.id_estadio = Partida.id_estadio
 {
      @ObjectModel.mandatory: true
  key id_partida,
      data_partida,
      id_rodada,
      id_estadio,
      publico,
      @Semantics.amount.currencyCode: 'moeda'
      renda,
      @Semantics.currencyCode: true
      moeda

//      _Estadio
      
//      @ObjectModel.association.type: [ #TO_COMPOSITION_CHILD ]
//      _Items
}
