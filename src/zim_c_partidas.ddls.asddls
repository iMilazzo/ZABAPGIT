@AbapCatalog.sqlViewName: 'ZIMCPARTIDAS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption view for PartidasK'

@Metadata.allowExtensions: true
@VDM:{
    viewType: #CONSUMPTION
}
@OData: {
    publish: true,
    entitySet: { name: 'PartidasSet' },
    entityType: { name: 'Partida' }
}
@ObjectModel:{

  action: [{ enabled: true, label: 'Action 1', name: 'ACTION1', parameter:{ dataType: 'id_clube'} }],
  compositionRoot: true,
  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
  semanticKey: ['id_clube'],
  representativeKey: 'id_clube'
//  entityChangeStateId: 'changed_at'

}
define view ZIM_C_PARTIDAS
  as select from ZIM_I_PARTIDASK as PartidasHdr
  association [0..*] to ZIM_C_PARTIDASP as _Item on _Item.id_partida = $projection.id_partida 
{

  key id_partida,
      data_partida,
      id_rodada,
      id_estadio,
      publico,
      renda,
      moeda,
      
      _Item

}
