@AbapCatalog.sqlViewName: 'ZIMIJOGADORBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF for JOGADORES'

@VDM.viewType: #TRANSACTIONAL
@Analytics.dataCategory: #DIMENSION
@Search.searchable: true
@ObjectModel:{

    representativeKey: 'id_jogador',
    semanticKey: 'id_jogador',

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
    entityChangeStateId: 'changed_at'    
}
define view ZIM_I_JOGADOR_BOPF
  as select from zim_jogadores as Jogador
  association [0..*] to ZIM_I_ELENCOS_BOPF as _Elenco on _Elenco.id_jogador = Jogador.id_jogador
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
