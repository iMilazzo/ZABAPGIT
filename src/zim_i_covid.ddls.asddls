@AbapCatalog.sqlViewName: 'ZIMICOVID'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'COVID, private view, VDM interface view'

define view zim_i_covid as select from zim_covid {

    key country,
    confirmed,
    recovered,
    deceased,
    population
}
