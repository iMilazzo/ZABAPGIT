@AbapCatalog.sqlViewName: 'ZIMIESTADIOSBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Estadios, private view, VDM interf view'

@Analytics.dataCategory: #DIMENSION
@Search.searchable: true
@VDM.viewType: #BASIC
@ObjectModel:{
    dataCategory: #TEXT,
    representativeKey: 'id_estadio',
    semanticKey: 'id_estadio',
    transactionalProcessingEnabled: true,
    compositionRoot: true,    
    writeActivePersistence: 'ZIM_ESTADIOS',
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true,
    usageType: {
        serviceQuality: #B,
        sizeCategory: #S,
        dataClass: #MASTER  
    }    
}
define view ZIM_I_ESTADIOS_BOPF as select from zim_estadios as Estadios 
{
    //zim_estadios
    key id_estadio,
//    @Semantics.language: true
    @Semantics.text: true
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.8
    nomeestadio,
    capacidade
}
