@AbapCatalog.sqlViewName: 'ZIMCPARTIDPCBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for PartidasP'

@Metadata.allowExtensions: true
@VDM.viewType : #CONSUMPTION
@ObjectModel:{

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
//  draftEnabled: true,

  semanticKey: ['id_partida', 'id_item'],
  representativeKey: 'id_item'
  
}

define view ZIM_C_PARTIDASP_CBOPF
  as select from ZIM_I_PARTIDASP_BOPF as Item
//  association [1..1] to ZIM_C_PARTIDASK_CBOPF as _Header on _Header.id_partida = $projection.id_partida
  association [1..1] to ZIM_C_CLUBES_CBOPF as _Clube on _Clube.id_clube = $projection.id_clube
{
      @ObjectModel.mandatory: true
//      @ObjectModel.readOnly: true
  key id_partida,

      @ObjectModel.mandatory: true
  key id_item,

      @ObjectModel.text.element: 'nome_time'
      @Consumption.valueHelp: '_Clube'
      @Consumption.semanticObject: 'ZCLUBESOP3'  
      id_clube,
      
      @ObjectModel.readOnly
      @Semantics.text: true
      @UI.hidden: true
      _Clube.nome_time as nome_time,
            
      placar,
      pontos,
      
      /* Associations */
      _Clube
      
//      @ObjectModel.association.type: [ #TO_COMPOSITION_PARENT, #TO_COMPOSITION_ROOT ]
//      _Header
}
