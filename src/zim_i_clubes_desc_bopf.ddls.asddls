@AbapCatalog.sqlViewName: 'ZIMICLUDESCBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view for CLUBES_DESC'

@VDM.viewType: #TRANSACTIONAL
@ObjectModel:{

  representativeKey: 'id_clube',
  semanticKey: 'id_clube',

  transactionalProcessingEnabled: true,
  writeActivePersistence: 'ZIM_CLUBES_DESC',
//  writeDraftPersistence: 'ZIM_CLUBESDESC_D',

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true

}
define view ZIM_I_CLUBES_DESC_BOPF
  as select from zim_clubes_desc as Desc
  association [0..1] to ZIM_I_CLUBES_BOPF as _Clube on _Clube.id_clube = $projection.id_clube
{
      //zim_clubes_desc
  key client,
  key id_clube,
      descricao,

      _Clube

}
