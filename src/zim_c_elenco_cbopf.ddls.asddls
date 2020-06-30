@AbapCatalog.sqlViewName: 'ZIMCELENCOSCBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view to CLUBES'

@VDM.viewType : #CONSUMPTION
//@Search.searchable: true
@ObjectModel:{

  transactionalProcessingDelegated  : true,
  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,

  semanticKey: ['id_clube', 'id_jogador'],
  representativeKey: 'id_jogador',

  usageType: {
      serviceQuality: #D,
      sizeCategory: #S,
      dataClass: #TRANSACTIONAL
      }
}

//@UI.headerInfo: {
//    typeName: 'Elenco Atual',
//    typeNamePlural: 'Jogadores',
//    title.value: 'id_jogador',
//    description.value: 'id_jogador'
//}
//@UI.badge: {
//    title: {
//            label: 'Jogador',
//            value: 'id_jogador'
//    }
//}
define view ZIM_C_ELENCO_CBOPF
  as select from ZIM_I_ELENCOS_BOPF as Elenco
  association [1..1] to ZIM_C_CLUBES_CBOPF as _Clube on _Clube.id_clube = $projection.id_clube
  association [0..1] to ZIM_C_JOGADOR_CBOPF as _Jogador on _Jogador.id_jogador = $projection.id_jogador
{

      @UI.hidden: true
  key id_clube,

      @UI: {
          lineItem: [ { position: 10, label: 'ID do Jogador', importance: #HIGH } ],
          identification:[ { position: 10, label: 'ID do Jogador' } ]
      }
      
      @ObjectModel.text.element: 'nome_jogador'
      @ObjectModel.text.association: '_Jogador'
      @Consumption.valueHelp: '_Jogador'
      @ObjectModel.foreignKey.association: '_Jogador'
  key id_jogador,
  
      @ObjectModel.readOnly
      @Semantics.text: true
      _Jogador.nome_jogador,
  

      //      @UI: {
      //          fieldGroup: { groupLabel: 'Info', qualifier: 'info' },
      //          lineItem: [ { position: 20, label: 'Nome do Jogador', importance: #HIGH } ],
      //          identification:[ { position: 20, label: 'Nome do Jogador' } ],
      //          selectionField: [ { position: 20 } ]
      //      }
      //      @Search: {
      //          defaultSearchElement: true,
      //          ranking: #HIGH,
      //          fuzzinessThreshold: 0.8
      //      }
      //      nome_jogador,

      @UI: {
          lineItem: [ { position: 20, label: 'ID do Jogador', importance: #HIGH } ],
          identification:[ { position: 20, label: 'Posição' } ]
      }
      posicao,

      @UI: {
          lineItem: [ { position: 30, label: 'ID do Jogador', importance: #HIGH } ],
          identification:[ { position: 30, label: 'Número da Camisa' } ]
      }
      camisa,

      /* Associations */
      _Jogador,
            
      @ObjectModel.association.type: [ #TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT ]
      _Clube
//      @ObjectModel.readOnly
//      _Jogador.nome_jogador,


}
