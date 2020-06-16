CLASS zcl_zsap_bookshop_c_03_dpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_zsap_bookshop_c_03_dpc
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.

    METHODS bookset_create_entity
        REDEFINITION .
    METHODS bookset_get_entityset
        REDEFINITION .
    METHODS bookset_update_entity
        REDEFINITION .
    METHODS bookset_delete_entity
        REDEFINITION .
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zsap_bookshop_c_03_dpc_ext IMPLEMENTATION.


  METHOD bookset_create_entity.
**TRY.
*CALL METHOD SUPER->BOOKSSET_CREATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**    io_data_provider        =
**  IMPORTING
**    er_entity               =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.

    DATA: l_request_input_data TYPE zcl_zsap_bookshop_c_03_mpc=>ts_books,
          l_returncode         TYPE inri-returncode,
          l_book_id            TYPE zbook_id.

* Read Request Data
    io_data_provider->read_entry_data( IMPORTING es_data = l_request_input_data ).


    CALL FUNCTION 'NUMBER_GET_NEXT'
      EXPORTING
        nr_range_nr             = '03'         "-- This hold the Newly generated Number
        object                  = 'ZBOOKSHOP'  "---- Passing the Number Range Object
      IMPORTING
        number                  = l_book_id    "-- Newly generated Number
        returncode              = l_returncode "-- The Return Code Number
      EXCEPTIONS
        interval_not_found      = 1
        number_range_not_intern = 2
        object_not_found        = 3
        quantity_is_0           = 4
        quantity_is_not_1       = 5
        interval_overflow       = 6
        buffer_overflow         = 7
        OTHERS                  = 8.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.

    GET TIME STAMP FIELD DATA(l_createdat).

    IF l_book_id IS NOT INITIAL AND
       l_request_input_data-title IS NOT INITIAL AND
       l_request_input_data-author IS NOT INITIAL AND
       l_request_input_data-publisher IS NOT INITIAL.

      DATA(l_book) = VALUE zbooks(
                            book_id = l_book_id
                              title = l_request_input_data-title
                             author = l_request_input_data-author
                       publisher_id = l_request_input_data-publisher
                         cuky_field = l_request_input_data-currency
                              price = l_request_input_data-price
                         unit_field = l_request_input_data-quantity
                              stock = l_request_input_data-stock
                          createdby = sy-uname
                          createdat = l_createdat ).

      INSERT zbooks FROM l_book.

      IF sy-subrc = 0.

        er_entity = CORRESPONDING #( l_book ). "Fill Exporting parameter ER_ENTITY

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD bookset_delete_entity.
**TRY.
*CALL METHOD SUPER->BOOKSSET_DELETE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.

    DATA(l_book_id) = VALUE #( it_key_tab[ name = 'BookId' ]-value OPTIONAL ).
    IF l_book_id IS NOT INITIAL.

* Delete record from table ZUSERINFO
      DELETE FROM zbooks WHERE book_id = l_book_id.

    ENDIF.

  ENDMETHOD.


  METHOD bookset_get_entityset.
**TRY.
*CALL METHOD SUPER->BOOKSSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  IMPORTING
**    et_entityset             =
**    es_response_context      =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.

    DATA(l_order) = REDUCE string(
                      INIT l_string TYPE string
                       FOR <fs_order> IN it_order
                      NEXT l_string = COND #( WHEN l_string IS INITIAL
                                              THEN |{ <fs_order>-property } { SWITCH string(
                                                                                <fs_order>-order
                                                                                WHEN 'asc'  THEN 'ASCENDING'
                                                                                WHEN 'desc' THEN 'DESCENDING') }|
                                              ELSE l_string && |, { <fs_order>-property } { SWITCH string(
                                                                                              <fs_order>-order
                                                                                              WHEN 'asc'  THEN 'ASCENDING'
                                                                                              WHEN 'desc' THEN 'DESCENDING') }| ) ).
    IF l_order IS INITIAL.
      l_order = 'PRIMARY KEY'.
    ENDIF.

    SELECT *
      FROM zxmc_books
     WHERE (iv_filter_string)
     ORDER BY (l_order)
      INTO CORRESPONDING FIELDS OF TABLE @et_entityset
     UP TO @is_paging-top ROWS
    OFFSET @is_paging-skip.


  ENDMETHOD.


  METHOD bookset_update_entity.
**TRY.
*CALL METHOD SUPER->BOOKSSET_UPDATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**    io_data_provider        =
**  IMPORTING
**    er_entity               =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.

    DATA: ls_request_input_data TYPE zcl_zsap_bookshop_c_03_mpc=>ts_books.

* Get key values
    DATA(lv_book_id) = VALUE #( it_key_tab[ name = 'BookId' ]-value OPTIONAL ).

    IF lv_book_id IS NOT INITIAL.

* Read request data
      io_data_provider->read_entry_data( IMPORTING es_data = ls_request_input_data ).

      SELECT SINGLE * INTO @DATA(ls_book) FROM zxmc_books WHERE book_id = @lv_book_id.
      IF sy-subrc EQ 0.

        DATA(l_subrc) = sy-subrc.
        DATA lr_structdescr TYPE REF TO cl_abap_structdescr.
        lr_structdescr ?= cl_abap_structdescr=>describe_by_data( ls_book ).
        DATA(lt_comp) = lr_structdescr->get_components( ).

        WHILE l_subrc = 0.


          ASSIGN COMPONENT sy-index OF STRUCTURE ls_book TO FIELD-SYMBOL(<fs_field_old>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.

          ASSIGN COMPONENT lt_comp[ sy-index ]-name OF STRUCTURE ls_request_input_data TO FIELD-SYMBOL(<fs_field_new>).
          IF sy-subrc <> 0.
            EXIT.
          ENDIF.
          IF <fs_field_new> IS NOT INITIAL.
            <fs_field_old> = <fs_field_new>.
          ENDIF.
        ENDWHILE.

* Update fields of table ZBOOKS
        UPDATE zbooks SET title = ls_book-title
                         author = ls_book-author
                   publisher_id = ls_book-Publisher
                     cuky_field = ls_book-Currency
                          price = ls_book-price
                     unit_field = ls_book-price
                          stock = ls_book-stock
                  WHERE book_id = lv_book_id.

        IF sy-subrc = 0.

          er_entity = CORRESPONDING #( ls_book ). "Fill exporting parameter ER_ENTITY

        ENDIF.

      ENDIF.

    ENDIF.
  ENDMETHOD.

ENDCLASS.
