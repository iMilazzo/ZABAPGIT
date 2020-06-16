@AbapCatalog.sqlViewName: 'ZQL_VIEW_PARAM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View with Parameters'
define view zcds_view_param
  with parameters
    IN_CURR : abap.char(3)
  as select from sflight
{

      //SFLIGHT
  key carrid,
  key connid,
  key fldate,
      price,
      currency,
      planetype,
      seatsmax,
      seatsocc,
      paymentsum,
      seatsmax_b,
      seatsocc_b,
      seatsmax_f,
      seatsocc_f

}
where
  currency = $parameters.IN_CURR
