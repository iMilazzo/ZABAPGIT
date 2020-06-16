@AbapCatalog.sqlViewName: 'ZXIMIAUTHORS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Authors'
@VDM.viewType: #BASIC
define view zximi_authors as select from zbooks as Books 
     join zbooksauthors as Authors on Authors.book_id = Books.book_id
     association to zauthors as Author on Author.author_id = Authors.author_id{
    
    key Books.book_id,
    key Authors.author_id,
    Author.name

}
