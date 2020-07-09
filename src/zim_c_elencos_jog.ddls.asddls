@AbapCatalog.sqlViewName: 'ZIMCELENCOSJOG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Jogadores, private view, VDM interf view'

@VDM:{
    viewType: #BASIC,
    private: true
}
define view ZIM_C_ELENCOS_JOG
  as select from zim_elencos
  association [1] to ZIM_I_JOGADORES as _Jogador on _Jogador.id_jogador = $projection.id_jogador
  association [1] to ZIM_I_JOGADOR_VH as _JogadorVH on _JogadorVH.id_jogador = $projection.id_jogador
{
      //zim_elencos
  key id_clube,
  
      @ObjectModel.foreignKey.association: '_JogadorVH'
      @ObjectModel.text.element:[ 'nome_jogador' ]
      @Consumption.valueHelp: '_JogadorVH'
      @Consumption.semanticObject: 'ZJOGADORESOP'  
  key id_jogador,
  
      posicao,
      camisa,
      
      _Jogador,
      _JogadorVH
}
