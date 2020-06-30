@AbapCatalog.sqlViewName: 'ZIMIPARTIDASKBAS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view for PARTIDASK'
define view ZIM_I_PARTIDASK_BASIC
  as select from zim_partidas_k
{

  key id_partida,
      data_partida,
      id_rodada,
      id_estadio,
      publico,
      @Semantics.amount.currencyCode: 'moeda'
      renda,
      @Semantics.currencyCode: true
      moeda

}
