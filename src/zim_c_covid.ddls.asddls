@AbapCatalog.sqlViewName: 'ZIMACCOVID'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CWise, private view, VDM interface view'
@Metadata.allowExtensions: true
@VDM.viewType: #BASIC
@Analytics.dataCategory: #AGGREGATIONLEVEL
@Analytics.dataExtraction.enabled: true
@OData.publish:true
define view zim_c_covid as select from zim_i_covid_wise {
    //zim_i_covid
    @EndUserText.label: 'País'    
    key Country as Country,
    @DefaultAggregation: #MAX
    @EndUserText.label: 'Casos Confirmados'    
    Confirmed as Confirmed,
    @DefaultAggregation: #MAX
    @EndUserText.label: 'No. Recuperados'
    Recovered as Recovered,
    @DefaultAggregation: #MAX
    @EndUserText.label: 'Fatalidades'
    Deceased as Deceased,
    @DefaultAggregation: #MAX
    @EndUserText.label: 'População'
    Population as Population,
    
    
    @DefaultAggregation: #FORMULA
    @EndUserText.label: 'Confirmados/População'
    div( Confirmed, Population ) as ConfirmedPerPopulation,

    @DefaultAggregation: #FORMULA
    @EndUserText.label: 'Recovered/População'
    div( Recovered, Population ) as RecoveredPerPopulation,

    @DefaultAggregation: #FORMULA
    @EndUserText.label: 'Fatalidades/População'
    div( Deceased, Population ) as DeceasedPerPopulation
        
}
