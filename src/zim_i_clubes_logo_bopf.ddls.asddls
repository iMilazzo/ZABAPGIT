@AbapCatalog.sqlViewName: 'ZIMICLULOGOBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Logos, private view, VDM interface view'

@VDM.viewType:#BASIC
@ObjectModel:{
    representativeKey: 'id_clube',
    semanticKey: 'id_clube',
    writeActivePersistence: 'ZIM_CLUBES_LOGO',
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true
}
define view ZIM_I_CLUBES_LOGO_BOPF
  as select from zim_clubes_logo as Logo
  association [0..*] to ZIM_I_CLUBES_BOPF as _clubes on _clubes.id_clube = Logo.id_clube
{

    //Logo
    key id_clube,
    filename,
    content,
    
    _clubes
}
