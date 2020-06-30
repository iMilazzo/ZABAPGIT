@AbapCatalog.sqlViewName: 'ZIMIESTADIOSNEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view ESTADIOS'

@VDM.viewType: #BASIC
@ObjectModel:{
    usageType: {
        serviceQuality: #B,
        sizeCategory: #S,
        dataClass: #MASTER
    }
}
define view ZIM_I_ESTADIOS_NEW
  as select from zim_estadios
{

  key id_estadio,
      nome_estadio,
      cidade,
      uf,
      capacidade,
      geocode,
      latitude,
      longitude,
      created_at,
      created_by,
      changed_at,
      changed_by

}
