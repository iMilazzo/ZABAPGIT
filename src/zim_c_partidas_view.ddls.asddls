@AbapCatalog.sqlViewName: 'ZIMCPARTIDASVIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Part., public view, VDM consumption view'
@VDM.viewType: #CONSUMPTION
@ObjectModel.semanticKey: 'id_partida'
@ObjectModel.transactionalProcessingDelegated: true

@ObjectModel.createEnabled: true
@ObjectModel.deleteEnabled: true
@ObjectModel.updateEnabled: true

@UI.headerInfo: { typeName: 'Partida', typeNamePlural: 'Partidas' }

@OData.publish: true
define view ZIM_C_PARTIDAS_VIEW as select from ZIM_I_PARTIDAS_VIEW as Partida {


    @UI: {
      lineItem: [ { position: 10, importance: #HIGH, label: 'Rodada ID' } ],
      identification:[ { position: 10, label: 'Rodada ID' } ]
    }
    key Partida.id_rodada,

    @UI: {
      lineItem: [ { position: 20, importance: #HIGH, label: 'Partida ID' } ],
      identification:[ { position: 20, label: 'Partida ID' } ]
    }
    key Partida.id_partida,

    @UI: {
      lineItem: [ { position: 30, importance: #HIGH, label: 'Estádio ID' } ],
      identification:[ { position: 30, label: 'Estádio ID' } ]
    }
    @Consumption.valueHelp: '_estadio'
    @ObjectModel.text.element: ['NomeEstadio']
    key Partida.id_estadio,
    
    @UI: {
      lineItem: [ { position: 40, importance: #HIGH, label: 'Time A' } ],
      identification:[ { position: 40, label: 'Time A' } ]
    }
    @Consumption.valueHelp: '_clube_A'
    @ObjectModel.text.element: ['NomeTimeA']
    key Partida.id_time_a,

    @UI: {
      lineItem: [ { position: 50, importance: #HIGH, label: 'Time B' } ],
      identification:[ { position: 50, label: 'Time B' } ]
    }
    @ObjectModel.text.element: ['NomeTimeB']
    @Consumption.valueHelp: '_clube_B'
    key Partida.id_time_b,

    @UI: {
      lineItem: [ { position: 60, importance: #HIGH, label: 'Data' } ],
      identification:[ { position: 60, label: 'Data' } ]
    }
    Partida.Data,

    @UI: {
      lineItem: [ { position: 70, importance: #HIGH, label: 'Publico' } ],
      identification:[ { position: 70, label: 'Publico' } ]
    }
    Partida.Publico,

    @UI: {
      lineItem: [ { position: 80, importance: #HIGH, label: 'Renda' } ],
      identification:[ { position: 80, label: 'Renda' } ]
    }
    Partida.Renda,

    @UI: {
      lineItem: [ { position: 90, importance: #HIGH, label: 'Moeda' } ],
      identification:[ { position: 90, label: 'Moeda' } ]
    }
    Partida.Moeda,

    @UI: {
      lineItem: [ { position: 100, importance: #HIGH, label: 'Placa Time A' } ],
      identification:[ { position: 100, label: 'Placa Time A' } ]
    }
    Partida.Placar_Time_A,

    @UI: {
      lineItem: [ { position: 110, importance: #HIGH, label: 'Placa Time B' } ],
      identification:[ { position: 110, label: 'Placa Time B' } ]
    }
    Partida.Placar_Time_B,

    @ObjectModel.readOnly
    @Semantics.text: true
    Partida._estadio.nomeestadio as NomeEstadio,
    
    @ObjectModel.readOnly
    @Semantics.text: true
    Partida._clube_A.NomeTime as NomeTimeA,
    
    @ObjectModel.readOnly
    @Semantics.text: true
    Partida._clube_B.NomeTime as NomeTimeB,

    Partida._estadio,

    Partida._clube_A,

    Partida._clube_B


}
