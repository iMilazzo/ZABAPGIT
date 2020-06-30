*&---------------------------------------------------------------------*
*& Report zim_img_test
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zim_img_test.

CLASS demo DEFINITION.
  PUBLIC SECTION.
    TYPES _url TYPE c LENGTH 200.
    TYPES: BEGIN OF _graphic_row,
             line(255) TYPE x,
           END OF _graphic_row,
           _graphic_tab TYPE STANDARD TABLE OF _graphic_row WITH DEFAULT KEY.
    METHODS show.
  PRIVATE SECTION.
    METHODS get_image_url
      RETURNING
        VALUE(url) TYPE url.
    METHODS convert_xstring_to_table
      IMPORTING
        xstr       TYPE xstring
      RETURNING
        VALUE(tab) TYPE _graphic_tab.

    DATA picture TYPE REF TO cl_gui_picture.
    DATA container TYPE REF TO cl_gui_docking_container.

ENDCLASS.

CLASS demo IMPLEMENTATION.
  METHOD show.

    DATA: graphic_size TYPE i.

    CREATE OBJECT container
      EXPORTING
        extension               = 300
        no_autodef_progid_dynnr = 'X'.

    CREATE OBJECT picture
      EXPORTING
        parent = container.

    picture->load_picture_from_url( url = get_image_url( ) ).
    picture->set_display_mode( cl_gui_picture=>display_mode_fit ).

  ENDMETHOD.

  METHOD get_image_url.
    DEFINE a.
      CONCATENATE graphic_str &1 INTO graphic_str.
    END-OF-DEFINITION.

    DATA graphic_xstr TYPE xstring.
    DATA graphic_x    TYPE x.
    DATA graphic_str  TYPE string.
    DATA graphic_size TYPE i.
    DATA graphic_table TYPE _graphic_tab.


    TYPES ty_char160 TYPE c LENGTH 160.
    DATA local_pic TYPE STANDARD TABLE OF ty_char160.

    "GIF rennpony 16 colors
    a 'R0lGODlhFQATADMAACH5BAAAAAAALAAAAAAVABMAg////19qcHaP'.
    a 'jo6ij5XL/p3Mx6rR3qTS+LPUksPessjcysvl+ufbrvrclPfv1Or0'.
    a '+wSMEMg5F1mY6g0eztzmNA3TKEu4LYaptI2jShbBMIahlDNwXCwD'.
    a 'YcdQeQ6HwEDxOyiKmyNhKhj8pobYBjkl6K5TokZRKBe+3enhRnEg'.
    a '3u/EbwH2aiWJfB6hfjzAa3d6ewYHDzRpWQ0SCoMJBoc0gCYOMo15'.
    a 'hho1aiaLAAqgkRR/aYE9iKVQPZtppwCsXREAOw=='.

    CALL FUNCTION 'SSFC_BASE64_DECODE'
      EXPORTING
        b64data = graphic_str
      IMPORTING
        bindata = graphic_xstr
      EXCEPTIONS
        OTHERS  = 8.


    graphic_table = convert_xstring_to_table( graphic_xstr ).

    CALL FUNCTION 'DP_CREATE_URL'
      EXPORTING
        type     = 'image'                                    "#EC NOTEXT
        subtype  = 'gif'
        lifetime = cndp_lifetime_transaction  "'T'
      TABLES
        data     = graphic_table
      CHANGING
        url      = url.

  ENDMETHOD.

  METHOD convert_xstring_to_table.

    DATA conv TYPE i.

    DATA offs TYPE i.
    DATA size TYPE i.
    DATA row TYPE _graphic_row.

    size = xstrlen( xstr ).
    CHECK size > 0.

    conv = size.
    offs = 0.

    WHILE conv > 255.
      row-line = xstr+offs(255).
      APPEND row TO tab.
      offs = offs + 255.
      conv = conv - 255.
    ENDWHILE.

    row-line = xstr+offs(conv).
    APPEND row TO tab.

  ENDMETHOD.
ENDCLASS.


PARAMETERS p_test.

INITIALIZATION.
  NEW demo( )->show( ).
