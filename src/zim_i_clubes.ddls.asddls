@AbapCatalog.sqlViewName: 'ZIMICLUBES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clubes, private view, VDM interface view'

@VDM:{
    viewType: #BASIC,
    private: true
}
@Analytics.dataCategory: #DIMENSION
define view ZIM_I_CLUBES
  as select from zim_clubes
{

  key id_clube,
      id_estadio,
      
      @Semantics.text: true
      @Semantics.organization.name: true
      nome_time,
      nome_completo,
      fundacao,
      
      @Semantics.name.fullName: true
      nome_tecnico,

//      @Semantics.systemDateTime.createdAt: true
      @ObjectModel.readOnly: true
      created_at,

      @Semantics.user.createdBy: true
      @ObjectModel.readOnly: true
      created_by,

//      @Semantics.systemDateTime.lastChangedAt: true
      @ObjectModel.readOnly: true
      changed_at,

      @Semantics.user.lastChangedBy: true
      @ObjectModel.readOnly: true
      changed_by
 
 }
