@AbapCatalog.sqlViewName: 'ZIMICLUBESVIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clubes, private view, VDM interface view'

@Analytics.dataCategory: #DIMENSION
@VDM.viewType: #BASIC
@ObjectModel:{
    representativeKey: 'Clubes.id_clube',
    semanticKey: 'Clubes.id_clube'
}
define view ZIM_I_CLUBES_VIEW
  as select from zim_clubes as Clubes

  association [1..1] to zim_estadios      as _estadio on _estadio.id_estadio = $projection.ClubeID
  association [1..1] to zim_clubes_desc   as _desc    on _desc.id_clube = $projection.ClubeID
  association [1..1] to zim_clubes_logo   as _logo    on _logo.id_clube = $projection.ClubeID
  association [0..*] to ZIM_I_ELENCO_TEXT as _elencos on _elencos.Clube = $projection.ClubeID
  association [0..*] to ZIM_I_PARTIDAS_VIEW as _partidas_A on _partidas_A.id_time_a = $projection.ClubeID
  association [0..*] to ZIM_I_PARTIDAS_VIEW as _partidas_B on _partidas_B.id_time_b = $projection.ClubeID

{
  key id_clube as ClubeID,
      id_estadio as EstadioID,
      nometime as NomeTime,
      nomecompleto as NomeCompleto,
      fundacao as Fundacao,
      tecnico as Tecnico,
      filename,

      _estadio,
      _desc,
      _logo,
      _elencos,
      
      @ObjectModel.association.type:  [#TO_COMPOSITION_CHILD  ]      
      _partidas_A,

      @ObjectModel.association.type:  [#TO_COMPOSITION_CHILD  ]      
      _partidas_B
      
}
