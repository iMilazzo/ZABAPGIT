@AbapCatalog.sqlViewName: 'ZIMIELENCOSBASIC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Elenco, private view, VDM interface view'

@VDM.viewType: #BASIC
@ObjectModel:{
    representativeKey: 'id_jogador',
    semanticKey: ['id_clube', 'id_jogador'],
  
    usageType: {
        serviceQuality: #B,
        sizeCategory: #S,
        dataClass: #MASTER
    }
}
define view ZIM_I_ELENCOS_BASIC as select from zim_elencos {
    //zim_elencos
    key id_clube,
    key id_jogador,
    posicao,
    camisa
}
