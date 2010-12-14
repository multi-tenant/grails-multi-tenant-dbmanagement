package grails.multitenant.dbmanager.util

import org.codehaus.groovy.grails.commons.ConfigurationHolder

/**
 *
 * This class provides some helper file methods.
 */
class FileUtilities
{
  /**
   * This will return a list of file names for all the data change log files.
   * @return A list of file names for data change logs.
   */
  static List getDataChangeLogFileNames()
  {
    def fileNames = []
    def p = ~/.*\.xml/
    def dirName = ConfigurationHolder.config.liquibase.dataChangeLogDir
    def directory = new File(dirName)
    directory.eachFileMatch(p)
            {file ->
              fileNames.add(file.name)
            }
    return fileNames
  }
  /**
   * This will return a list of file names for all the model change log files.
   * @return A list of data change log file names
   */
  static List getModelChangeLogFileNames()
  {
    def fileNames = []
    def p = ~/.*\.xml/
    def dirName = ConfigurationHolder.config.liquibase.modelChangeLogDir
    def directory = new File(dirName)
    directory.eachFileMatch(p)
            {file ->
              fileNames.add(file?.name)
            }
    return fileNames
  }
  /**
   * This will return the directory of  the data change log files.
   * @return The directory for data change logs.
   */
  static String getDataChangeLogDirectory()
  {
    def dirName = ConfigurationHolder.config.liquibase.dataChangeLogDir
    return dirName
  }
  /**
   * This will return the directory of  the model change log files.
   * @return The directory for model change logs.
   */
  static String getModelChangeLogDirectory()
  {
    def dirName = ConfigurationHolder.config.liquibase.modelChangeLogDir
    return dirName
  }
}
