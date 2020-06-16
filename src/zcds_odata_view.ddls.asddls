@AbapCatalog.sqlViewName: 'ZCDS_SALESORDER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS View with OData >> FIORI app'
@OData.publish: true
define view zcds_odata_view as select from vbak as shead
association [1] to vbap as _sitem
    on shead.vbeln = _sitem.vbeln {
    
    //shead
    key mandt,
    key vbeln,
    erdat,
    vbtyp,
    auart,
    augru,
    vkorg,
    vtweg,
    spart,

    _sitem // Make association public
}
