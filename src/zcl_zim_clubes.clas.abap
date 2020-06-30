class ZCL_ZIM_CLUBES definition
  public
  create protected

  global friends ZCB_ZIM_CLUBES .

public section.

  interfaces IF_OS_STATE .

  methods SET_NOME_TIME
    importing
      !I_NOME_TIME type ZIM_NOMETIME
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_NOME_TECNICO
    importing
      !I_NOME_TECNICO type ZIM_TECNICO
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_NOME_COMPLETO
    importing
      !I_NOME_COMPLETO type ZIM_NOMECOMPLETO
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_ID_ESTADIO
    importing
      !I_ID_ESTADIO type ZIM_ID
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_FUNDACAO
    importing
      !I_FUNDACAO type TIMESTAMP
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_FILENAME
    importing
      !I_FILENAME type ZIM_LOGOFILE
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods SET_DESCRICAO
    importing
      !I_DESCRICAO type CRM_EMAIL_VALUE
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
  methods SET_CONTENT
    importing
      !I_CONTENT type ZIM_CBLOB
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
  methods GET_NOME_TIME
    returning
      value(RESULT) type ZIM_NOMETIME
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_NOME_TECNICO
    returning
      value(RESULT) type ZIM_TECNICO
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_NOME_COMPLETO
    returning
      value(RESULT) type ZIM_NOMECOMPLETO
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_ID_ESTADIO
    returning
      value(RESULT) type ZIM_ID
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_ID_CLUBE
    returning
      value(RESULT) type ZIM_ID
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_FUNDACAO
    returning
      value(RESULT) type TIMESTAMP
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_FILENAME
    returning
      value(RESULT) type ZIM_LOGOFILE
    raising
      CX_OS_OBJECT_NOT_FOUND .
  methods GET_DESCRICAO
    returning
      value(RESULT) type CRM_EMAIL_VALUE
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
  methods GET_CONTENT
    returning
      value(RESULT) type ZIM_CBLOB
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
protected section.

  data ID_CLUBE type ZIM_ID .
  data ID_ESTADIO type ZIM_ID .
  data NOME_TIME type ZIM_NOMETIME .
  data NOME_COMPLETO type ZIM_NOMECOMPLETO .
  data FUNDACAO type TIMESTAMP .
  data NOME_TECNICO type ZIM_TECNICO .
  data CREATED_AT type TIMESTAMP .
  data CREATED_BY type UNAME .
  data CHANGED_AT type TIMESTAMP .
  data CHANGED_BY type UNAME .
  data DESCRICAO type CRM_EMAIL_VALUE .
  data FILENAME type ZIM_LOGOFILE .
  data CONTENT type ZIM_CBLOB .
private section.
ENDCLASS.



CLASS ZCL_ZIM_CLUBES IMPLEMENTATION.


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


  method GET_CONTENT.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute CONTENT
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

  result = CONTENT.

           " GET_CONTENT
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


  method GET_DESCRICAO.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute DESCRICAO
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

  result = DESCRICAO.

           " GET_DESCRICAO
  endmethod.


  method GET_FILENAME.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute FILENAME
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

  result = FILENAME.

           " GET_FILENAME
  endmethod.


  method GET_FUNDACAO.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute FUNDACAO
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

  result = FUNDACAO.

           " GET_FUNDACAO
  endmethod.


  method GET_ID_CLUBE.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute ID_CLUBE
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

  result = ID_CLUBE.

           " GET_ID_CLUBE
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


  method GET_NOME_COMPLETO.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute NOME_COMPLETO
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

  result = NOME_COMPLETO.

           " GET_NOME_COMPLETO
  endmethod.


  method GET_NOME_TECNICO.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute NOME_TECNICO
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

  result = NOME_TECNICO.

           " GET_NOME_TECNICO
  endmethod.


  method GET_NOME_TIME.
***BUILD 090501
     " returning RESULT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Get Attribute NOME_TIME
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

  result = NOME_TIME.

           " GET_NOME_TIME
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


  method SET_CONTENT.
***BUILD 090501
     " importing I_CONTENT
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute CONTENT
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

  if ( I_CONTENT <> CONTENT ).

    CONTENT = I_CONTENT.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_CONTENT <> CONTENT )

           " GET_CONTENT
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


  method SET_DESCRICAO.
***BUILD 090501
     " importing I_DESCRICAO
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute DESCRICAO
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

  if ( I_DESCRICAO <> DESCRICAO ).

    DESCRICAO = I_DESCRICAO.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_DESCRICAO <> DESCRICAO )

           " GET_DESCRICAO
  endmethod.


  method SET_FILENAME.
***BUILD 090501
     " importing I_FILENAME
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute FILENAME
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

  if ( I_FILENAME <> FILENAME ).

    FILENAME = I_FILENAME.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_FILENAME <> FILENAME )

           " GET_FILENAME
  endmethod.


  method SET_FUNDACAO.
***BUILD 090501
     " importing I_FUNDACAO
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute FUNDACAO
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

  if ( I_FUNDACAO <> FUNDACAO ).

    FUNDACAO = I_FUNDACAO.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_FUNDACAO <> FUNDACAO )

           " GET_FUNDACAO
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


  method SET_NOME_COMPLETO.
***BUILD 090501
     " importing I_NOME_COMPLETO
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute NOME_COMPLETO
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

  if ( I_NOME_COMPLETO <> NOME_COMPLETO ).

    NOME_COMPLETO = I_NOME_COMPLETO.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_NOME_COMPLETO <> NOME_COMPLETO )

           " GET_NOME_COMPLETO
  endmethod.


  method SET_NOME_TECNICO.
***BUILD 090501
     " importing I_NOME_TECNICO
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute NOME_TECNICO
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

  if ( I_NOME_TECNICO <> NOME_TECNICO ).

    NOME_TECNICO = I_NOME_TECNICO.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_NOME_TECNICO <> NOME_TECNICO )

           " GET_NOME_TECNICO
  endmethod.


  method SET_NOME_TIME.
***BUILD 090501
     " importing I_NOME_TIME
     " raising CX_OS_OBJECT_NOT_FOUND
************************************************************************
* Purpose        : Set attribute NOME_TIME
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

  if ( I_NOME_TIME <> NOME_TIME ).

    NOME_TIME = I_NOME_TIME.

*   * Inform class agent and handle exceptions
    state_changed.

  endif. "( I_NOME_TIME <> NOME_TIME )

           " GET_NOME_TIME
  endmethod.
ENDCLASS.
