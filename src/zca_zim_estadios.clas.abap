class ZCA_ZIM_ESTADIOS definition
  public
  inheriting from ZCB_ZIM_ESTADIOS
  final
  create private .

public section.

  class-data AGENT type ref to ZCA_ZIM_ESTADIOS read-only .

  class-methods CLASS_CONSTRUCTOR .
protected section.
private section.
ENDCLASS.



CLASS ZCA_ZIM_ESTADIOS IMPLEMENTATION.


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
      I_CLASS_NAME          = 'ZCL_ZIM_ESTADIOS'
      I_CLASS_AGENT_NAME    = 'ZCA_ZIM_ESTADIOS'
      I_CLASS_GUID          = '000C299270591EDAADFE547331616528'
      I_CLASS_AGENT_GUID    = '000C299270591EDAADFE547331636528'
      I_AGENT               = AGENT
      I_STORAGE_LOCATION    = ''
      I_CLASS_AGENT_VERSION = '2.0'.

           "CLASS_CONSTRUCTOR
  endmethod.
ENDCLASS.
