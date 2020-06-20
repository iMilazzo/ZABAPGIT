@AbapCatalog.sqlViewName: 'ZIMIPARTIDPCONS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Part., private view, VDM interface view'


@VDM.viewType: #CONSUMPTION
//@Search.searchable: true
@Metadata.allowExtensions: true

    
@ObjectModel:{
    transactionalProcessingDelegated: true,
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
//    draftEnabled: true,
    representativeKey: [ 'id_item'],
    semanticKey: ['id_partida', 'id_item'],
    usageType: {
        serviceQuality: #D,
        sizeCategory: #L,
        dataClass: #TRANSACTIONAL
        }
    }
  
define view ZIM_C_PARTIDAS_P_CONS as select from ZIM_I_PARTIDAS_P_BOPF as PartidaItm
    association [1..1] to ZIM_I_CLUBES_BASIC as _Clube on _Clube.id_clube = PartidaItm.id_clube
    association [1..1] to ZIM_C_PARTIDAS_K_CONS as _PartidaHdr on _PartidaHdr.id_partida = PartidaItm.id_partida
{

    //@UI.hidden: true
    @ObjectModel.readOnly
    key id_partida,
    
//    @Search: {
//            defaultSearchElement: true,
//            ranking: #HIGH,
//            fuzzinessThreshold: 0.8
//        }  

    @UI: {
        lineItem: [ { position: 10, label: 'Primeiro Time', importance: #HIGH } ],
        identification:[ { position: 10, label: 'Primeiro Time' } ]
    }  
    key id_item,


    @UI: {
        lineItem: [ { position: 20, label: 'Nome do Time', importance: #HIGH } ],
        identification:[ { position: 20, label: 'Nome do Time' } ],
        textArrangement: #TEXT_FIRST
    }  
    @Consumption.valueHelp: '_Clube'
    id_clube,
    
//    @Search: {
//        ranking: #HIGH,
//        fuzzinessThreshold: 0.6
//    }
//    @UI.fieldGroup:[{
//        qualifier: 'generalInfo',
//        position: 10,
//        importance: #HIGH
//    },{
//        qualifier: 'contactInfo',
//        groupLabel: 'i18n>contactInfo',
//        position: 10,
//        importance: #HIGH
//    }]  
    @UI: {
        lineItem: [ { position: 30, label: 'Placar', importance: #HIGH } ],
        identification:[ { position: 30, label: 'Placar' } ]
    }  
    placar,
 
//    @Search: {
//        ranking: #HIGH,
//        fuzzinessThreshold: 0.6
//    }
// 
//    @UI.fieldGroup:[{
//        qualifier: 'nameInfo',
//        position: 20,
//        importance: #HIGH
//    },{
//        qualifier: 'contactInfo',
//        position: 20,
//        importance: #HIGH
//    }]
    @UI: {
        lineItem: [ { position: 40, label: 'Pontos', importance: #HIGH } ],
        identification:[ { position: 40, label: 'Pontos' } ]
    }  
    pontos,

   
    /* Associations */  
    @ObjectModel.association.type:  [#TO_COMPOSITION_ROOT,#TO_COMPOSITION_PARENT]
    _PartidaHdr,
    @Consumption.filter.hidden: true
    _Clube
        
}
