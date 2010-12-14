package grails.multitenant.dbmanager.controller

/**
 * This class is the entry point controller for the MtDbManager.
 */
class MtDbManagerControllerMixin
{
  /**
   * This is the main panel for entry into the Database Manager for Multiple Databases.
   */
  def manage =
  {
    render(view: '/mtDbManager/manage', model: [:])
  }

}
