@AbapCatalog.sqlViewName: 'ZXMCAUTHORS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Authors'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
define view ZXMC_AUTHORS as select from zximi_authors as Authors {
        
    //Authors
    key book_id,
    key author_id,
    name as Name

}
