@AbapCatalog.sqlViewName: 'ZIMIESTADIOSBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Estadios, private view, VDM interf view'

@Analytics.dataCategory: #DIMENSION

@VDM.viewType: #BASIC
@ObjectModel:{
    representativeKey: 'id_estadio',
    semanticKey: 'id_estadio',
    transactionalProcessingEnabled: true,
    compositionRoot: true,    
    writeActivePersistence: 'ZIM_ESTADIOS',
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true
}
define view ZIM_I_ESTADIOS_BOPF as select from zim_estadios as Estadios 
    association [0..1] to ZIM_I_CLUBES_BOPF as _Clubes on _Clubes.id_estadio = Estadios.id_estadio
    association [0..*] to ZIM_I_PARTIDAS_BOPF as _Partidas on _Partidas.id_estadio = Estadios.id_estadio
{
    //zim_estadios
    key id_estadio,
    nomeestadio as NomeEstadio,
    capacidade as Capacidade,
    
    _Partidas,
    _Clubes

}
