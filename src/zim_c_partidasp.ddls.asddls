@AbapCatalog.sqlViewName: 'ZIMCPARTIDASP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for PartidasP'

@Metadata.allowExtensions: true
@VDM:{
    viewType: #CONSUMPTION
}
@OData: {
    entitySet: { name: 'PartidasItmSet' },
    entityType: { name: 'PartidaItm' }
}
@ObjectModel:{
  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
  semanticKey: ['id_partida', 'id_item'],
  representativeKey: 'id_item'
}
@Analytics.dataCategory: #FACT
define view ZIM_C_PARTIDASP
  as select from ZIM_I_PARTIDASP as PartidasItm
  association [1] to ZIM_C_PARTIDASK as _Header on _Header.id_partida = $projection.id_partida
  association [1] to ZIM_C_CLUBES    as _Clube  on _Clube.id_clube = $projection.id_clube
  association [1] to ZIM_I_CLUBES_VH as _ClubeVH  on _ClubeVH.id_clube = $projection.id_clube
{

      @ObjectModel.readOnly: true
  key id_partida,

      @ObjectModel.readOnly: true
  key id_item,

      @ObjectModel.foreignKey.association: '_ClubeVH'
      @ObjectModel.text.element:[ 'nome_time' ]
      @Consumption.valueHelp: '_ClubeVH'
      @Consumption.semanticObject: 'ZCLUBESOP'  
      id_clube,

      @Semantics.text: true
      _ClubeVH.nome_time as nome_time,      
      
      placar,
      pontos,

      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _Header,
      _Clube,
      _ClubeVH


}
