@AbapCatalog.sqlViewName: 'ZIMCESTADIOS'
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
define view ZIM_C_ESTADIOS
  as select from ZIM_I_ESTADIOS
  association [0..*] to ZIM_C_CLUBES as _Clubes on _Clubes.id_estadio = $projection.id_estadio
  association [0..*] to ZIM_C_PARTIDASK as _PartidasHdr on _PartidasHdr.id_estadio = $projection.id_estadio
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
      
      created_at,

      @Semantics.user.createdBy: true
      created_by,

      changed_at,

      @Semantics.user.lastChangedBy: true
      changed_by,

//      @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
      _PartidasHdr,

      _Clubes

}
