@AbapCatalog.sqlViewName: 'ZDIMEAIRLINE'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Airline'

@Analytics.dataCategory: #DIMENSION

define view ZIM_I_Dimension_Airline
  as select from scarr
{
      @ObjectModel.text.element: [ 'AirlineName' ]
  key carrid   as Airline,
  
      @Semantics.text: true
      carrname as AirlineName,
      
      @Semantics.currencyCode: true
      currcode as Currency
} 
