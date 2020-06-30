@AbapCatalog.sqlViewName: 'ZIMCJOGADORCBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF for JOGADORES'

@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION
@Search.searchable: true
@ObjectModel:{

    representativeKey: 'id_jogador',
    semanticKey: 'id_jogador',

    transactionalProcessingDelegated  : false,
    createEnabled: false,
    updateEnabled: false,
    deleteEnabled: false
  
}
define view ZIM_C_JOGADOR_CBOPF
  as select from ZIM_I_JOGADOR_BASIC as Jogador
  association [0..*] to ZIM_C_ELENCO_CBOPF as _Elenco on _Elenco.id_jogador = $projection.id_jogador
{
      //zim_jogadores
      @ObjectModel.mandatory: true
  key id_jogador,
      @Semantics.text:true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      nome_jogador,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at,
      @Semantics.user.lastChangedBy: true
      changed_by,
      
      _Elenco
}
