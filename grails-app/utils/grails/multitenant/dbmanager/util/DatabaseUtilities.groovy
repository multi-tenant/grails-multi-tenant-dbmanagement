package grails.multitenant.dbmanager.util

import grails.multitenant.dbmanager.domain.MtDbInfo
import liquibase.database.Database
import liquibase.jvm.integration.commandline.CommandLineUtils
/**
 *
 * This class supports database operations for the MT Db Manager plugin
 */
class DatabaseUtilities
{
  static Database getDatabase(MtDbInfo inDatabaseInfo)
  {
    def driver = "com.mysql.jdbc.Driver"
    ClassLoader cl = DatabaseUtilities.getClassLoader()
    def url
    // If there is a url use it other wise build it from the other inputs
    if (inDatabaseInfo?.url?.size() > 0)
    {
      url = inDatabaseInfo.url
    }
    else
    {
      url = buildUrl(inDatabaseInfo)

    }
    Database database = CommandLineUtils.createDatabaseObject(cl, url, inDatabaseInfo?.userName, SecurityUtilities.decode(inDatabaseInfo?.passwordHash), driver, inDatabaseInfo?.databaseSchema, null);

    return database
  }
  /**
   * This will build the proper url for database access.
   */
  static String buildUrl(MtDbInfo inDatabaseInfo)
  {
    // TODO Complete this
    return ""
  }
}
