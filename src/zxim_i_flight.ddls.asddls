@AbapCatalog.sqlViewName: 'ZXIM_IFLIGHT'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flights'
@Analytics.dataCategory: #CUBE
@Analytics.dataExtraction.enabled: true
@VDM.viewType: #BASIC
define view ZXIM_I_FLIGHT as select from sflight

association [0..1] to ZXIMI_AIRLINE as _Airline
         on $projection.Airline = _Airline.Airline
         
association [0..1] to ZXIM_I_FLIGHTCONNECTION as _FlightConnection
         on $projection.Airline = _FlightConnection.Airline
        and $projection.FlightConnection = _FlightConnection.FlightConnection
        
association [0..1] to ZXIM_I_AIRCRAFTTYPE as _AircraftType
         on $projection.AircraftType = _AircraftType.AircraftType        

{

    @ObjectModel.foreignKey.association: '_Airline'
    key carrid as Airline,
    @ObjectModel.foreignKey.association: '_FlightConnection'
    key connid as FlightConnection,
    key fldate as FlightDate,
    @Semantics.amount.currencyCode: 'Currency'
    @DefaultAggregation: #MIN
    price      as FlightPrice,
    @Semantics.currencyCode: true
    currency   as Currency,
    @ObjectModel.foreignKey.association: '_AircraftType'
    planetype  as AircraftType,

    @DefaultAggregation: #SUM
    seatsmax   as MaximumNumberOfSeats,
    @DefaultAggregation: #SUM
    seatsocc   as NumberOfOccupiedSeats,
    @DefaultAggregation: #SUM
    @Semantics.amount.currencyCode: 'Currency'
    paymentsum as CurrentBookingsTotalAmount,
    
    /* Association*/
    _Airline,
    _FlightConnection,
    _AircraftType
}
