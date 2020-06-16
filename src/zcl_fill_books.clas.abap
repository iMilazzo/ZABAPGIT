CLASS zcl_fill_books DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS get_number IMPORTING e_range_nr TYPE char2 RETURNING VALUE(r_id) TYPE zbook_id.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fill_books IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA:
      lt_books        TYPE TABLE OF zbooks,
      lt_authors      TYPE TABLE OF zauthors,
      lt_publishers   TYPE TABLE OF zpublishers,
      lt_booksauthors TYPE TABLE OF zbooksauthors.

    GET TIME STAMP FIELD DATA(l_createdat).

    "fill internal table
    lt_publishers = VALUE #(
        ( client = sy-mandt publisher_id = get_number( '01' ) name = 'SAP Press'              createdat = l_createdat createdby = sy-uname )
        ( client = sy-mandt publisher_id = get_number( '01' ) name = 'Editora Martins Fontes' createdat = l_createdat createdby = sy-uname )
        ( client = sy-mandt publisher_id = get_number( '01' ) name = 'Editora Leya'           createdat = l_createdat createdby = sy-uname )
        ( client = sy-mandt publisher_id = get_number( '01' ) name = 'Editora Arqueiro'       createdat = l_createdat createdby = sy-uname )
    ).


    data(l_order) = REDUCE #(
                INIT l_string TYPE string
                 FOR <fs_order> IN lt_publishers
                NEXT l_string = cond #( when l_string is initial
                                        then |{ <fs_order>-name } asc|
                                        else l_string && |, { <fs_order>-name } asc| )
                ).



    "Delete possible entries; insert new entries
    DELETE FROM zpublishers.
    INSERT zpublishers FROM TABLE @lt_publishers.

    "Check result in console
    out->write( sy-dbcnt ).
    out->write(  'Publishers DONE!' ).


    GET TIME STAMP FIELD l_createdat.

    lt_authors =
    VALUE #(
    ( client = sy-mandt author_id = get_number( '02' ) name = 'J. R. R. Tolkien'      createdat = l_createdat createdby = sy-uname )
    ( client = sy-mandt author_id = get_number( '02' ) name = 'George R. R. Martin'   createdat = l_createdat createdby = sy-uname )
    ( client = sy-mandt author_id = get_number( '02' ) name = 'Anil Bavaraju'         createdat = l_createdat createdby = sy-uname )
    ( client = sy-mandt author_id = get_number( '02' ) name = 'Dan Brown'             createdat = l_createdat createdby = sy-uname )
    ( client = sy-mandt author_id = get_number( '02' ) name = 'Christiane Goebels'    createdat = l_createdat createdby = sy-uname )
    ( client = sy-mandt author_id = get_number( '02' ) name = 'Denise Nepraunig'      createdat = l_createdat createdby = sy-uname )
    ( client = sy-mandt author_id = get_number( '02' ) name = 'Thilo Seidel'          createdat = l_createdat createdby = sy-uname )
    ).

    DELETE FROM zauthors.
    INSERT zauthors FROM TABLE @lt_authors.

    "Check result in console
    out->write( sy-dbcnt ).
    out->write(  'Authors DONE!' ).

    GET TIME STAMP FIELD l_createdat.

    lt_books =
    VALUE #(
    ( client = sy-mandt book_id =
      get_number( '03' )
      title = 'O Senhor dos Anéis'
      author = 'J. R. R. Tolkien'
      publisher_id = lt_publishers[ name = 'Editora Martins Fontes' ]-publisher_id
      cuky_field = 'BRL'
      price = '79.99'
      unit_field = 'PC'
      stock ='200'
      createdat = l_createdat
      createdby = sy-uname )

    ( client = sy-mandt
      book_id = get_number( '03' )
      title = 'As Crônicas de Gelo e Fogo'
      author = 'George R. R. Martin'
      publisher_id = lt_publishers[ name = 'Editora Leya' ]-publisher_id
      cuky_field = 'BRL'
      price = '89.99'
      unit_field = 'PC'
      stock ='200'
      createdat = l_createdat
      createdby = sy-uname )

    ( client = sy-mandt
      book_id = get_number( '03' )
      title = 'Origem'
      author = 'Dan Brown'
      publisher_id = lt_publishers[ name = 'Editora Arqueiro' ]-publisher_id
      cuky_field = 'BRL'
      price ='99.99'
      unit_field = 'PC'
      stock ='200'
      createdat = l_createdat
      createdby = sy-uname )

    ( client = sy-mandt
      book_id = get_number( '03' )
      title = 'O Hobbit'
      author = 'J. R. R. Tolkien'
      publisher_id = lt_publishers[ name = 'Editora Martins Fontes' ]-publisher_id
      cuky_field = 'BRL'
      price ='59.99'
      unit_field = 'PC'
      stock ='200'
      createdat = l_createdat
      createdby = sy-uname )

    ( client = sy-mandt
      book_id = get_number( '03' )
      title = 'SAP Fiori Introducing'
      author = 'Anil Bavaraju'
      publisher_id = lt_publishers[ name = 'SAP Press' ]-publisher_id
      cuky_field = 'BRL'
      price ='379.99'
      unit_field = 'PC'
      stock ='200'
      createdat = l_createdat
      createdby = sy-uname )

    ( client = sy-mandt
      book_id = get_number( '03' )
      title = 'SAP UI5 Guide'
      author = 'Christiane Goebels'
      publisher_id = lt_publishers[ name = 'SAP Press' ]-publisher_id
      cuky_field = 'BRL'
      price ='479.99'
      unit_field = 'PC'
      stock ='200'

      createdat = l_createdat
      createdby = sy-uname )
    ).

    DELETE FROM zbooks.
    INSERT zbooks FROM TABLE @lt_books.

    "Check result in console
    out->write( sy-dbcnt ).
    out->write(  'Books x Authors DONE!' ).

    GET TIME STAMP FIELD l_createdat.

    lt_booksauthors = VALUE #(
    (  client = sy-mandt book_id = lt_books[ title = 'O Senhor dos Anéis' ]-book_id         author_id = lt_authors[ name = 'J. R. R. Tolkien' ]-author_id )
    (  client = sy-mandt book_id = lt_books[ title = 'As Crônicas de Gelo e Fogo' ]-book_id author_id = lt_authors[ name = 'George R. R. Martin' ]-author_id )
    (  client = sy-mandt book_id = lt_books[ title = 'Origem' ]-book_id                     author_id = lt_authors[ name = 'Dan Brown' ]-author_id )
    (  client = sy-mandt book_id = lt_books[ title = 'O Hobbit' ]-book_id                   author_id = lt_authors[ name = 'J. R. R. Tolkien' ]-author_id )
    (  client = sy-mandt book_id = lt_books[ title = 'SAP Fiori Introducing' ]-book_id      author_id = lt_authors[ name = 'Anil Bavaraju'  ]-author_id )
    (  client = sy-mandt book_id = lt_books[ title = 'SAP UI5 Guide' ]-book_id              author_id = lt_authors[ name = 'Christiane Goebels'  ]-author_id )
    (  client = sy-mandt book_id = lt_books[ title = 'SAP UI5 Guide' ]-book_id              author_id = lt_authors[ name = 'Denise Nepraunig'  ]-author_id )
    (  client = sy-mandt book_id = lt_books[ title = 'SAP UI5 Guide' ]-book_id              author_id = lt_authors[ name = 'Thilo Seidel'  ]-author_id )
     ).


    DELETE FROM zbooksauthors.
    INSERT zbooksauthors FROM TABLE @lt_booksauthors.

    "Check result in console
    out->write( sy-dbcnt ).
    out->write(  'Books x Authors DONE!' ).

  ENDMETHOD.

  METHOD get_number.

    DATA: l_returncode TYPE inri-returncode.

    CALL FUNCTION 'NUMBER_GET_NEXT'
      EXPORTING
        nr_range_nr             = e_range_nr   "-- This hold the Newly generated Number
        object                  = 'ZBOOKSHOP'  "---- Passing the Number Range Object
      IMPORTING
        number                  = r_id     "-- Newly generated Number
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


  ENDMETHOD.

ENDCLASS.
