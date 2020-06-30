@AbapCatalog.sqlViewName: 'ZIMCPARTIDKCBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for PartidasK'

@Metadata.allowExtensions: true
@VDM.viewType : #CONSUMPTION
@OData.publish:true
@ObjectModel:{

  compositionRoot: true,
  transactionalProcessingDelegated : true,
  transactionalProcessingUnitRoot: true,

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
  draftEnabled: true,

  semanticKey: ['id_partida'],
  representativeKey: 'id_partida'

}
define view ZIM_C_PARTIDASK_CBOPF as select from ZIM_I_PARTIDASK_BOPF as Partida
//  association [1..*] to ZIM_C_PARTIDASP_CBOPF as _Items on _Items.id_partida = $projection.id_partida
//  association [1..1] to ZIM_C_ESTADIOS_CBOPF as _Estadio on _Estadio.id_estadio = $projection.id_estadio
{

    @ObjectModel.mandatory: true
    key id_partida,

    data_partida,
//    cast( data as abap.char( 30 ) ) as data,
//    @ObjectModel.readOnly: true
//    @ObjectModel.virtualElement:true
//    @ObjectModel.virtualElementCalculatedBy:    'ABAP:ZCL_CALCULATION_DISCOUNT'
//    cast(0 as abap.curr( 15, 2 ) )              as GrossAmountWithDiscount,
//    tstmp_to_dats( data,
//                   abap_system_timezone( $session.client,'NULL' ),
//                   $session.client, 'NULL' ) as datax,

    id_rodada,

//    @ObjectModel.text.association: '_Estadio.nome_estadio'
//    @ObjectModel.foreignKey.association: '_Estadio'
//    @ObjectModel.text.element: 'nome_estadio'
//    @Consumption.valueHelp: '_Estadio'
//    @Consumption.semanticObject: 'ZESTADIOS'
    id_estadio,

//    @ObjectModel.readOnly
////    @ObjectModel.editableFieldFor: 'id_estadio'
//    @Semantics.text: true
//    @UI.hidden: true
//    _Estadio.nome_estadio as nome_estadio,
//    
    publico,
    
    @Semantics.amount.currencyCode: 'moeda'
    renda,

    @Semantics.currencyCode: true
    moeda

    /* Associations */
//    _Estadio
    
//    @ObjectModel.association.type: [ #TO_COMPOSITION_CHILD ]
//    _Items
}
