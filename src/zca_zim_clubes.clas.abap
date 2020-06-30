class ZCA_ZIM_CLUBES definition
  public
  inheriting from ZCB_ZIM_CLUBES
  final
  create private .

public section.

  class-data AGENT type ref to ZCA_ZIM_CLUBES read-only .

  class-methods CLASS_CONSTRUCTOR .
protected section.
private section.
ENDCLASS.



CLASS ZCA_ZIM_CLUBES IMPLEMENTATION.


  method CLASS_CONSTRUCTOR.
***BUILD 090501
************************************************************************
* Purpose        : Initialize the 'class'.
*
* Version        : 2.0
*
* Precondition   : -
*
* Postcondition  : Singleton is created.
*
* OO Exceptions  : -
*
* Implementation : -
*
************************************************************************
* Changelog:
* - 1999-09-20   : (OS) Initial Version
* - 2000-03-06   : (BGR) 2.0 modified REGISTER_CLASS_AGENT
************************************************************************
* GENERATED: Do not modify
************************************************************************

  create object AGENT.

  call method AGENT->REGISTER_CLASS_AGENT
    exporting
      I_CLASS_NAME          = 'ZCL_ZIM_CLUBES'
      I_CLASS_AGENT_NAME    = 'ZCA_ZIM_CLUBES'
      I_CLASS_GUID          = '000C299270591EDAADFCD12FE1CFA528'
      I_CLASS_AGENT_GUID    = '000C299270591EDAADFCD12FE1D1A528'
      I_AGENT               = AGENT
      I_STORAGE_LOCATION    = ''
      I_CLASS_AGENT_VERSION = '2.0'.

           "CLASS_CONSTRUCTOR
  endmethod.
ENDCLASS.
