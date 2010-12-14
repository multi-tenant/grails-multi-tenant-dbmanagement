<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="default.create.label"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="listMtDbInfo"><g:message code="default.list.label"/></g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.create.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${dbInfo}">
    <div class="errors">
      <g:renderErrors bean="${dbInfo}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="saveMtDbInfo" method="post">
    <div class="dialog">
      <table>
        <tbody>
        <tr class="prop">
          <td valign="top" class="name">
            <label for="name"><g:message code="databaseInfo.name.label" default="Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: dbInfo, field: 'name', 'errors')}">
            <g:textField name="name" cols="40" rows="5" value="${dbInfo?.name}"/>
          </td>
        </tr>
        <tr class="prop">
          <td valign="top" class="name">
            <label for="databaseSchema"><g:message code="databaseInfo.databaseSchema.label" default="Database Schema"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: dbInfo, field: 'databaseSchema', 'errors')}">
            <g:textField name="databaseSchema" cols="40" rows="5" value="${dbInfo?.databaseSchema}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="databaseType"><g:message code="databaseInfo.databaseType.label" default="Database Type"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: dbInfo, field: 'databaseType', 'errors')}">
            <g:select name="databaseType" from="${grails.multitenant.dbmanager.reference.DatabaseTypeEnum?.values()}" value="${dbInfo?.databaseType}"/>
          </td>
        </tr>
        <tr class="prop">
          <td valign="top" class="name">
            <label for="environment"><g:message code="databaseInfo.environment.label" default="Database Environment Type"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: dbInfo, field: 'environment', 'errors')}">
            <g:select name="environment" from="${grails.multitenant.dbmanager.domain.MtDbEnvironmentType?.list()}" value="${dbInfo?.environment?.id}"/>
          </td>
        </tr>
        <tr class="prop">
          <td valign="top" class="name">
            <label for="hostName"><g:message code="databaseInfo.hostName.label" default="Host Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: dbInfo, field: 'hostName', 'errors')}">
            <g:textField name="hostName" cols="40" rows="5" value="${dbInfo?.hostName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="databasePort"><g:message code="databaseInfo.databasePort.label" default="Database Port"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: dbInfo, field: 'databasePort', 'errors')}">
            <g:textField name="databasePort" value="${fieldValue(bean: dbInfo, field: 'databasePort')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="url"><g:message code="databaseInfo.url.label" default="Url"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: dbInfo, field: 'url', 'errors')}">
            <g:textArea name="url" cols="40" rows="5" value="${dbInfo?.url}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="userName"><g:message code="databaseInfo.userName.label" default="User Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: dbInfo, field: 'userName', 'errors')}">
            <g:textField name="userName" cols="40" rows="5" value="${dbInfo?.userName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="password"><g:message code="databaseInfo.password.label" default="Password"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: dbInfo, field: 'password', 'errors')}">
            <g:passwordField name="password" cols="40" rows="5" value="${dbInfo?.password}"/>
          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
