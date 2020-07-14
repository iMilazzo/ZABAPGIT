@AbapCatalog.sqlViewName: 'ZIMCCLUBES'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clubes, consume view'

@Metadata.allowExtensions: true
@VDM:{
    viewType: #CONSUMPTION
}
@OData: {
    publish: true,
    entitySet: { name: 'ClubesSet' },
    entityType: { name: 'Clube' }
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
@Analytics.dataCategory: #FACT
//@Analytics.query: true
define view ZIM_C_CLUBES
  as select from ZIM_CO_CLUBES as Clubes
  association [1]    to ZIM_C_CLUBES_DESC as _Desc    on _Desc.id_clube = $projection.id_clube
  association [1]    to ZIM_C_CLUBES_LOGO as _Logo    on _Logo.id_clube = $projection.id_clube
  association [1]    to ZIM_C_ESTADIOS    as _Estadio on _Estadio.id_estadio = $projection.id_estadio
  association [1..*] to ZIM_C_ELENCOS     as _Elenco  on _Elenco.id_clube = $projection.id_clube
  association [0..*] to ZIM_C_PARTIDASP   as _Items   on _Items.id_clube = $projection.id_clube
  association [1]    to ZIM_C_CLUBES_KPI  as _KPI     on _KPI.id_clube = $projection.id_clube
{

      @ObjectModel.readOnly: true
  key id_clube,


      @ObjectModel.foreignKey.association: '_Estadio'
      @ObjectModel.text.element:[ 'nome_estadio' ]
      @Consumption.valueHelp: '_Estadio'
      @Consumption.semanticObject: 'ZESTADIOS'
      id_estadio,

      @ObjectModel.readOnly
      @Semantics.text: true
      nome_estadio,

      @Semantics.text: true
      _Desc.descricao                         as descricao,

      @Semantics.text: true
      @Semantics.organization.name: true
      nome_time,
      nome_completo,
      fundacao,

      @Semantics.name.fullName: true
      nome_tecnico,

      @ObjectModel.readOnly: true
      created_at,

      @Semantics.user.createdBy: true
      @ObjectModel.readOnly: true
      created_by,

      @ObjectModel.readOnly: true
      changed_at,

      @Semantics.user.lastChangedBy: true
      @ObjectModel.readOnly: true
      changed_by,

      @ObjectModel.readOnly
      @Semantics.imageUrl: true
      _Logo.content                           as Logo,

      @ObjectModel.readOnly
      @Semantics.imageUrl: true
      concat( '.\\images\\', _Logo.filename ) as LogoURL,
      
      @EndUserText.label: 'Total do Gols'
      @ObjectModel.readOnly
      _KPI.gols,

      @EndUserText.label: 'Total do Pontos'
      @ObjectModel.readOnly
      _KPI.pontos,
     
//      @EndUserText.label: 'Menor Pontos'
//      @ObjectModel.readOnly
//      _KPI.minimo as minimo,
//
//      @EndUserText.label: 'Maior Pontos'
//      @ObjectModel.readOnly
//      _KPI.maximo as maximo,

      @EndUserText.label: 'Aproveitamento'
      @ObjectModel.readOnly
      cast( ( division( _KPI.pontos, 114, 4 ) * 100 ) as abap.dec( 5, 2 )) as kpi,


      _Desc,
      _Logo,
      _Estadio,

      @ObjectModel.association.type: #TO_COMPOSITION_CHILD
      _Elenco,
      _Items

}
