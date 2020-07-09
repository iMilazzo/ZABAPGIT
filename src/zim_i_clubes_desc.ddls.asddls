@AbapCatalog.sqlViewName: 'ZIMICLUBESDESC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Descr, private view, VDM interface view'

@VDM:{
    viewType: #BASIC,
    private: true
}
define view ZIM_I_CLUBES_DESC
  as select from zim_clubes_desc
{
      //zim_clubes_desc
  key id_clube,
      @Semantics.text: true
      descricao
}
