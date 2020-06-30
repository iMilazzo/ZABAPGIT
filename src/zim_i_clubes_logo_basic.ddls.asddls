@AbapCatalog.sqlViewName: 'ZIMICLULOGOBASIC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view for CLUBES_LOGO'

@VDM.viewType: #BASIC
@ObjectModel:{
    usageType: {
        serviceQuality: #B,
        sizeCategory: #S,
        dataClass: #MASTER
    }
}
define view ZIM_I_CLUBES_LOGO_BASIC
  as select from zim_clubes_logo
{
      //zim_clubes_logo
  key client,
  key id_clube,
      filename,
      content
}
