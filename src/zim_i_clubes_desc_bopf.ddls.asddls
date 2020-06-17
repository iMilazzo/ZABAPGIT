@AbapCatalog.sqlViewName: 'ZIMICLUDESCBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Descr, private view, VDM interface view'

@VDM.viewType:#BASIC
@ObjectModel:{
    representativeKey: 'id_clube',
    semanticKey: 'id_clube',
    writeActivePersistence: 'ZIM_CLUBES_DESC',
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true
}
define view ZIM_I_CLUBES_DESC_BOPF
  as select from zim_clubes_desc as Descricao
  association [0..*] to ZIM_I_CLUBES_BOPF as _clubes on _clubes.id_clube = Descricao.id_clube
{

      //Descricao
  key id_clube,
      descricao,

      _clubes

}
