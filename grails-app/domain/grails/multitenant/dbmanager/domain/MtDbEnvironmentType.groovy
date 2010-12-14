package grails.multitenant.dbmanager.domain
/**
 * This describes a specific environment type such as UAT, QA, etc.  It allows you to group databases together by
 * type and perform operations on them as a whole.
 */
class MtDbEnvironmentType
{
  static constraints =
  {
    name(nullable: false, blank: false, maxSize: 255)
  }
  /** This is the name of the type of database environment  */
  String name
}
