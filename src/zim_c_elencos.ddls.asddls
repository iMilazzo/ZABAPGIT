@AbapCatalog.sqlViewName: 'ZIMCELENCOS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for Elencos'

@Metadata.allowExtensions: true
@VDM:{
    viewType: #CONSUMPTION
}
@OData: {
    entitySet: { name: 'ElencosSet' },
    entityType: { name: 'Elenco' }
}
@ObjectModel:{

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
  semanticKey: ['id_clube'],
  representativeKey: 'id_clube'

}
define view ZIM_C_ELENCOS
  as select from ZIM_I_ELENCOS
  association [1] to ZIM_C_CLUBES as _Clube on _Clube.id_clube = $projection.id_clube
  association [1] to ZIM_C_JOGADORES as _Jogador on _Jogador.id_jogador = $projection.id_jogador
  association [1] to ZIM_I_JOGADOR_VH as _JogadorVH on _JogadorVH.id_jogador = $projection.id_jogador
{

  key id_clube,

      @ObjectModel.foreignKey.association: '_JogadorVH'
      @ObjectModel.text.element:[ 'nome_jogador' ]
      @Consumption.valueHelp: '_JogadorVH'
      @Consumption.semanticObject: 'ZJOGADORESOP'
  key id_jogador,

      @Semantics.text: true
      _JogadorVH.nome_jogador as nome_jogador,
  
      posicao,
      camisa,
      
      @ObjectModel.association.type: [ #TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT ] 
      _Clube,
      _Jogador,
      _JogadorVH
}
