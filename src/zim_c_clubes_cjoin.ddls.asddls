@AbapCatalog.sqlViewName: 'ZIMCCLUBESCJOIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view to CLUBES'

@Metadata.allowExtensions: true
@VDM.viewType : #CONSUMPTION
@Search.searchable: true
@ObjectModel:{

  transactionalProcessingDelegated : true,

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
//  draftEnabled: true,

  semanticKey: ['id_clube'],
  representativeKey: 'id_clube'

}

define view ZIM_C_CLUBES_CJOIN
  as select from ZIM_I_CLUBES_JOIN as Clubes
  association [1..1] to ZIM_I_CLUBES_DESC_BOPF as _Desc    on _Desc.id_clube = $projection.id_clube
  association [1..1] to ZIM_I_CLUBES_LOGO_BOPF as _Logo    on _Logo.id_clube = $projection.id_clube
  association [1..1] to ZIM_C_ESTADIOS_CNEW   as _Estadio on _Estadio.id_estadio = $projection.id_estadio
  
{
  key id_clube,

      @Search: {
          defaultSearchElement: true,
          ranking: #HIGH,
          fuzzinessThreshold: 0.8
      }
      nome_time,

      @ObjectModel.readOnly
      _Desc.descricao as descricao,

      nome_completo,

      fundacao,

      nome_tecnico,

//      filename,

      /* Associations */
      @ObjectModel.readOnly
      @Semantics.imageUrl: true
      concat('/webapp/images/',_Logo.filename) as LogoURL,

      @ObjectModel.readOnly
      _Logo.content as logo,

      @ObjectModel.readOnly
      _Estadio.id_estadio,
      
      _Estadio


}
