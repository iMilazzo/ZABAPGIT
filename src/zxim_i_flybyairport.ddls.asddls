@AbapCatalog.sqlViewName: 'ZXIM_IFLYBYAP'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight (by Airport)'
@Analytics.dataCategory: #CUBE
@VDM.viewType: #COMPOSITE

define view ZXIM_I_FLYBYAIRPORT
  as select from ZXIM_I_FLIGHT
{

@ObjectModel.foreignKey.association: '_Airline'
  key Airline,
@ObjectModel.foreignKey.association: '_FlightConnection'
  key FlightConnection,
  key FlightDate,
  
@EndUserText.label: 'Airport From'
@ObjectModel.foreignKey.association: '_AirportFrom'
  key _FlightConnection.AirportFrom,
  
@EndUserText.label: 'Airport To'
@ObjectModel.foreignKey.association: '_AirportTo'
  key _FlightConnection.AirportTo,

@Semantics.currencyCode: true    
  key Currency,
@ObjectModel.foreignKey.association: '_AircraftType'  
  key AircraftType,

@Semantics.amount.currencyCode: 'Currency'
@DefaultAggregation: #MIN  
      FlightPrice,

@DefaultAggregation: #SUM  
      MaximumNumberOfSeats,
@DefaultAggregation: #SUM  
      NumberOfOccupiedSeats,

@Semantics.amount.currencyCode: 'Currency'
@DefaultAggregation: #SUM
      CurrentBookingsTotalAmount,
      
      /* Associations */
      //ZXIM_I_FLIGHT
      _AircraftType,
      _Airline,
      _FlightConnection,
      _FlightConnection._AirportFrom,
      _FlightConnection._AirportTo

}
