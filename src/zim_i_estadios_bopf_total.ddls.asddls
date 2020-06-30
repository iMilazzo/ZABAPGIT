@AbapCatalog.sqlViewName: 'ZIMIESTADBOPFTOT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF for ESTADIOS'

@Search.searchable: true
@VDM.viewType: #TRANSACTIONAL
@ObjectModel:{

    modelCategory: #BUSINESS_OBJECT,
    compositionRoot: true,
    transactionalProcessingEnabled: true,

    writeActivePersistence: 'ZIM_ESTADIOS',

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,

    representativeKey: ['id_estadio'],
    semanticKey: ['id_estadio'],

    dataCategory: #HIERARCHY

}
define view ZIM_I_ESTADIOS_BOPF_TOTAL
  as select from ZIM_I_ESTADIOS_BASIC_TOT as Estadio
  association [0..*] to ZIM_I_CLUBES_JOIN as _Clube on _Clube.id_estadio = Estadio.id_estadio
{

      //Estadio
  key id_estadio,

      @ObjectModel.mandatory: true
      @Semantics.text:true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8  
      nome_estadio,
      
      @Search.ranking: #MEDIUM
      @Search.fuzzinessThreshold: 0.8  
      @Semantics.text:true
      @Semantics.address.city: true
      cidade,
      
      @Search.ranking: #MEDIUM
      @Search.fuzzinessThreshold: 0.8  
      @Semantics.text:true
      @Semantics.address.region: true
      uf,
      
      capacidade,
      geocode,

      @Semantics.geoLocation.latitude: true
      latitude,
      
      @Semantics.geoLocation.longitude: true
      longitude,
      
      @Semantics.systemDateTime.createdAt: true
      created_at,
      
      @Semantics.user.createdBy: true
      created_by,
      
      @Semantics.systemDateTime.lastChangedAt: true
      changed_at,
      
      @Semantics.user.lastChangedBy: true
      changed_by,


      //      @ObjectModel.association.type: [ #TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT ]
      _Clube
}
