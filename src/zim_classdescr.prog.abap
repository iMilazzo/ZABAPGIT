*&---------------------------------------------------------------------*
*& Report ZIM_CLASSDESCR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zim_classdescr.


PARAMETERS: p_class TYPE abap_compname.


DATA: l_classdesc TYPE REF TO cl_abap_classdescr.
DATA(l_typedesc) = cl_abap_classdescr=>describe_by_name( p_class ).
l_classdesc ?= l_typedesc.

cl_demo_output=>new(
      )->write( l_classdesc->attributes
      )->write( l_classdesc->methods
      )->write( l_classdesc->events
      )->display( ).
*cl_demo_output=>display( l_classdesc->methods ).


*LOOP AT l_classdesc->attributes INTO l_attribute
*                                WHERE type_kind = cl_abap_classdescr=>typekind_string
*                                OR type_kind = cl_abap_classdescr=>typekind_num
*                                OR type_kind = cl_abap_classdescr=>typekind_date
*                                OR type_kind = cl_abap_classdescr=>typekind_packed
*                                OR type_kind = cl_abap_classdescr=>typekind_time
*                                OR type_kind = cl_abap_classdescr=>typekind_char
*                                OR type_kind = cl_abap_classdescr=>typekind_hex
*                                OR type_kind = cl_abap_classdescr=>typekind_float
*                                OR type_kind = cl_abap_classdescr=>typekind_int
*                                OR type_kind = cl_abap_classdescr=>typekind_table
*                                OR type_kind = cl_abap_classdescr=>typekind_struct2
*                                OR type_kind = cl_abap_classdescr=>typekind_struct1
*                                OR type_kind = cl_abap_classdescr=>typekind_oref
*                                OR type_kind = cl_abap_classdescr=>typekind_time.
*
*  name = l_attribute-name .
*
**  ASSIGN lo_obj->(name) TO FIELD-SYMBOL(<att>).
**
**  CHECK sy-subrc = 0.
**
**  GET REFERENCE OF <att> INTO DATA(att_ref). " here I get the reference
*
*
*
*
*ENDLOOP.
