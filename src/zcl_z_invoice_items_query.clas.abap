class ZCL_Z_INVOICE_ITEMS_QUERY definition
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



CLASS ZCL_Z_INVOICE_ITEMS_QUERY IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~Z_INVOICE_ITEMS_QUERY| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20200521153342.
  endmethod.
ENDCLASS.
