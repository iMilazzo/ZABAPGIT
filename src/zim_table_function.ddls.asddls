@EndUserText.label: 'Clubes with Sorting'
define table function zim_table_function
returns
{
  mandt       : mandt;
  id_clube    : zim_id;
  nome_time   : zim_nometime;
  totalgols   : zim_placar;
  totalpontos : zim_placar;

}
implemented by method
  zcl_zim_table_function=>sort;