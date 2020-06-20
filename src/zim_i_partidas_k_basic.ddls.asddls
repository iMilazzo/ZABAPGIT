@AbapCatalog.sqlViewName: 'ZIMIPARTIDKBAS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Part., private view, VDM interface view'

@VDM.viewType: #BASIC
@ObjectModel:{
    usageType:{
        sizeCategory: #L,
        serviceQuality: #X,
        dataClass: #TRANSACTIONAL  
    }
}
define view ZIM_I_PARTIDAS_K_BASIC as select from zim_partidas_k
{

    key id_partida,
    id_estadio,
    data,
    id_rodada,
    publico,
    renda,
    moeda
}
