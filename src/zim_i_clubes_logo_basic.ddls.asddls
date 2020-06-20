@AbapCatalog.sqlViewName: 'ZIMICLULOGOBASIC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Logos, private view, VDM interface view'

@VDM.viewType:#BASIC
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

    //Logo
    key id_clube,
    filename,
    content
    
}
