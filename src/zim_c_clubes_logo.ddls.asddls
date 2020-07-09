@AbapCatalog.sqlViewName: 'ZIMCCLUBESLOGO'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for Logos'

@VDM:{
    viewType: #CONSUMPTION
}
@OData: {
    entitySet: { name: 'LogosSet' },
    entityType: { name: 'Logo' }
}
@ObjectModel:{

  semanticKey: ['id_clube'],
  representativeKey: 'id_clube'

}
define view ZIM_C_CLUBES_LOGO
  as select from ZIM_I_CLUBES_LOGO
  association [1] to ZIM_C_CLUBES as _Clube on _Clube.id_clube = $projection.id_clube
{

      //ZIM_I_CLUBES_LOGO
  key id_clube,
      filename,
      content,

      _Clube
}
