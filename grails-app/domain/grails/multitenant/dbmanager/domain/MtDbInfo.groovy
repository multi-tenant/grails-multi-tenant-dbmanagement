package grails.multitenant.dbmanager.domain

import grails.multitenant.dbmanager.reference.DatabaseTypeEnum
/**
 * This object contains information about a specific database including the type, environment,
 * hostname, url , username and encrypted password for access by the tool.
 */
class MtDbInfo
{

  static constraints =
  {
    name(nullable: false, blank: false, maxSize: 255)
    databaseSchema(nullable: false, blank: false, maxSize: 255)
    databaseType(nullable: false)
    environment(nullable: false)
    hostName(nullable: false, blank: false, maxSize: 255)
    databasePort(nullable: false)
    url(nullable: true, blank: true, maxSize: 255)
    userName(nullable: false, blank: false, maxSize: 255)
    passwordHash(nullable: false, blank: false, maxSize: 255)
  }
  /** This is the logical name of the database              */
  String name
  /** The name of the schema or catalog           */
  String databaseSchema
  /** This is the type of database (i.e. MYSQL, ORACLE, etc)         */
  DatabaseTypeEnum databaseType
  /** The database environment type (i.e. Development , QA, UAT, etc.)        */
  MtDbEnvironmentType environment
  /** This is the hostname to the database              */
  String hostName
  /** this the connection url for the database.          */
  String url
  /** This is the port number to contact the database          */
  Integer databasePort
  /** This is the user id to connect as              */
  String userName
  /** This is the encrypted password to connect with              */
  String passwordHash
  static transients = ["password"]
  /** this is the unencrypted password       */
  String password
}
