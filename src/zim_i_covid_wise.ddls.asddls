@AbapCatalog.sqlViewName: 'ZIMICOVIDWISE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CWise, private view, VDM interface view'
@Metadata.allowExtensions: true
@VDM.viewType: #BASIC
@ObjectModel: {
   modelCategory: #BUSINESS_OBJECT,
   compositionRoot: true,
   transactionalProcessingEnabled: true,
   createEnabled: true,
   deleteEnabled: true,
   updateEnabled: true,
   writeActivePersistence: 'ZIM_COVID'
}
@OData.publish:true
define view zim_i_covid_wise as select from zim_covid {
    //zim_i_covid
    @EndUserText.label: 'País'    
    key country as Country,
    @EndUserText.label: 'Casos Confirmados'    
    confirmed as Confirmed,
    @EndUserText.label: 'No. Recuperados'
    recovered as Recovered,
    @EndUserText.label: 'Fatalidades'
    deceased as Deceased,
    @EndUserText.label: 'População'
    population as Population

}
