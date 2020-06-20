@AbapCatalog.sqlViewName: 'ZIMICLUBESBOPF'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Clubes, private view, VDM interface view'

@Analytics.dataCategory: #DIMENSION

@VDM.viewType: #BASIC
@ObjectModel:{
    representativeKey: 'id_clube',
    semanticKey: ['id_clube', 'id_estadio'],
    writeActivePersistence: 'ZIM_CLUBES',
    createEnabled: true,
    deleteEnabled: true,
    updateEnabled: true,
    usageType: {
        serviceQuality: #B,
        sizeCategory: #S,
        dataClass: #MASTER  
    }    
}
define view ZIM_I_CLUBES_BOPF
  as select from zim_clubes
{
  key id_clube,
  key id_estadio,
      nometime     as NomeTime,
      nomecompleto as NomeCompleto,
      fundacao     as Fundacao,
      tecnico      as Tecnico,
      filename

}
