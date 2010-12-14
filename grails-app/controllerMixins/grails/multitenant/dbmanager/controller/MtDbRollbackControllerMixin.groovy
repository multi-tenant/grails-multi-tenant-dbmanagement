package grails.multitenant.dbmanager.controller

import grails.multitenant.dbmanager.util.DatabaseUtilities
import liquibase.database.Database
import grails.multitenant.dbmanager.domain.MtDbInfo
import liquibase.Liquibase
import liquibase.resource.FileSystemResourceAccessor
/**
 *
 * This will support liquibase rollback operations.
 */
class MtDbRollbackControllerMixin
{
  def defaultAction = "prepRollback"
  def prepRollback =
  {
    render(view: "/MtDbRollback/rollback")
  }
  def rollback =
  {
    def rollbackCount
    // TODO Handle the All selection
    // Get the change log path
    def changeLogFile = params.changeLogFile
    // Get the Database info
    MtDbInfo databaseInfo = MtDbInfo.get(params.database)
    if (params.rollbackCount.size() > 0)
    {
      rollbackCount = Integer.valueOf(params.rollbackCount)
    }
    if (databaseInfo == null || rollbackCount == null || changeLogFile?.size() == 0)
    {
      flash.error = "Please select a database, change Log File and rollback count."
      render(view: "/mtDbRollback/rollback", model: [databaseInfo: databaseInfo, rollbackCount: rollbackCount, changeLogFile: changeLogFile])
      return
    }
    Database database = DatabaseUtilities.getDatabase(databaseInfo)
    def resourceAccessor = new FileSystemResourceAccessor()
    Liquibase liquibase = new Liquibase(changeLogFile, resourceAccessor, database)
    StringWriter writer = new StringWriter()
    liquibase.rollback(rollbackCount, null, writer)
    flash.message = "Rollback has been processed"
    render(view: "/mtDbRollback/rollback", model: [databaseInfo: databaseInfo, rollbackCount: rollbackCount, changeLogFile: changeLogFile, results: writer.toString()])
  }
}
