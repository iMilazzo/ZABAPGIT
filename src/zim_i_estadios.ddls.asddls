@AbapCatalog.sqlViewName: 'ZIMIESTADIOS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Estadios,private view,VDM interface view'

@VDM:{
    viewType: #BASIC,
    private: true
}
define view ZIM_I_ESTADIOS
  as select from zim_estadios
{
      //zim_estadios
  key id_estadio,
      @Semantics.text: true
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
      created_by,
      changed_at,
      changed_by
}
