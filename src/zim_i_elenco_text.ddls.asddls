@AbapCatalog.sqlViewName: 'ZIMIELENCOTEXT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Elenco, private view, VDM interface view'
@VDM.viewType: #BASIC
@Analytics.dataCategory: #DIMENSION
@ObjectModel.representativeKey: 'Clube'
define view ZIM_I_ELENCO_TEXT as select from zim_elencos as Elenco
    association [1..1] to zim_jogadores as _jogadores on _jogadores.id_jogador = Elenco.id_jogador
{
    key id_clube as Clube,
    key id_jogador as JogadorID,
    camisa as NumeroCamisa,
    _jogadores.nomejogador as NomeJogador,
    posicao as Posicao
}
