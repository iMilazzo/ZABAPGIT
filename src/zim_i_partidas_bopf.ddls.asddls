@AbapCatalog.sqlViewName: 'ZIMIPARTIDASBOPF'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Part., private view, VDM interface view'

@VDM.viewType: #BASIC

@ObjectModel:{
    representativeKey: ['id_rodada', 'id_partida'],
    semanticKey: ['id_rodada', 'id_partida'],
    modelCategory: #BUSINESS_OBJECT,
    compositionRoot: true,
    transactionalProcessingEnabled: true,
    writeActivePersistence: 'ZIM_PARTIDAS',
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true
}
define view ZIM_I_PARTIDAS_BOPF as select from zim_partidas as Partida
    association [1..1] to ZIM_I_ESTADIOS_BOPF as _estadio on _estadio.id_estadio = $projection.id_estadio
    association [1..1] to ZIM_I_CLUBES_BOPF as _clube_A on _clube_A.id_clube = $projection.id_time_a
    association [1..1] to ZIM_I_CLUBES_BOPF as _clube_B on _clube_B.id_clube = $projection.id_time_b
    
{

    key Partida.id_rodada,
    key Partida.id_partida,
    @ObjectModel.text.association: '_estadio'
    @ObjectModel.foreignKey.association: '_estadio'
    key Partida.id_estadio,
    @ObjectModel.text.association: '_clube_A'
    @ObjectModel.foreignKey.association: '_clube_A'
    key Partida.id_time_a,
    @ObjectModel.text.association: '_clube_B'
    @ObjectModel.foreignKey.association: '_clube_B'
    key Partida.id_time_b,
    Partida.data as Data,
    Partida.publico as Publico,
    @Semantics.amount.currencyCode : 'Moeda'
    Partida.renda as Renda,
    @Semantics.currencyCode: true
    Partida.moeda as Moeda,
    Partida.placar_time_a as Placar_Time_A,
    Partida.placar_time_b as Placar_Time_B,
    
    _estadio,
    _clube_A,
    _clube_B

}
