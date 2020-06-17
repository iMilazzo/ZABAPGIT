@AbapCatalog.sqlViewName: 'ZIMCESTADIOSBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Estadios,public view,VDM cons view'

@VDM.viewType: #CONSUMPTION

@ObjectModel:{
    representativeKey: 'id_estadio',
    semanticKey: 'id_estadio',
    transactionalProcessingDelegated: true,    
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true
}
@OData.publish: true
define view ZIM_C_ESTADIOS_BOPF as select from ZIM_I_ESTADIOS_BOPF

{
    //ZIM_I_ESTADIOS_BOPF

    @EndUserText.label: 'ID do Estádio'
    @UI.lineItem.position: 10
    @UI.identification.position: 10
    key id_estadio,

    @EndUserText.label: 'Nome do Estádio'
    @UI.lineItem.position: 20
    @UI.identification.position: 20
    NomeEstadio,

    @EndUserText.label: 'Capacidade'
    @UI.lineItem.position: 30
    @UI.identification.position: 30
    Capacidade,

    /* Associations */
    //ZIM_I_ESTADIOS_BOPF
    _Clubes,
    _Partidas
}
