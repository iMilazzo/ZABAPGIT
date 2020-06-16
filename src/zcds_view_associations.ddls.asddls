@AbapCatalog.sqlViewName: 'ZCDS_VIEW_ASSOC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View with Associations'

@VDM:{viewType: #BASIC}
@Analytics:{dataExtraction:{enabled: true}, dataCategory: #DIMENSION}
define view zcds_view_associations
  as select from sflight as s
  association [1] to spfli as _flights on s.carrid = _flights.carrid
{

      //sflight
  key carrid,
  key connid,
  key fldate,
      price,
      currency,
      planetype,
      seatsmax,
      seatsocc,

      _flights // Make association public
}
