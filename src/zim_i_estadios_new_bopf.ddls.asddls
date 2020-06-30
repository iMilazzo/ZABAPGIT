@AbapCatalog.sqlViewName: 'ZIMIESTADNEWBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF for ESTADIOS'

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
define view ZIM_I_ESTADIOS_NEW_BOPF
  as select from ZIM_I_ESTADIOS_NEW as Estadio
  association [0..*] to ZIM_I_CLUBES_JOIN as _Clubes on _Clubes.id_estadio = $projection.id_estadio
{

      //Estadio
  key id_estadio,
      nome_estadio,
      cidade,
      uf,
      capacidade,
      geocode,
      latitude,
      longitude,
      created_at,
      created_by,
      changed_at,
      changed_by,
      
      _Clubes
}
