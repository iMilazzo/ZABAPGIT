@AbapCatalog.sqlViewName: 'ZIMIJOGADOR'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for Jogadores'

@Metadata.allowExtensions: true
@VDM:{
    viewType: #CONSUMPTION
}
@OData: {
    entitySet: { name: 'JogadoresSet' },
    entityType: { name: 'Jogadores' }
}
@ObjectModel:{

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
  semanticKey: ['id_jogador'],
  representativeKey: 'id_jogador'

}
define view ZIM_C_JOGADORES
  as select from ZIM_I_JOGADORES
  association [0..*] to ZIM_C_ELENCOS as _Elenco on _Elenco.id_jogador = $projection.id_jogador 
{
      //zim_jogadores
  key id_jogador,
  
      @Semantics.text: true
      @Semantics.name.fullName: true
      nome_jogador,

//      @Semantics.systemDateTime.createdAt: true
      created_at,

      @Semantics.user.createdBy: true
      created_by,

//      @Semantics.systemDateTime.lastChangedAt: true
      changed_at,

      @Semantics.user.lastChangedBy: true
      changed_by,
      
      _Elenco
}
