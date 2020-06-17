@AbapCatalog.sqlViewName: 'ZIMIDIMECUSTOMER'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Flight Customer'

@Analytics.dataCategory: #DIMENSION

define view ZIM_I_Dimension_Customer
  as select from scustom
  association [0..1] to I_Country as _Country on $projection.Country = _Country.Country
{
      @ObjectModel.text.element: [ 'CustomerName' ]
  key id      as Customer,

      @Semantics.text: true
      name    as CustomerName,

      @ObjectModel.foreignKey.association: '_Country'
      @Semantics.address.country: true
      country as Country,

      @Semantics.address.city: true
      city    as City,
      
      _Country
} 
