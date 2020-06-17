@AbapCatalog.sqlViewName: 'ZIMCPARTIDASBOPF'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Part., private view, VDM interface view'

@VDM.viewType: #CONSUMPTION

@ObjectModel:{
    representativeKey: ['id_rodada', 'id_partida'],
    semanticKey: ['id_rodada', 'id_partida'],
    transactionalProcessingDelegated: true,    
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true
}
@OData.publish: true
define view ZIM_C_PARTIDAS_BOPF as select from ZIM_I_PARTIDAS_BOPF as Partida
    association [1..1] to ZIM_I_ESTADIOS_BOPF as _estadio on _estadio.id_estadio = $projection.id_estadio
    association [1..1] to ZIM_I_CLUBES_BOPF as _clube_A on _clube_A.id_clube = $projection.id_time_a
    association [1..1] to ZIM_I_CLUBES_BOPF as _clube_B on _clube_B.id_clube = $projection.id_time_b
    
{

    @EndUserText.label: 'Rodada'
    @UI.lineItem.position: 10
    @UI.identification.position: 10
key Partida.id_rodada,

    @EndUserText.label: 'Partida'
    @UI.lineItem.position: 20
    @UI.identification.position: 20
key Partida.id_partida,

    @EndUserText.label: 'Estádio'
    @UI.lineItem.position: 40
    @UI.identification.position: 40
    @ObjectModel.text.association: '_estadio'
    @ObjectModel.foreignKey.association: '_estadio'
    @ObjectModel.text.element: ['NomeEstadio']
    @Consumption.valueHelp: '_estadio'
    Partida.id_estadio,

    @EndUserText.label: 'Time A'
    @UI.lineItem.position: 80
    @UI.identification.position: 80
    @ObjectModel.text.association: '_clube_A'
    @ObjectModel.foreignKey.association: '_clube_A'
    @ObjectModel.text.element: ['NomeTimeA']
    @Consumption.valueHelp: '_clube_A'
    Partida.id_time_a,

    @EndUserText.label: 'Time B'
    @UI.lineItem.position: 90
    @UI.identification.position: 90
    @ObjectModel.text.association: '_clube_B'
    @ObjectModel.foreignKey.association: '_clube_B'
    @ObjectModel.text.element: ['NomeTimeB']
    @Consumption.valueHelp: '_clube_B'
    Partida.id_time_b,

    @EndUserText.label: 'Placar A'
    @UI.lineItem.position: 100
    @UI.identification.position: 100
    Partida.Placar_Time_A as Placar_Time_A,

    @EndUserText.label: 'Placar B'
    @UI.lineItem.position: 110
    @UI.identification.position: 110
    Partida.Placar_Time_B as Placar_Time_B,
    
    @EndUserText.label: 'Data'
    @UI.lineItem.position: 30
    @UI.identification.position: 30
    Partida.Data as Data,
 
    @EndUserText.label: 'Público'
    @UI.lineItem.position: 50
    @UI.identification.position: 50
    Partida.Publico as Publico,

    @EndUserText.label: 'Renda'
    @UI.lineItem.position: 60
    @UI.identification.position: 60
    @Semantics.amount.currencyCode : 'Moeda'
    Partida.Renda as Renda,

    @EndUserText.label: 'Moeda'
    @ObjectModel.virtualElement: true
    @Semantics.text: true
    @UI.lineItem.position: 70
    @UI.identification.position: 70
    Partida.Moeda as Moeda,

    @ObjectModel.readOnly
    @Semantics.text: true
    _estadio.NomeEstadio,
    
    @ObjectModel.readOnly
    @Semantics.text: true
    _clube_A.NomeTime as NomeTimeA,

    @ObjectModel.readOnly
    @Semantics.text: true
    _clube_B.NomeTime as NomeTimeB,
    
    _estadio,
    _clube_A,
    _clube_B

}
