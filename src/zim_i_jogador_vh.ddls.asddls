@AbapCatalog.sqlViewName: 'ZIMIJOGADORVH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Jogadores,private view,VDM interf view'

@VDM:{
    viewType: #BASIC,
    private: true
}
@OData: {
    entitySet: { name: 'JogadoresVHSet' },
    entityType: { name: 'JogadoresVH' }
}
define view ZIM_I_JOGADOR_VH
  as select from zim_jogadores
{
      //zim_jogadores
  key id_jogador,
      @Semantics.text: true
      @Semantics.name.fullName: true
      nome_jogador,
      created_at,
      created_by,
      changed_at,
      changed_by
      
}
