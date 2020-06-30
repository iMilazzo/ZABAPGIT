@AbapCatalog.sqlViewName: 'ZIMIJOGADORVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for JOGADOR'

@Search.searchable: true
define view ZIM_I_JOGADOR_VH
  as select from zim_jogadores
{
      //zim_jogadores
  key id_jogador,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8  
      nome_jogador
}
