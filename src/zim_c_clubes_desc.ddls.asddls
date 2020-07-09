@AbapCatalog.sqlViewName: 'ZIMCCLUBESDESC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for Descriptions'

@VDM:{
    viewType: #CONSUMPTION
}
@OData: {
    entitySet: { name: 'DescriptionsSet' },
    entityType: { name: 'Description' }
}
@ObjectModel:{

  semanticKey: ['id_clube'],
  representativeKey: 'id_clube'

}
define view ZIM_C_CLUBES_DESC
  as select from ZIM_I_CLUBES_DESC
  association [1] to ZIM_C_CLUBES as _Clube on $projection.id_clube = _Clube.id_clube
{

      //zim_i_clubes_desc
  key id_clube,
      descricao,

      _Clube
}
