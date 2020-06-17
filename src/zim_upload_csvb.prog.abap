*&---------------------------------------------------------------------*
*& Include zim_upload_csvb
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&  CLASSES
*&---------------------------------------------------------------------*
CLASS lcl_app DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS:
      "! <p class="shorttext sychronized" lang="en">My First Method</p>
      my_first_method
        IMPORTING !import       TYPE string
        RETURNING VALUE(export) TYPE string.

  PRIVATE SECTION.
  PROTECTED SECTION.

ENDCLASS.


CLASS lcl_app IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( 'Starting OO #1 Test' ).
    out->write( me->my_first_method( 'Input Value' ) ).

  ENDMETHOD.

  METHOD my_first_method.

    export = import.

  ENDMETHOD.

ENDCLASS.
