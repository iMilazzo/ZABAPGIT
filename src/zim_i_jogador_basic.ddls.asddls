@AbapCatalog.sqlViewName: 'ZIMIJOGADORBASIC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view for JOGADOR'

@VDM.viewType: #BASIC
@Analytics.dataCategory: #DIMENSION
@ObjectModel:{

    representativeKey: 'id_jogador',
    semanticKey: 'id_jogador',

    usageType: {
        serviceQuality: #B,
        sizeCategory: #S,
        dataClass: #MASTER
    }
}
define view ZIM_I_JOGADOR_BASIC
  as select from zim_jogadores
{
      //zim_jogadores
  key client,
  key id_jogador,
      nome_jogador,
      created_at,
      created_by,
      changed_at,
      changed_by
}
