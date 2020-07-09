@AbapCatalog.sqlViewName: 'ZIMIESTADIOSD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Estadios,private view,VDM interface view'

@VDM:{
    viewType: #BASIC,
    private: true
}
@Analytics: {
    dataCategory: #DIMENSION,
    dataExtraction.enabled
}
define view ZIM_I_ESTADIOS_D
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
      geocode
}
