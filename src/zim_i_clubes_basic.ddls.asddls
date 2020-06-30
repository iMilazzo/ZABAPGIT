@AbapCatalog.sqlViewName: 'ZIMICLUBESBAS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clubes, private view, VDM interface view'

@Analytics.dataCategory: #DIMENSION
@VDM.viewType: #BASIC
@ObjectModel:{
    usageType: {
        serviceQuality: #B,
        sizeCategory: #S,
        dataClass: #MASTER
    }
}
define view ZIM_I_CLUBES_BASIC
  as select from zim_clubes
{
      //zim_clubes
  key id_clube,
      id_estadio,
      nome_time,
      nome_completo,
      fundacao,
      nome_tecnico,
      created_at,
      created_by,
      changed_at,
      changed_by

}
