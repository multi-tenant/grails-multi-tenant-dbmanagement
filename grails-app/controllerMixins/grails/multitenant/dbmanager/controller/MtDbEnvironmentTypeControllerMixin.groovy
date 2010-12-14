package grails.multitenant.dbmanager.controller

import grails.multitenant.dbmanager.domain.MtDbEnvironmentType
/**
 *
 * This class supports the management of environment types (i.e. UAT etc.)
 */
class MtDbEnvironmentTypeControllerMixin
{
  /**
   * This will produce a pageable list of Mt Environment type objects.
   * @return view /mtDbEnvironmentType/list
   */
  def listMtDbEnvironmentType =
  {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    render(view: '/mtDbEnvironmentType/list', model: [dbEnvironmentTypeList: MtDbEnvironmentType.list(params), dbEnvironmentTypeTotal: MtDbEnvironmentType.count()])
  }
  def createMtDbEnvironmentType =
  {
    def dbEnvironmentType = new MtDbEnvironmentType()
    render(view: '/mtDbEnvironmentType/create', model: [dbEnvironmentType: dbEnvironmentType])
  }

  def saveMtDbEnvironmentType =
  {
    def dbEnvironmentType = new MtDbEnvironmentType(params)
    if (dbEnvironmentType.save(flush: true))
    {
      flash.message = "${message(code: 'default.created.message')}"
      redirect(action: "listMtDbEnvironmentType")
    }
    else
    {
      render(view: "/mtDbEnvironmentType/create", model: [dbEnvironmentType: dbEnvironmentType])
    }
  }
  def editMtDbEnvironmentType = {
    def dbEnvironmentType = MtDbEnvironmentType.get(params.id)
    if (!dbEnvironmentType)
    {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'databaseInfo.label', default: 'DatabaseInfo'), params.id])}"
      redirect(action: "listMtDbEnvironmentType")
    }
    else
    {
      render(view: '/mtDbEnvironmentType/edit', model: [dbEnvironmentType: dbEnvironmentType])
    }
  }

  def updateMtDbEnvironmentType =
  {
    def dbEnvironmentType = MtDbEnvironmentType.get(params.id)
    if (dbEnvironmentType)
    {
      if (params.version)
      {
        def version = params.version.toLong()
        if (dbEnvironmentType.version > version)
        {

          dbEnvironmentType.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'databaseInfo.label', default: 'DatabaseInfo')] as Object[], "Another user has updated this DatabaseInfo while you were editing")
          render(view: "/mtDbEnvironmentType/edit", model: [dbEnvironmentType: dbEnvironmentType])
          return
        }
      }
      dbEnvironmentType.properties = params
      if (!dbEnvironmentType.hasErrors() && dbEnvironmentType.save(flush: true))
      {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'databaseInfo.label', default: 'DatabaseInfo'), dbEnvironmentType.id])}"
        redirect(action: "/mtDbEnvironmentType/edit", id: dbEnvironmentType.id)
      }
      else
      {
        render(view: "/mtDbEnvironmentType/edit", model: [dbEnvironmentType: dbEnvironmentType])
      }
    }
    else
    {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'databaseInfo.label', default: 'DatabaseInfo'), params.id])}"
      redirect(action: "listMtDbEnvironmentType")
    }
  }
}
