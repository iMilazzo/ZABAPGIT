@AbapCatalog.sqlViewName: 'ZXIMCAIRLINE'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airplane'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
define view ZXIMC_AIRLINEQUERY as select from ZXIMI_AIRLINE {
    //zximi_airline
    key Airline,
    AirlineLocalCurrency,
    AirlineURL
}
