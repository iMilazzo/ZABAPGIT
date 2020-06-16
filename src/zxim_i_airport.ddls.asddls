@AbapCatalog.sqlViewName: 'ZXIM_IAIRPORT'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airport'
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@VDM.viewType: #BASIC
@ObjectModel.representativeKey: 'Airport'
define view ZXIM_I_AIRPORT as select from sairport {

    @ObjectModel.text.element: ['AirportName']
    //sairport
    key id as Airport,
    @Semantics.text: true
    name as Airportname,
    time_zone as AirportTimeZone
    
}
