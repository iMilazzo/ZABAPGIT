@AbapCatalog.sqlViewName: 'ZIMIELENCOSBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'BOPF for ELENCOS'

@VDM.viewType: #TRANSACTIONAL
@ObjectModel:{

    representativeKey: 'id_jogador',
    semanticKey: ['id_clube', 'id_jogador'],

    writeActivePersistence: 'ZIM_ELENCOS',
//    draftEnabled: true,
//    writeDraftPersistence: 'ZIM_ELENCOS_D',
    
    createEnabled: true,
    updateEnabled: true,
    deleteEnabled: true

}
define view ZIM_I_ELENCOS_BOPF
  as select from ZIM_I_ELENCOS_BASIC as Elenco
  association [1..1] to ZIM_I_CLUBES_BOPF as _Clube on _Clube.id_clube = Elenco.id_clube
  association [1..1] to ZIM_I_JOGADOR_VH as _Jogador on _Jogador.id_jogador = Elenco.id_jogador
{

      //zim_elencos
  key id_clube,
      @ObjectModel.foreignKey.association: '_Jogador'
  key id_jogador,
//      @Semantics.text:true
//      @Search.defaultSearchElement: true
//      @Search.fuzzinessThreshold: 0.8
//      @ObjectModel.readOnly: true
//      _Jogador.nome_jogador,
      posicao,
      camisa,

      @ObjectModel.association.type: [ #TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT ]
      _Clube,
      
     _Jogador
      
}
