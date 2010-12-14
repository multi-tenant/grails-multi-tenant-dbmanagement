package grails.multitenant.dbmanager.controller

import liquibase.diff.Diff
import liquibase.diff.DiffResult
import liquibase.database.Database
import grails.multitenant.dbmanager.domain.MtDbInfo
import grails.multitenant.dbmanager.util.DatabaseUtilities
/**
 *
 * This provides the support for the diff operations.
 */
class MtDbDiffControllerMixin
{
  def defaultAction = "prepDiff"

  def prepDiff =
  {
    render(view: "/mtDbDiff/diff")
  }
  def diff =
  {
    // TODO Handle the All selection
    // Get the reference Database info
    MtDbInfo referenceDatabaseInfo = MtDbInfo.get(params.referenceDatabase)
    // Get the base Database info
    MtDbInfo sourceDatabaseInfo = MtDbInfo.get(params.sourceDatabase)
    if (sourceDatabaseInfo == null || referenceDatabaseInfo == null)
    {
      flash.error = "Please select a reference and source database."
      render(view: "/mtDbDiff/diff", model: [referenceDatabaseInfo: referenceDatabaseInfo, sourceDatabaseInfo: sourceDatabaseInfo])
      return
    }
    Database referenceDatabase = DatabaseUtilities.getDatabase(referenceDatabaseInfo)
    Database sourceDatabase = DatabaseUtilities.getDatabase(sourceDatabaseInfo)
    // create a diff
    Diff diff = new Diff(referenceDatabase, sourceDatabase)
    diff.setDiffData(true)
    // Run diff and present results
    DiffResult result = diff.compare()
    flash.message = "Difference results found"
    def output = new ByteArrayOutputStream()
    def printResult = new PrintStream(output)
    result.printResult(printResult)
    render(view: "/MtDbDiff/diff", model: [referenceDatabaseInfo: referenceDatabaseInfo, sourceDatabaseInfo: sourceDatabaseInfo, result: result, resultString: output.toString()])
  }

}
