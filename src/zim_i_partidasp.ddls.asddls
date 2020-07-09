@AbapCatalog.sqlViewName: 'ZIMIPARTIDASP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Partidas, private view, VDM interf view'

@VDM:{
    viewType: #BASIC,
    private: true
}
@Analytics.dataCategory: #FACT
define view ZIM_I_PARTIDASP
  as select from zim_partidas_p
{

  key id_partida,
  key id_item,
      id_clube,
      placar,
      pontos,
      partida_class,
      partida_ref

}
