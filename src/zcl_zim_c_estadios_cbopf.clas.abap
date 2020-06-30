class ZCL_ZIM_C_ESTADIOS_CBOPF definition
  public
  inheriting from CL_SADL_GTK_EXPOSURE_MPC
  final
  create public .

public section.
protected section.

  methods GET_PATHS
    redefinition .
  methods GET_TIMESTAMP
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZIM_C_ESTADIOS_CBOPF IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~ZIM_C_ESTADIOS_CBOPF| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20200622185555.
  endmethod.
ENDCLASS.
