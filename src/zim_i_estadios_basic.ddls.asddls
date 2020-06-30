@AbapCatalog.sqlViewName: 'ZIMIESTADIOSBAS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view ESTADIOS'

@Analytics.dataCategory: #DIMENSION
@VDM.viewType: #BASIC
@ObjectModel:{
    usageType: {
        serviceQuality: #B,
        sizeCategory: #S,
        dataClass: #MASTER
    }
}
define view ZIM_I_ESTADIOS_BASIC
  as select from zim_estadios
{

  key id_estadio,
      nome_estadio,
      cidade,
      uf,
      capacidade,
      geocode,
      created_at,
      created_by,
      changed_at,
      changed_by

}
