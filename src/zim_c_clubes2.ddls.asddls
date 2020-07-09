@AbapCatalog.sqlViewName: 'ZIMCCLUBES2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clubes, consume view'

@Metadata.allowExtensions: true
@VDM:{
    viewType: #CONSUMPTION
}
@OData: {
    entitySet: { name: 'ClubesSet' },
    entityType: { name: 'Clube' }
}
@ObjectModel:{

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
  semanticKey: ['id_clube'],
  representativeKey: 'id_clube'
//  entityChangeStateId: 'changed_at'

}
define view ZIM_C_CLUBES2
  as select from ZIM_CO_CLUBES as Clubes
  association [1] to ZIM_C_ESTADIOS2 as _Estadio on _Estadio.id_estadio = $projection.id_estadio
{

  key id_clube,


      @ObjectModel.foreignKey.association: '_Estadio'
      @ObjectModel.text.element:[ 'nome_estadio' ]
      @Consumption.valueHelp: '_Estadio'
      @Consumption.semanticObject: 'ZESTADIOS'
      id_estadio,

      //      @ObjectModel.readOnly
      @Semantics.text: true
      _Estadio.nome_estadio as nome_estadio,

      @Semantics.text: true
      _Desc.descricao       as descricao,

      @Semantics.text: true
      @Semantics.organization.name: true
      nome_time,
      nome_completo,
      fundacao,

      @Semantics.name.fullName: true
      nome_tecnico,

      @Semantics.systemDateTime.createdAt: true
      created_at,

      @Semantics.user.createdBy: true
      created_by,

      @Semantics.systemDateTime.lastChangedAt: true
      changed_at,

      @Semantics.user.lastChangedBy: true
      changed_by,

      _Estadio

}
