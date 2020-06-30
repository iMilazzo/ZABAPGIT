class ZCL_ZIM_ESTADIOS definition
  public
  create protected

  global friends ZCB_ZIM_ESTADIOS .

public section.

  interfaces IF_OS_STATE .

  methods SET_UF
    importing
      !I_UF type REGIO
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_NOME_ESTADIO
    importing
      !I_NOME_ESTADIO type ZIM_ESTADIO
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_LONGITUDE
    importing
      !I_LONGITUDE type ODATA_PL_GEO_LONGITUDE
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_LATITUDE
    importing
      !I_LATITUDE type ODATA_PL_GEO_LATITUDE
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_GEOCODE
    importing
      !I_GEOCODE type ZIM_GEOCODE
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_CREATED_BY
    importing
      !I_CREATED_BY type UNAME
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_CREATED_AT
    importing
      !I_CREATED_AT type TIMESTAMP
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_CIDADE
    importing
      !I_CIDADE type ORT01_GP
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_CHANGED_BY
    importing
      !I_CHANGED_BY type UNAME
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_CHANGED_AT
    importing
      !I_CHANGED_AT type TIMESTAMP
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_CAPACIDADE
    importing
      !I_CAPACIDADE type ZIM_CAPACIDADE
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_UF
    returning
      value(RESULT) type REGIO
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_NOME_ESTADIO
    returning
      value(RESULT) type ZIM_ESTADIO
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_LONGITUDE
    returning
      value(RESULT) type ODATA_PL_GEO_LONGITUDE
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_LATITUDE
    returning
      value(RESULT) type ODATA_PL_GEO_LATITUDE
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_ID_ESTADIO
    returning
      value(RESULT) type ZIM_ID
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_GEOCODE
    returning
      value(RESULT) type ZIM_GEOCODE
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_CREATED_BY
    returning
      value(RESULT) type UNAME
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_CREATED_AT
    returning
      value(RESULT) type TIMESTAMP
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_CIDADE
    returning
      value(RESULT) type ORT01_GP
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_CHANGED_BY
    returning
      value(RESULT) type UNAME
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_CHANGED_AT
    returning
      value(RESULT) type TIMESTAMP
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_CAPACIDADE
    returning
      value(RESULT) type ZIM_CAPACIDADE
    raising
      CX_OS_OBJECT_NOT_FOUND .
protected section.

  data ID_ESTADIO type ZIM_ID .
  data NOME_ESTADIO type ZIM_ESTADIO .
  data CIDADE type ORT01_GP .
  data UF type REGIO .
  data CAPACIDADE type ZIM_CAPACIDADE .
  data GEOCODE type ZIM_GEOCODE .
  data LATITUDE type ODATA_PL_GEO_LATITUDE .
  data LONGITUDE type ODATA_PL_GEO_LONGITUDE .
  data CREATED_AT type TIMESTAMP .
  data CREATED_BY type UNAME .
  data CHANGED_AT type TIMESTAMP .
  data CHANGED_BY type UNAME .
private section.
ENDCLASS.



CLASS ZCL_ZIM_ESTADIOS IMPLEMENTATION.


  method GET_CAPACIDADE.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute CAPACIDADE
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = CAPACIDADE.

           " GET_CAPACIDADE
  endmethod.


  method GET_CHANGED_AT.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute CHANGED_AT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = CHANGED_AT.

           " GET_CHANGED_AT
  endmethod.


  method GET_CHANGED_BY.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute CHANGED_BY
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = CHANGED_BY.

           " GET_CHANGED_BY
  endmethod.


  method GET_CIDADE.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute CIDADE
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = CIDADE.

           " GET_CIDADE
  endmethod.


  method GET_CREATED_AT.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute CREATED_AT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = CREATED_AT.

           " GET_CREATED_AT
  endmethod.


  method GET_CREATED_BY.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute CREATED_BY
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = CREATED_BY.

           " GET_CREATED_BY
  endmethod.


  method GET_GEOCODE.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute GEOCODE
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = GEOCODE.

           " GET_GEOCODE
  endmethod.


  method GET_ID_ESTADIO.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute ID_ESTADIO
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = ID_ESTADIO.

           " GET_ID_ESTADIO
  endmethod.


  method GET_LATITUDE.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute LATITUDE
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = LATITUDE.

           " GET_LATITUDE
  endmethod.


  method GET_LONGITUDE.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute LONGITUDE
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = LONGITUDE.

           " GET_LONGITUDE
  endmethod.


  method GET_NOME_ESTADIO.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute NOME_ESTADIO
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = NOME_ESTADIO.

           " GET_NOME_ESTADIO
  endmethod.


  method GET_UF.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute UF
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, result is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
************************************************************************

* * Inform class agent and handle exceptions
  state_read_access.

  result = UF.

           " GET_UF
  endmethod.


  method IF_OS_STATE~GET.
***BUILD 090501
     " returning result type ref to object
************************************************************************
* Purpose        : Get state.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : -
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
************************************************************************
* GENERATED: Do not modify
************************************************************************

  data: STATE_OBJECT type ref to CL_OS_STATE.

  create object STATE_OBJECT.
  call method STATE_OBJECT->SET_STATE_FROM_OBJECT( ME ).
  result = STATE_OBJECT.

  endmethod.


  method IF_OS_STATE~HANDLE_EXCEPTION.
***BUILD 090501
     " importing I_EXCEPTION type ref to IF_OS_EXCEPTION_INFO optional
     " importing I_EX_OS type ref to CX_OS_OBJECT_NOT_FOUND optional
************************************************************************
* Purpose        : Handles exceptions during attribute access.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : If an exception is raised during attribut access,
*                  this method is called and the exception is passed
*                  as a paramater. The default is to raise the exception
*                  again, so that the caller can handle the exception.
*                  But it is also possible to handle the exception
*                  here in the callee.
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
* - 2000-08-02   : (SB)  OO Exceptions
************************************************************************
* Modify if you like
************************************************************************

  if i_ex_os is not initial.
    raise exception i_ex_os.
  endif.

  endmethod.


  method IF_OS_STATE~INIT.
***BUILD 090501
"#EC NEEDED
************************************************************************
* Purpose        : Initialisation of the transient state partition.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : Transient state is initial.
*
* OO Exceptions  : -
*
* Implementation : Caution!: Avoid Throwing ACCESS Events.
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
************************************************************************
* Modify if you like
************************************************************************

  endmethod.


  method IF_OS_STATE~INVALIDATE.
***BUILD 090501
"#EC NEEDED
************************************************************************
* Purpose        : Do something before all persistent attributes are
*                  cleared.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : -
*
* Implementation : Whatever you like to do.
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
************************************************************************
* Modify if you like
************************************************************************

  endmethod.


  method IF_OS_STATE~SET.
***BUILD 090501
     " importing I_STATE type ref to object
************************************************************************
* Purpose        : Set state.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : -
*
* OO Exceptions  : -
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-07   : (BGR) Initial Version 2.0
************************************************************************
* GENERATED: Do not modify
************************************************************************

  data: STATE_OBJECT type ref to CL_OS_STATE.

  STATE_OBJECT ?= I_STATE.
  call method STATE_OBJECT->SET_OBJECT_FROM_STATE( ME ).

  endmethod.


  method SET_CAPACIDADE.
***BUILD 090501
     " importing I_CAPACIDADE
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute CAPACIDADE
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_CAPACIDADE <> CAPACIDADE ).

    CAPACIDADE = I_CAPACIDADE.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_CAPACIDADE <> CAPACIDADE )

           " GET_CAPACIDADE
  endmethod.


  method SET_CHANGED_AT.
***BUILD 090501
     " importing I_CHANGED_AT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute CHANGED_AT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_CHANGED_AT <> CHANGED_AT ).

    CHANGED_AT = I_CHANGED_AT.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_CHANGED_AT <> CHANGED_AT )

           " GET_CHANGED_AT
  endmethod.


  method SET_CHANGED_BY.
***BUILD 090501
     " importing I_CHANGED_BY
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute CHANGED_BY
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_CHANGED_BY <> CHANGED_BY ).

    CHANGED_BY = I_CHANGED_BY.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_CHANGED_BY <> CHANGED_BY )

           " GET_CHANGED_BY
  endmethod.


  method SET_CIDADE.
***BUILD 090501
     " importing I_CIDADE
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute CIDADE
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_CIDADE <> CIDADE ).

    CIDADE = I_CIDADE.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_CIDADE <> CIDADE )

           " GET_CIDADE
  endmethod.


  method SET_CREATED_AT.
***BUILD 090501
     " importing I_CREATED_AT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute CREATED_AT
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_CREATED_AT <> CREATED_AT ).

    CREATED_AT = I_CREATED_AT.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_CREATED_AT <> CREATED_AT )

           " GET_CREATED_AT
  endmethod.


  method SET_CREATED_BY.
***BUILD 090501
     " importing I_CREATED_BY
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute CREATED_BY
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_CREATED_BY <> CREATED_BY ).

    CREATED_BY = I_CREATED_BY.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_CREATED_BY <> CREATED_BY )

           " GET_CREATED_BY
  endmethod.


  method SET_GEOCODE.
***BUILD 090501
     " importing I_GEOCODE
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute GEOCODE
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_GEOCODE <> GEOCODE ).

    GEOCODE = I_GEOCODE.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_GEOCODE <> GEOCODE )

           " GET_GEOCODE
  endmethod.


  method SET_LATITUDE.
***BUILD 090501
     " importing I_LATITUDE
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute LATITUDE
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_LATITUDE <> LATITUDE ).

    LATITUDE = I_LATITUDE.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_LATITUDE <> LATITUDE )

           " GET_LATITUDE
  endmethod.


  method SET_LONGITUDE.
***BUILD 090501
     " importing I_LONGITUDE
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute LONGITUDE
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_LONGITUDE <> LONGITUDE ).

    LONGITUDE = I_LONGITUDE.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_LONGITUDE <> LONGITUDE )

           " GET_LONGITUDE
  endmethod.


  method SET_NOME_ESTADIO.
***BUILD 090501
     " importing I_NOME_ESTADIO
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute NOME_ESTADIO
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_NOME_ESTADIO <> NOME_ESTADIO ).

    NOME_ESTADIO = I_NOME_ESTADIO.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_NOME_ESTADIO <> NOME_ESTADIO )

           " GET_NOME_ESTADIO
  endmethod.


  method SET_UF.
***BUILD 090501
     " importing I_UF
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute UF
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : The object state is loaded, attribute is set
*
* OO Exceptions  : CX_OS_OBJECT_NOT_FOUND
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 2000-03-14   : (BGR) Version 2.0
* - 2000-07-28   : (SB)  OO Exceptions
* - 2000-10-04   : (SB)  Namespaces
************************************************************************

* * Inform class agent and handle exceptions
  state_write_access.

  if ( I_UF <> UF ).

    UF = I_UF.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_UF <> UF )

           " GET_UF
  endmethod.
ENDCLASS.
