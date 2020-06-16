@AbapCatalog.sqlViewName: 'ZXMCBOOKS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Books'
@VDM.viewType: #CONSUMPTION
@OData.publish: true
define view ZXMC_BOOKS
  as select from zximibooks as Books
{

      //Books
  key book_id,
      @Semantics.text: true
      title        as Title,
      @Semantics.text: true
      author       as Author,
      publisher_id as Publisher,
      @Semantics.currencyCode: true
      cuky_field   as Currency,
      price        as Price,
      unit_field   as Quantity,
      @Semantics.quantity.unitOfMeasure: 'Quantity'
      stock        as Stock
      
}
