@AbapCatalog.sqlViewName: 'ZXIMIBOOKS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Books, private view, VDM interface view'
@VDM.viewType: #BASIC
define view ZXIMI_BOOKS as select from zbooks as Books
    association to zpublishers as _publisher on _publisher.publisher_id = Books.publisher_id {

    //zbooks
    key book_id,
    title,
    author,
    publisher_id,
    cuky_field,
    price,
    unit_field,
    stock,
    createdat,
    createdby,
    
    _publisher

}
