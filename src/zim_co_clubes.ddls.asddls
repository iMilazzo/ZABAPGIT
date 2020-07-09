@AbapCatalog.sqlViewName: 'ZIMCOCLUBES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clubes, composite public view'

@VDM:{
    viewType: #COMPOSITE,
    private: true
}

@ObjectModel:{
  compositionRoot: true,

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,

  semanticKey: ['id_clube'],
  representativeKey: 'id_clube'
//  entityChangeStateId: 'changed_at'

}
@Analytics.dataCategory: #DIMENSION

define view ZIM_CO_CLUBES
  as select from ZIM_I_CLUBES
  association [1] to ZIM_C_CLUBES_DESC as _Desc    on _Desc.id_clube = $projection.id_clube
  association [1] to ZIM_C_CLUBES_LOGO as _Logo    on _Logo.id_clube = $projection.id_clube
  association [1] to ZIM_C_ESTADIOS    as _Estadio on _Estadio.id_estadio = $projection.id_estadio
  association [1..*] to ZIM_C_ELENCOS_JOG as _Elenco  on _Elenco.id_clube = $projection.id_clube

{

  key id_clube,

      @ObjectModel.foreignKey.association: '_Estadio'
      @ObjectModel.text.element:[ 'nome_estadio' ]
      id_estadio,

      @Semantics.text: true
      _Estadio.nome_estadio as nome_estadio,

      @Semantics.text: true
      @Semantics.organization.name: true
      nome_time,
      nome_completo,
      fundacao,
      @Semantics.name.fullName: true
      nome_tecnico,

//      @Semantics.systemDateTime.createdAt: true
      created_at,

      @Semantics.user.createdBy: true
      created_by,

//      @Semantics.systemDateTime.lastChangedAt: true
      changed_at,

      @Semantics.user.lastChangedBy: true
      changed_by,


      _Desc,
      _Logo,
      _Estadio,

      //      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _Elenco

}
