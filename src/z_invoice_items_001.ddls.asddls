@AbapCatalog.sqlViewName: 'Z_ITEMS_001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Create a Simple ABAP CDS View in ADT'
@VDM.viewType: #BASIC
@Analytics.dataCategory: #DIMENSION
define view Z_INVOICE_ITEMS_001 as select from sepm_sddl_so_invoice_item {
//sepm_sddl_so_invoice_item

  key header.buyer.company_name, 
  key sepm_sddl_so_invoice_item.sales_order_invoice_key,
  sepm_sddl_so_invoice_item.currency_code,
  sepm_sddl_so_invoice_item.gross_amount,

@EndUserText.quickInfo: 'Paid'  
    cast(
        case header.payment_status
            when 'P' then 'X'
            else ' '
        end as zso_invoice_payment_status preserving type )
    as payment_status,

//* Associations *//
  header    
}
where currency_code = 'USD'
