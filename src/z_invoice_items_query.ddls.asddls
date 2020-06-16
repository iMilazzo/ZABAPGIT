@AbapCatalog.sqlViewName: 'ZINVITEMSQUERY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Query invoice items'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
define view Z_INVOICE_ITEMS_QUERY as select from Z_INVOICE_ITEMS_001 {
    //Z_INVOICE_ITEMS_001
    key company_name,
    key sales_order_invoice_key,
    currency_code,
    gross_amount,
    payment_status,
    /* Associations */
    //Z_INVOICE_ITEMS_001
    header
}
