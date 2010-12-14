// configuration for plugin testing - will not be included in the plugin zip
grails.plugins.dynamicController.mixins = [
        'grails.multitenant.dbmanager.controller.MtDbManagerControllerMixin': 'grails.multitenant.dbmanager.MtDbManagerController',
        'grails.multitenant.dbmanager.controller.MtDbDiffControllerMixin': 'grails.multitenant.dbmanager.MtDbManagerController',
        'grails.multitenant.dbmanager.controller.MtDbEnvironmentTypeControllerMixin': 'grails.multitenant.dbmanager.MtDbManagerController',
        'grails.multitenant.dbmanager.controller.MtDbInfoControllerMixin': 'grails.multitenant.dbmanager.MtDbManagerController',
        'grails.multitenant.dbmanager.controller.MtDbMigrationControllerMixin': 'grails.multitenant.dbmanager.MtDbManagerController',
        'grails.multitenant.dbmanager.controller.MtDbRollbackControllerMixin': 'grails.multitenant.dbmanager.MtDbManagerController'
]
mtDbManager {
  encryption {
    password = "SuperDuper"
  }
}
log4j = {
  // Example of changing the log pattern for the default console
  // appender:
  //
  //appenders {
  //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
  //}

  error 'org.codehaus.groovy.grails.web.servlet',  //  controllers
          'org.codehaus.groovy.grails.web.pages', //  GSP
          'org.codehaus.groovy.grails.web.sitemesh', //  layouts
          'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
          'org.codehaus.groovy.grails.web.mapping', // URL mapping
          'org.codehaus.groovy.grails.commons', // core / classloading
          'org.codehaus.groovy.grails.plugins', // plugins
          'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
          'org.springframework',
          'org.hibernate',
          'net.sf.ehcache.hibernate'

  warn 'org.mortbay.log'
}
