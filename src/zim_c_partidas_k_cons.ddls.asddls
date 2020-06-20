@AbapCatalog.sqlViewName: 'ZIMIPARTIDKCONS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Part., private view, VDM interface view'

@VDM.viewType: #CONSUMPTION
@OData.publish:true
//@Search.searchable: true
@Metadata.allowExtensions: true
    
@ObjectModel:{
    transactionalProcessingDelegated: true,
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true,
//    draftEnabled: true,
    semanticKey: ['id_partida'],
    usageType: {
        serviceQuality: #D,
        sizeCategory: #L,
        dataClass: #TRANSACTIONAL
        }
    }

@UI.presentationVariant: [{
    sortOrder: [{ 
        by: 'id_partida',
        direction: #DESC
        }],
    groupBy: ['id_partida'],
    requestAtLeast: ['id_partida', 
                     'id_estadio', 
                     'data',
                     'id_rodada', 
                     'publico', 
                     'renda',
                     'moeda' ]
    }]

@UI.headerInfo: {
    typeName: 'Partida',
    typeNamePlural: 'Partidas',
    title.value: 'id_partida',
    description.value: 'id_partida'
    }
    
define view ZIM_C_PARTIDAS_K_CONS as select from ZIM_I_PARTIDAS_K_BOPF as PartidaHdr
    association [0..*] to ZIM_C_PARTIDAS_P_CONS as _PartidaItm on _PartidaItm.id_partida = $projection.id_partida
    association [1..1] to ZIM_I_ESTADIOS_VH as _Estadio on _Estadio.id_estadio = $projection.id_estadio
{


    @UI.facet: [
      {
        id:       'id_partida',
        purpose:  #STANDARD,
        type:     #IDENTIFICATION_REFERENCE,
        label:    'Partida',
        position: 10 }
    ]
//@UI.facet: [{
//        purpose: #HEADER,
//        position: 10,
//        importance: #HIGH ,
//        type: #FIELDGROUP_REFERENCE,
//        targetQualifier: 'id_partida' 
//    },{  
//        purpose: #HEADER,
//        position: 20,
//        importance: #HIGH,
//        type: #DATAPOINT_REFERENCE,
//        targetQualifier: 'data'
//    },{
//        purpose: #STANDARD,
//        id: 'DetailInformation',
//        importance: #HIGH,
//        type: #COLLECTION,
//        position: 10
//    },{
//        purpose: #STANDARD,
//        label:'i18n>generalInfo',
//        importance: #HIGH,
//        type: #IDENTIFICATION_REFERENCE,
//        parentId: 'DetailInformation',
//        position: 10,
//        targetQualifier: 'generalInfo'
//    },{
//        purpose: #STANDARD,
//        label:'i18n>contactInfo',
//        importance: #HIGH,
//        type: #FIELDGROUP_REFERENCE,
//        parentId: 'DetailInformation',
//        position: 20,
//        targetQualifier: 'contactInfo'
//    },{
//        purpose: #STANDARD,
//        label:'i18n>adminInfo',
//        importance: #HIGH,
//        type: #FIELDGROUP_REFERENCE,
//        parentId: 'DetailInformation',
//        position: 30,
//        targetQualifier: 'adminInfo'
//    }]


//    @UI.hidden: true

    @UI: {
        lineItem: [ { position: 10, label: 'Partida', importance: #HIGH } ],
        identification:[ { position: 10, label: 'Partida' } ]
    }  
    key id_partida,
 
 
//    @Search: {
//            defaultSearchElement: true,
//            ranking: #HIGH,
//            fuzzinessThreshold: 0.8
//        }  
//    @UI.textArrangement: #TEXT_FIRST
    @UI: {
        lineItem: [ { position: 20, label: 'Estádio', importance: #MEDIUM } ],
        identification:[ { position: 20, label: 'Estádio' } ]
    } 
    @ObjectModel.foreignKey.association: '_Estadio'
    @Consumption.valueHelp: '_Estadio'
    id_estadio, 

//    @UI.hidden: true
//    @Consumption.filter.hidden: true
//    @ObjectModel.readOnly
//    @Semantics.text: true
//    _Estadio.nomeestadio,
    
//    @UI.hidden: true
    @UI: {
        lineItem: [ { position: 30, label: 'Data', importance: #MEDIUM } ],
        identification:[ { position: 30, label: 'Data' } ]
    }
    @Semantics.businessDate.at: true
    data,

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
        lineItem: [ { position: 40, label: 'Rodada', importance: #MEDIUM } ],
        identification:[ { position: 40, label: 'Rodada' } ]
    } 
    id_rodada,  
 
//    @Search: {
//        ranking: #HIGH,
//        fuzzinessThreshold: 0.6
//    }
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
        lineItem: [ { position: 50, label: 'Público', importance: #MEDIUM } ],
        identification:[ { position: 50, label: 'Público' } ]
    } 
    publico,

//    @UI.fieldGroup:[  {
//        qualifier: 'contactInfo',
//        position: 30,
//        importance: #HIGH
//    }]
//    @UI.dataPoint.targetValueElement: 'renda'
//    @UI.lineItem: [{position: 30}]
    @UI: {
        lineItem: [ { position: 60, label: 'Renda', importance: #MEDIUM } ],
        identification:[ { position: 60, label: 'Renda' } ]
    } 
    @Semantics.amount.currencyCode : 'moeda'
    renda,


//    @UI.fieldGroup:[{
//        qualifier: 'adminInfo',
//        groupLabel: 'i18n>adminInfo',
//        position: 10,
//        importance: #HIGH
//    }]
    @UI: {
        lineItem: [ { position: 70, label: 'Moeda', importance: #MEDIUM } ],
        identification:[ { position: 70, label: 'Moeda' } ]
    }
    @Consumption.defaultValue: 'BRL' 
    @Semantics.currencyCode : 'true'
    moeda,

   
    /* Associations */  
    @ObjectModel.association.type: [#TO_COMPOSITION_CHILD]
    _PartidaItm,
    _Estadio
}
