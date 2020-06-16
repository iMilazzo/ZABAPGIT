CLASS zcl_get_account_data_001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_get_account_data_001 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_accounts TYPE ztt_accounts_001.
    SELECT * FROM zaccounts_001 INTO TABLE @lt_accounts.
    out->write( EXPORTING
    data = lt_accounts
    name = 'Accounts:' ).

  ENDMETHOD.

ENDCLASS.
