class ZCL_ZXIMC_AIRLINEQUERY definition
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



CLASS ZCL_ZXIMC_AIRLINEQUERY IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~ZXIMC_AIRLINEQUERY| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20200523211723.
  endmethod.
ENDCLASS.
