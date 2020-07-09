class ZCL_ZIM_C_ESTADIOS_CUBE definition
  public
  inheriting from CL_NAT_ODATA_MODEL_ABS
  final
  create public .

public section.

  constants NC_QUERY_NAME type /IWBEP/ANA_GSR_QUERY_NAME value '2CZIMCESTADIOSCUBE' ##NO_TEXT.

  methods IF_NAT_QUERY_HELPER~GET_QUERY_NAME
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ZIM_C_ESTADIOS_CUBE IMPLEMENTATION.


  method IF_NAT_QUERY_HELPER~GET_QUERY_NAME.
    r_query_name = nc_query_name.
  endmethod.
ENDCLASS.
