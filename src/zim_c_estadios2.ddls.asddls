@AbapCatalog.sqlViewName: 'ZIMCESTADIOS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for Estadios'

@Metadata.allowExtensions: true
@VDM:{
    viewType: #CONSUMPTION
}
@OData: {
    publish: true,
    entitySet: { name: 'EstadiosSet' },
    entityType: { name: 'Estadios' }
}
@ObjectModel:{

  compositionRoot: true,
  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
  semanticKey: ['id_estadio'],
  representativeKey: 'id_estadio'

}
define view ZIM_C_ESTADIOS2
  as select from ZIM_I_ESTADIOS
  association [0..*] to ZIM_C_CLUBES2 as _Clube on _Clube.id_estadio = $projection.id_estadio
  association [0..*] to ZIM_C_PARTIDASK2 as _Partidas on _Partidas.id_estadio = $projection.id_estadio
{

  key id_estadio,
  
      @Semantics.organization.name: true
      nome_estadio,
      
      @Semantics.address.city: true
      cidade,
      
      @Semantics.address.region: true
      uf,
      
      capacidade,
      geocode,
      
      @Semantics.geoLocation.latitude: true
      latitude,
      
      @Semantics.geoLocation.longitude: true
      longitude,
      
      @Semantics.systemDateTime.createdAt: true
      created_at,

      @Semantics.user.createdBy: true
      created_by,

      @Semantics.systemDateTime.lastChangedAt: true
      changed_at,

      @Semantics.user.lastChangedBy: true
      changed_by,

      
      _Clube,
      
      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _Partidas
}
