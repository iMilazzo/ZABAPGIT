class ZCL_ZXMC_BOOKS definition
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



CLASS ZCL_ZXMC_BOOKS IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~ZXMC_BOOKS| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20200522014747.
  endmethod.
ENDCLASS.
