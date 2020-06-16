@AbapCatalog.sqlViewName: 'ZXIM_IAIRCRAFTT'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airport'
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@VDM.viewType: #BASIC
@ObjectModel.representativeKey: 'AircraftType'
define view ZXIM_I_AIRCRAFTTYPE as select from saplane {
    //saplane
    key planetype as AircraftType,
    @Semantics.text: true
    producer as AircraftManufacturer
}
