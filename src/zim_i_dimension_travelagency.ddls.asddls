@AbapCatalog.sqlViewName: 'ZIMIDIMETRVAGENC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel Agency'

@Analytics.dataCategory: #DIMENSION

define view ZIM_I_Dimension_TravelAgency
  as select from stravelag
  association [0..1] to I_Country as _Country on $projection.Country = _Country.Country
{
      @ObjectModel.text.element: [ 'TravelAgencyName' ]
  key agencynum as TravelAgency,

      @Semantics.text: true
      name      as TravelAgencyName,

      @ObjectModel.foreignKey.association: '_Country'
      @Semantics.address.country: true
      country   as Country,

      @Semantics.address.city: true
      city      as City,
      
      _Country
} 
