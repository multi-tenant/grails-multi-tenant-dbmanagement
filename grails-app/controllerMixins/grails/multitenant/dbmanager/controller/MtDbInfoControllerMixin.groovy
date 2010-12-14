package grails.multitenant.dbmanager.controller

import grails.multitenant.dbmanager.domain.MtDbInfo
import grails.multitenant.dbmanager.util.SecurityUtilities
/**
 * This class will manage the interaction with the database information objects like creating, listing, etc.
 */
class MtDbInfoControllerMixin
{
  /**
   * This will produce a pageable list of Mt Database info objects.
   * @return view /mtDbInfo/list
   */
  def listMtDbInfo =
  {
    params.max = Math.min(params.max ? params.int('max') : 10, 100)
    render(view: '/mtDbInfo/list', model: [dbInfoList: MtDbInfo.list(params), dbInfoTotal: MtDbInfo.count()])
  }
  def createMtDbInfo = {
    def dbInfo = new MtDbInfo()

    render(view: '/mtDbInfo/create', model: [dbInfo: dbInfo])
  }

  def saveMtDbInfo =
  {
    def dbInfo = new MtDbInfo(params)
    dbInfo.passwordHash = grails.multitenant.dbmanager.util.SecurityUtilities.encode(dbInfo.password)
    if (dbInfo.save(flush: true))
    {
      flash.message = "${message(code: 'default.created.message', args: [message(code: 'databaseInfo.label', default: 'DatabaseInfo'), dbInfo.id])}"
      redirect(action: "listDbInfo")
    }
    else
    {
      render(view: "/mtDbInfo/create", model: [dbInfo: dbInfo])
    }
  }
  def editMtDbInfo = {
    def databaseInfoInstance = MtDbInfo.get(params.id)
    if (!databaseInfoInstance)
    {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'databaseInfo.label', default: 'DatabaseInfo'), params.id])}"
      redirect(action: "listDbInfo")
    }
    else
    {
      // decode the password
      databaseInfoInstance.password = SecurityUtilities.decode(databaseInfoInstance.passwordHash)
      render(view: '/mtDbInfo/edit', model: [databaseInfoInstance: databaseInfoInstance])
    }
  }

  def updateMtDbInfo =
  {
    def databaseInfoInstance = MtDbInfo.get(params.id)
    if (databaseInfoInstance)
    {
      if (params.version)
      {
        def version = params.version.toLong()
        if (databaseInfoInstance.version > version)
        {

          databaseInfoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'databaseInfo.label', default: 'DatabaseInfo')] as Object[], "Another user has updated this DatabaseInfo while you were editing")
          render(view: "/mtDbInfo/edit", model: [databaseInfoInstance: databaseInfoInstance])
          return
        }
      }
      databaseInfoInstance.properties = params
      // encode the password
      databaseInfoInstance.passwordHash = SecurityUtilities.encode(databaseInfoInstance.password)
      if (!databaseInfoInstance.hasErrors() && databaseInfoInstance.save(flush: true))
      {
        flash.message = "${message(code: 'default.updated.message', args: [message(code: 'databaseInfo.label', default: 'DatabaseInfo'), databaseInfoInstance.id])}"
        redirect(action: "/mtDbInfo/edit", id: databaseInfoInstance.id)
      }
      else
      {
        render(view: "/mtDbInfo/edit", model: [databaseInfoInstance: databaseInfoInstance])
      }
    }
    else
    {
      flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'databaseInfo.label', default: 'DatabaseInfo'), params.id])}"
      redirect(action: "listDbInfo")
    }
  }
}
