CLASS zcl_zim_table_function DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_amdp_marker_hdb.
    CLASS-METHODS sort FOR TABLE FUNCTION zim_table_function.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_zim_table_function IMPLEMENTATION.

  METHOD sort
      BY DATABASE FUNCTION
      FOR HDB LANGUAGE SQLSCRIPT
      OPTIONS READ-ONLY USING zimiclubescube.

    RETURN

       SELECT DISTINCT mandt, id_clube, nome_time, totalgols, totalpontos
           FROM zimiclubescube
           ORDER BY totalpontos desc;

  endmethod.

ENDCLASS.
