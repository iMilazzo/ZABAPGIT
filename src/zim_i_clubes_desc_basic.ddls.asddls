@AbapCatalog.sqlViewName: 'ZIMICLUDESCBAS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view for CLUBES_DESC'

@VDM.viewType: #BASIC
@ObjectModel:{
    usageType: {
        serviceQuality: #B,
        sizeCategory: #S,
        dataClass: #MASTER
    }
}
define view ZIM_I_CLUBES_DESC_BASIC
  as select from zim_clubes_desc
{
      //zim_clubes_desc
  key client,
  key id_clube,
      descricao

}
