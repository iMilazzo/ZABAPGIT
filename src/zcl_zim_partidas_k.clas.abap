class ZCL_ZIM_PARTIDAS_K definition
  public
  create protected

  global friends ZCB_ZIM_PARTIDAS_K .

public section.

  interfaces IF_OS_STATE .

  methods GET_DATA
    returning
      value(RESULT) type TIMESTAMP
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_ID_ESTADIO
    returning
      value(RESULT) type ZIM_ID
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_ID_PARTIDA
    returning
      value(RESULT) type ZIM_ID
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_ID_RODADA
    returning
      value(RESULT) type ZIM_ID
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_MOEDA
    returning
      value(RESULT) type ZIM_CURR_KEY
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_PUBLICO
    returning
      value(RESULT) type ZIM_PUBLICO
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_RENDA
    returning
      value(RESULT) type ZIM_CURR16
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_DATA
    importing
      !I_DATA type TIMESTAMP
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_ID_ESTADIO
    importing
      !I_ID_ESTADIO type ZIM_ID
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_ID_RODADA
    importing
      !I_ID_RODADA type ZIM_ID
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_MOEDA
    importing
      !I_MOEDA type ZIM_CURR_KEY
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_PUBLICO
    importing
      !I_PUBLICO type ZIM_PUBLICO
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_RENDA
    importing
      !I_RENDA type ZIM_CURR16
    raising
      CX_OS_OBJECT_NOT_FOUND .
protected section.

  data ID_PARTIDA type ZIM_ID .
  data ID_RODADA type ZIM_ID .
  data DATA type TIMESTAMP .
  data ID_ESTADIO type ZIM_ID .
  data PUBLICO type ZIM_PUBLICO .
  data RENDA type ZIM_CURR16 .
  data MOEDA type ZIM_CURR_KEY .
private section.
ENDCLASS.



CLASS ZCL_ZIM_PARTIDAS_K IMPLEMENTATION.


  method GET_DATA.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute DATA
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

  result = DATA.

           " GET_DATA
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


  method GET_ID_PARTIDA.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute ID_PARTIDA
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

  result = ID_PARTIDA.

           " GET_ID_PARTIDA
  endmethod.


  method GET_ID_RODADA.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute ID_RODADA
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

  result = ID_RODADA.

           " GET_ID_RODADA
  endmethod.


  method GET_MOEDA.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute MOEDA
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

  result = MOEDA.

           " GET_MOEDA
  endmethod.


  method GET_PUBLICO.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute PUBLICO
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

  result = PUBLICO.

           " GET_PUBLICO
  endmethod.


  method GET_RENDA.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute RENDA
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

  result = RENDA.

           " GET_RENDA
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


  method SET_DATA.
***BUILD 090501
     " importing I_DATA
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute DATA
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

  if ( I_DATA <> DATA ).

    DATA = I_DATA.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_DATA <> DATA )

           " GET_DATA
  endmethod.


  method SET_ID_ESTADIO.
***BUILD 090501
     " importing I_ID_ESTADIO
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute ID_ESTADIO
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

  if ( I_ID_ESTADIO <> ID_ESTADIO ).

    ID_ESTADIO = I_ID_ESTADIO.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_ID_ESTADIO <> ID_ESTADIO )

           " GET_ID_ESTADIO
  endmethod.


  method SET_ID_RODADA.
***BUILD 090501
     " importing I_ID_RODADA
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute ID_RODADA
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

  if ( I_ID_RODADA <> ID_RODADA ).

    ID_RODADA = I_ID_RODADA.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_ID_RODADA <> ID_RODADA )

           " GET_ID_RODADA
  endmethod.


  method SET_MOEDA.
***BUILD 090501
     " importing I_MOEDA
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute MOEDA
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

  if ( I_MOEDA <> MOEDA ).

    MOEDA = I_MOEDA.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_MOEDA <> MOEDA )

           " GET_MOEDA
  endmethod.


  method SET_PUBLICO.
***BUILD 090501
     " importing I_PUBLICO
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute PUBLICO
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

  if ( I_PUBLICO <> PUBLICO ).

    PUBLICO = I_PUBLICO.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_PUBLICO <> PUBLICO )

           " GET_PUBLICO
  endmethod.


  method SET_RENDA.
***BUILD 090501
     " importing I_RENDA
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute RENDA
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

  if ( I_RENDA <> RENDA ).

    RENDA = I_RENDA.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_RENDA <> RENDA )

           " GET_RENDA
  endmethod.
ENDCLASS.
