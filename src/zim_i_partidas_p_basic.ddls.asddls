@AbapCatalog.sqlViewName: 'ZIMIPARTIDPBAS'
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


define view ZIM_I_PARTIDAS_P_BASIC
  as select from zim_partidas_p as PartidaItm
{

      //PartidaItm
  key id_partida,
  key id_item,
      id_clube,
      placar,
      pontos
}
