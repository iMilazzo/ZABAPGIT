class ZCL_ZIM_I_COVID_WISE definition
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



CLASS ZCL_ZIM_I_COVID_WISE IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~ZIM_I_COVID_WISE| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20200610203145.
  endmethod.
ENDCLASS.
