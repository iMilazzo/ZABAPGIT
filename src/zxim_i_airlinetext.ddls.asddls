@AbapCatalog.sqlViewName: 'ZXIM_IAIRLINET'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airline Name'
@ObjectModel.dataCategory: #TEXT
@Analytics.dataExtraction.enabled: true
@VDM.viewType: #BASIC
@ObjectModel.representativeKey: 'Airline'
define view ZXIM_I_AIRLINETEXT as select from scarr {
    //scarr
    key carrid as Airline,
    @Semantics.text: true
    @EndUserText.label: 'Airline Name'
    carrname as AirlineName

}
