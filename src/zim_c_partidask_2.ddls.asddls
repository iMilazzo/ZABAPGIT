@AbapCatalog.sqlViewName: 'ZIMCPARTIDAS22'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption view for PartidasK'

@Metadata.allowExtensions: true
@VDM:{
    viewType: #CONSUMPTION
}
@OData: {
    entitySet: { name: 'PartidasHdrSet' },
    entityType: { name: 'PartidaHdr' }
}
@ObjectModel:{

  createEnabled: true,
  updateEnabled: true,
  deleteEnabled: true,
  semanticKey: ['id_partida'],
  representativeKey: 'id_partida'

}
define view ZIM_C_PARTIDASK_2
  as select from ZIM_I_PARTIDASK as PartidasHdr
  association [0..*] to ZIM_C_PARTIDASP   as _Items     on _Items.id_partida = $projection.id_partida
  association [1]    to ZIM_C_ESTADIOS    as _Estadio   on _Estadio.id_estadio = $projection.id_estadio
  association [1]    to ZIM_I_ESTADIOS_VH as _EstadioVH on _EstadioVH.id_estadio = $projection.id_estadio
{

      @ObjectModel.readOnly: true
  key id_partida,
  
      data_partida,
      id_rodada,

      @ObjectModel.foreignKey.association: '_EstadioVH'
      @ObjectModel.text.element:[ 'nome_estadio' ]
      @Consumption.valueHelp: '_EstadioVH'
      @Consumption.semanticObject: 'ZESTADIOS'
      id_estadio,

      @ObjectModel.readOnly
      @Semantics.text: true
      _EstadioVH.nome_estadio as nome_estadio,


//      publico,

      @Semantics.amount.currencyCode: 'moeda'
      renda,

      @Semantics.currencyCode: true
      moeda,

      @ObjectModel.readOnly
      @UI.hidden
      _Estadio.capacidade as capacidade,
      
      @ObjectModel.readOnly
      PublicoThreshold,

      @ObjectModel.readOnly
      case when PublicoThreshold >= 66 then 3
           when PublicoThreshold >= 33 then 2
           else 1 end as PublicoCritical,

      @ObjectModel.association.type: [#TO_COMPOSITION_PARENT,#TO_COMPOSITION_ROOT]
      _Estadio,
      _EstadioVH,
      _Items


}
