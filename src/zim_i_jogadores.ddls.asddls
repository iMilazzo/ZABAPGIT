@AbapCatalog.sqlViewName: 'ZIMIJOGADORES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Jogadores,private view,VDM interf view'

@VDM:{
    viewType: #BASIC,
    private: true
}
@OData: {
    entitySet: { name: 'JogadoresSet' },
    entityType: { name: 'Jogadores' }
}
define view ZIM_I_JOGADORES
  as select from zim_jogadores
{
      //zim_jogadores
  key id_jogador,
  
      @Semantics.text: true
      @Semantics.name.fullName: true
      nome_jogador,
      
      created_at,
      
      @Semantics.user.createdBy: true
      created_by,
      
      changed_at,
      
      @Semantics.user.lastChangedBy: true
      changed_by
      
}
