@AbapCatalog.sqlViewName: 'ZXIM_IFLIGHTCONN'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Flight Connections'
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@VDM.viewType: #BASIC
@ObjectModel.representativeKey: 'FlightConnection'
define view ZXIM_I_FLIGHTCONNECTION as select from spfli 

association [0..1] to ZXIMI_AIRLINE as _Airline
         on $projection.Airline = _Airline.Airline

association [0..1] to ZXIM_I_AIRPORT as _AirportFrom
         on $projection.AirportFrom = _AirportFrom.Airport

association [0..1] to ZXIM_I_AIRPORT as _AirportTo
         on $projection.AirportTo = _AirportTo.Airport
{

    @ObjectModel.foreignKey.association: '_Airline'
    key carrid as Airline,
    key connid as FlightConnection,
    countryfr  as CountryFrom,
    cityfrom   as CityFrom,
    @ObjectModel.foreignKey.association: '_AirportFrom'
    airpfrom   as AirportFrom,
    countryto  as CountryTo,
    cityto     as CityTo,
    @ObjectModel.foreignKey.association: '_AirportTo'
    airpto     as AirportTo,
    fltime     as FlightDurationInMinutes,
    deptime    as DepartureTime,
    arrtime    as ArrivalTime,
    @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
    @DefaultAggregation: #SUM
    distance   as Distance,
    @Semantics.unitOfMeasure: true
    distid     as DistanceUnit,
    period     as ArrivalDateShiftInDays,
    
    /* Associations */
    _Airline,
    _AirportFrom,
    _AirportTo
    
}
