@AbapCatalog.sqlViewName: 'ZIMCESTADCTOT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for ESTADIOS'

@Metadata.allowExtensions: true
@VDM.viewType : #CONSUMPTION
@OData.publish:true
@Search.searchable: true
@ObjectModel:{

    compositionRoot: true,
    transactionalProcessingDelegated : true,

    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
//  draftEnabled: true,

    semanticKey: ['id_estadio'],
    representativeKey: 'id_estadio',

    usageType: {
      serviceQuality: #D,
      sizeCategory: #S,
      dataClass: #TRANSACTIONAL
      }

}
define view ZIM_C_ESTADIOS_CTOT
  as select from ZIM_I_ESTADIOS_BOPF_TOTAL as Estadio
  association [0..*] to ZIM_C_CLUBES_CJOIN as _Clube on _Clube.id_estadio = $projection.id_estadio
{

  key id_estadio,
      @Search: {
          defaultSearchElement: true,
          ranking: #HIGH,
          fuzzinessThreshold: 0.8
      }
      nome_estadio,
      
      capacidade,

      @Search: {
          ranking: #MEDIUM,
          fuzzinessThreshold: 0.8
      }
      @Semantics.address.city: true
      cidade,
      
      @Search: {
          ranking: #MEDIUM,
          fuzzinessThreshold: 0.8
      }
      @Semantics.address.region: true
      uf,
      
      geocode,
      
      @Semantics.geoLocation.latitude: true
      latitude,
      
      @Semantics.geoLocation.longitude: true
      longitude,

      @ObjectModel.readOnly
      created_at,

      @ObjectModel.readOnly
      created_by,

      @ObjectModel.readOnly
      changed_at,

      @ObjectModel.readOnly
      changed_by,

      _Clube
}
