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
  key id_clube,
  key id_estadio,
      nometime,
      nomecompleto,
      fundacao,
      tecnico,
      filename

}
