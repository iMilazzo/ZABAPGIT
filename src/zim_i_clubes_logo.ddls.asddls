@AbapCatalog.sqlViewName: 'ZIMICLUBESLOGO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Logo, private view, VDM interface view'

@VDM:{
    viewType: #BASIC,
    private: true
}
define view ZIM_I_CLUBES_LOGO
  as select from zim_clubes_logo
{
      //zim_clubes_logo
  key id_clube,
      filename,
      @Semantics.text: true
      content
}
