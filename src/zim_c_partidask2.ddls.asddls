@AbapCatalog.sqlViewName: 'ZIMCPARTIDASK2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for PartidasK'

@Metadata.allowExtensions: true
@VDM:{
    viewType: #CONSUMPTION
}
@OData: {
    publish: true,
    entitySet: { name: 'PartidasHdrSet' },
    entityType: { name: 'PartidaHdr' }
}
@ObjectModel:{

  compositionRoot: true,
  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
  semanticKey: ['id_partida'],
  representativeKey: 'id_partida'

}
define view ZIM_C_PARTIDASK2
  as select from ZIM_I_PARTIDASK as PartidasHdr
  association [0..*] to ZIM_C_PARTIDASP as _Items on _Items.id_partida = $projection.id_partida 
  association [1] to ZIM_C_ESTADIOS as _Estadio on _Estadio.id_estadio = $projection.id_estadio
{

  key id_partida,
  
      @Semantics.businessDate.at: true
      data_partida,
      id_rodada,

      @ObjectModel.foreignKey.association: '_Estadio'
      @ObjectModel.text.element:[ 'nome_estadio' ]
      @Consumption.valueHelp: '_Estadio'
      @Consumption.semanticObject: 'ZESTADIOS'      
      id_estadio,

      @Semantics.text: true
      _Estadio.nome_estadio as nome_estadio,
            
      publico,
      
      @Semantics.amount.currencyCode: 'moeda'
      renda,

      @Semantics.currencyCode: true
      moeda,
      
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Items,
      
      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT]
      _Estadio

}
