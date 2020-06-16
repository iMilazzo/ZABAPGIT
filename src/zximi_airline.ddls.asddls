@AbapCatalog.sqlViewName: 'ZXIMIAIRLINE'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airline'
@VDM.viewType: #BASIC
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@ObjectModel.representativeKey: 'Airline'
define view ZXIMI_AIRLINE
  as select from scarr

    association [0..1] to ZXIM_I_AIRLINETEXT as _Text
             on $projection.Airline = _Text.Airline

{

      //scarr
  key carrid   as Airline,
      @Semantics.amount.currencyCode: true
      currcode as AirlineLocalCurrency,
      @Semantics.url: true
      url      as AirlineURL,
      
      _Text

}
    
