@AbapCatalog.sqlViewName: 'ZIMCCLUBESCBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view to CLUBES'

@Metadata.allowExtensions: true
@VDM.viewType : #CONSUMPTION
@OData.publish:true
@Search.searchable: true
@ObjectModel:{

  compositionRoot: true,
  transactionalProcessingDelegated : true,

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
//  draftEnabled: true,

  semanticKey: ['id_clube'],
  representativeKey: 'id_clube',

  usageType: {
      serviceQuality: #D,
      sizeCategory: #S,
      dataClass: #TRANSACTIONAL
      }
}

define view ZIM_C_CLUBES_CBOPF
  as select from ZIM_I_CLUBES_BOPF as Clubes
  association [0..1] to ZIM_I_CLUBES_DESC_BOPF as _Desc        on _Desc.id_clube = $projection.id_clube
  association [0..1] to ZIM_I_CLUBES_LOGO_BOPF as _Logo        on _Logo.id_clube = $projection.id_clube
  association [0..1] to ZIM_C_ESTADIOS_CBOPF   as _Estadio     on _Estadio.id_estadio = $projection.id_estadio
  association [0..*] to ZIM_C_ELENCO_CBOPF     as _Elenco      on _Elenco.id_clube = $projection.id_clube
  association [0..*] to ZIM_C_PARTIDASP_CBOPF  as _PartidasItm on _PartidasItm.id_clube = $projection.id_clube
{
  key id_clube,

      @Search: {
          defaultSearchElement: true,
          ranking: #HIGH,
          fuzzinessThreshold: 0.8
      }
      nome_time,

      @ObjectModel.readOnly
      _Desc.descricao                          as descricao,

      nome_completo,

      @ObjectModel.text.element: 'nome_estadio'
      @ObjectModel.text.association: '_Estadio'
      @ObjectModel.foreignKey.association: '_Estadio'
      @Consumption.valueHelp: '_Estadio'
      @Consumption.semanticObject: 'ZESTADIOS'
      //@ObjectModel.semanticKey: '_Estadio'
      id_estadio,

      @ObjectModel.readOnly
      @Semantics.text: true
      _Estadio.nome_estadio                    as nome_estadio,

      fundacao,

      nome_tecnico,

//      filename,

      @ObjectModel.readOnly
      created_at,

      @ObjectModel.readOnly
      created_by,

      @ObjectModel.readOnly
      changed_at,

      @ObjectModel.readOnly
      changed_by,

      /* Associations */
      @ObjectModel.readOnly
      @Semantics.imageUrl: true
      concat('/webapp/images/',_Logo.filename) as LogoURL,

      @ObjectModel.readOnly
      @Semantics.imageUrl: true
      _Logo.content                            as logo,


      @ObjectModel.readOnly
      _Estadio.capacidade                      as capacidade,

      _Estadio,

      @ObjectModel.association.type: [ #TO_COMPOSITION_CHILD ]
      _Elenco,
      _PartidasItm
}
