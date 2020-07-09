@AbapCatalog.sqlViewName: 'ZIMIELENCOSJOG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Jogadores, private view, VDM interf view'

@VDM:{
    viewType: #BASIC,
    private: true
}
define view ZIM_I_ELENCOS_JOG
  as select from zim_elencos
  association [1] to zim_jogadores as _Jogador on _Jogador.id_jogador = $projection.id_jogador
{
      //zim_elencos
  key id_clube,
  key id_jogador,
      posicao,
      camisa,
      
      _Jogador
}
