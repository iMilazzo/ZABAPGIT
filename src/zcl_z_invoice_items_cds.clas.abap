CLASS zcl_z_invoice_items_cds DEFINITION
  PUBLIC
  INHERITING FROM cl_sadl_gtk_exposure_mpc
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.

    METHODS get_paths
        REDEFINITION .
    METHODS get_timestamp
        REDEFINITION .
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_z_invoice_items_cds IMPLEMENTATION.


  METHOD get_paths.
    et_paths = VALUE #( ( |CDS~Z_INVOICE_ITEMS_CDS| ) ).
  ENDMETHOD.


  METHOD get_timestamp.
    rv_timestamp = 20200520192600.
  ENDMETHOD.
ENDCLASS.
