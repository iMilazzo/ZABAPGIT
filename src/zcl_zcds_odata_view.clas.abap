class ZCL_ZCDS_ODATA_VIEW definition
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



CLASS ZCL_ZCDS_ODATA_VIEW IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~ZCDS_ODATA_VIEW| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20200604011745.
  endmethod.
ENDCLASS.
