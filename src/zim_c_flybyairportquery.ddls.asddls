@AbapCatalog.sqlViewName: 'ZIMC_FLYBYAPQ'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Available Flights'
@Analytics.query: true
@OData.publish: true
@VDM.viewType: #CONSUMPTION
define view ZIM_C_FLYBYAIRPORTQ as select from ZXIM_I_FLYBYAIRPORT 
{

    @AnalyticsDetails.query.axis: #ROWS
    key Airline,
    @AnalyticsDetails.query.axis: #ROWS
    key FlightConnection,
    @AnalyticsDetails.query.axis: #ROWS
    key FlightDate,
    @Consumption.filter: {selectionType: #SINGLE, multipleSelections: false, mandatory: true}
    @AnalyticsDetails.query.axis: #ROWS
    @EndUserText.label: 'Departure Airport'
    key AirportFrom,
    @Consumption.filter: {selectionType: #SINGLE, multipleSelections: false, mandatory: false}
    @AnalyticsDetails.query.axis: #ROWS
    @EndUserText.label: 'Arrival Airport'
    key AirportTo,
    key Currency,
    key AircraftType,
    @AnalyticsDetails.query.axis: #COLUMNS
    FlightPrice,
    MaximumNumberOfSeats,
    NumberOfOccupiedSeats,
    @DefaultAggregation: #FORMULA
    @AnalyticsDetails.query.axis: #COLUMNS
    @EndUserText.label: 'Available Seats'
    MaximumNumberOfSeats - NumberOfOccupiedSeats as NumberOfAvailable
}
