@AbapCatalog.sqlViewName: 'ZIMIESTADIOS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Estadios, private view, VDM interf view'
@Analytics.dataCategory: #DIMENSION

@VDM.viewType: #BASIC
@ObjectModel:{
    representativeKey: 'EstadioID',
    semanticKey: 'EstadioID',
    compositionRoot: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZIM_ESTADIOS',
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true
}
define view ZIM_I_ESTADIOS as select from zim_estadios as Estadios 
    association [0..*] to zim_partidas as _Partidas on _Partidas.id_estadio = Estadios.id_estadio
    association [0..1] to zim_clubes as _Clubes on _Clubes.id_estadio = Estadios.id_estadio
{
    //zim_estadios
    key id_estadio as EstadioID,
    nomeestadio as NomeEstadio,
    capacidade as Capacidade,
    
    _Partidas,
    _Clubes
}
