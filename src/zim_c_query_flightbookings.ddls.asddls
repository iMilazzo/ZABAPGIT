@AbapCatalog.sqlViewName: 'ZIMQUERYFLIGHTBK'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Bookings'

@Analytics.query: true
@VDM.viewType: #CONSUMPTION

define view ZIM_C_Query_FlightBookings
  as select from ZIM_I_Cube_FlightBookings
{
    /** DIMENSIONS **/
    
    @AnalyticsDetails.query.display: #KEY_TEXT
    @AnalyticsDetails.query.axis: #FREE
    Airline, 
    @AnalyticsDetails.query.display: #KEY_TEXT
    @AnalyticsDetails.query.axis: #FREE
    FlightConnection, 
    @AnalyticsDetails.query.display: #KEY
    @AnalyticsDetails.query.axis: #FREE
    FlightDate, 
    @AnalyticsDetails.query.display: #KEY_TEXT
    @AnalyticsDetails.query.axis: #FREE
    Customer, 
    @AnalyticsDetails.query.display: #KEY_TEXT
    @AnalyticsDetails.query.axis: #FREE
    TravelAgency, 
    @AnalyticsDetails.query.display: #KEY
    @AnalyticsDetails.query.axis: #FREE
    CalendarYear,
    @AnalyticsDetails.query.display: #TEXT
    @AnalyticsDetails.query.axis: #FREE
    CalendarMonth,
    @AnalyticsDetails.query.display: #TEXT
    @AnalyticsDetails.query.axis: #FREE
    CustomerCountry,
    @AnalyticsDetails.query.display: #KEY
    @AnalyticsDetails.query.axis: #FREE
    CustomerCity,
    @AnalyticsDetails.query.display: #TEXT
    @AnalyticsDetails.query.axis: #FREE
    TravelAgencyCountry,
    @AnalyticsDetails.query.display: #KEY
    @AnalyticsDetails.query.axis: #FREE
    TravelAgencyCity,
    @AnalyticsDetails.query.display: #KEY
    @AnalyticsDetails.query.axis: #FREE
    Currency,
    @AnalyticsDetails.query.display: #KEY
    @AnalyticsDetails.query.axis: #FREE
    WeightUOM,
    
    /** MEASURES **/
    
    TotalOfBookings, 
    WeightOfLuggage,
    BookingPrice,
    
    @EndUserText.label: 'Average Weight Per Flight'
    @AnalyticsDetails.exceptionAggregationSteps.exceptionAggregationBehavior: #AVG
    @AnalyticsDetails.exceptionAggregationSteps.exceptionAggregationElements: [ 'Airline', 'FlightConnection', 'FlightDate' ]
    @AnalyticsDetails.query.formula: '$projection.WeightOfLuggage'
    @AnalyticsDetails.query.decimals: 0
    0 as AverageWeightPerFlight
} 
