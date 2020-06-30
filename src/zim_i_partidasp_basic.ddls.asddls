@AbapCatalog.sqlViewName: 'ZIMIPARTIDASPBAS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view for PARTIDASP'
define view ZIM_I_PARTIDASP_BASIC
  as select from zim_partidas_p
{

  key id_partida,
  key id_item,
      id_clube,
      placar,
      pontos

}
