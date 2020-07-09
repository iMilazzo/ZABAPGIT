@AbapCatalog.sqlViewName: 'ZIMIELENCOS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clubes, private view, VDM interface view'

@VDM:{
    viewType: #BASIC,
    private: true
}
define view ZIM_I_ELENCOS
  as select from zim_elencos
{
      //zim_elencos
  key id_clube,
  key id_jogador,
      posicao,
      camisa
}
