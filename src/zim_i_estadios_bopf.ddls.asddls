@AbapCatalog.sqlViewName: 'ZIMIESTADIOSBOPF'
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
define view ZIM_I_ESTADIOS_BOPF
  as select from ZIM_I_ESTADIOS_TOTAL as Estadio
  association [0..*] to ZIM_I_CLUBES_BOPF as _Clube on _Clube.id_estadio = $projection.id_estadio
  association [0..*] to ZIM_I_PARTIDASK_BOPF as _PartidasHdr on _PartidasHdr.id_estadio = $projection.id_estadio
  
{

      //Estadio
  key id_estadio,
      nome_estadio,
      cidade,
      uf,
      capacidade,
      geocode,

      created_at,
      created_by,
      changed_at,
      changed_by,

      //      @ObjectModel.association.type: [ #TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT ]
      _Clube,
      _PartidasHdr
}
