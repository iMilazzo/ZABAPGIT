@AbapCatalog.sqlViewName: 'ZIMICLULOGOBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic view for CLUBES_LOGO'

@VDM.viewType: #TRANSACTIONAL
@ObjectModel:{

  representativeKey: 'id_clube',
  semanticKey: 'id_clube',

  transactionalProcessingEnabled: true,
  writeActivePersistence: 'ZIM_CLUBES_LOGO',
//  writeDraftPersistence: 'ZIM_CLUBESDESC_D',

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true

}
define view ZIM_I_CLUBES_LOGO_BOPF
  as select from zim_clubes_logo as Logo
  association [0..1] to ZIM_I_CLUBES_BOPF as _Clube on _Clube.id_clube = $projection.id_clube
{
      //Logo

  key id_clube,
      filename,
      content,

      _Clube

}
