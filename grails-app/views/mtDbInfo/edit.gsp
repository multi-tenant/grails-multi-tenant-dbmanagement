<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="default.edit.label"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="listDbInfo"><g:message code="default.list.label"/></g:link></span>
  <span class="menuButton"><g:link class="create" action="createMtDbInfo"><g:message code="default.new.label"/></g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.edit.label"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${databaseInfoInstance}">
    <div class="errors">
      <g:renderErrors bean="${databaseInfoInstance}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${databaseInfoInstance?.id}"/>
    <g:hiddenField name="version" value="${databaseInfoInstance?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="name"><g:message code="databaseInfo.name.label" default="Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: databaseInfoInstance, field: 'name', 'errors')}">
            <g:textField name="name" cols="40" rows="5" value="${databaseInfoInstance?.name}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="databaseSchema"><g:message code="databaseInfo.databaseSchema.label" default="Database Schema"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: databaseInfoInstance, field: 'databaseSchema', 'errors')}">
            <g:textField name="databaseSchema" cols="40" rows="5" value="${databaseInfoInstance?.databaseSchema}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="databaseType"><g:message code="databaseInfo.databaseType.label" default="Database Type"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: databaseInfoInstance, field: 'databaseType', 'errors')}">
            <g:select name="databaseType" from="${com.triplecreekassociates.dbmanager.reference.DatabaseTypeEnum?.values()}" value="${databaseInfoInstance?.databaseType}"/>
          </td>
        </tr>
        <tr class="prop">
          <td valign="top" class="name">
            <label for="environment"><g:message code="databaseInfo.environment.label" default="Database Environment Type"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: databaseInfoInstance, field: 'environment', 'errors')}">
            <g:select name="environment" from="${com.triplecreekassociates.dbmanager.reference.DatabaseEnvironmentTypeEnum?.values()}" value="${databaseInfoInstance?.environment}"/>
          </td>
        </tr>
        <tr class="prop">
          <td valign="top" class="name">
            <label for="hostName"><g:message code="databaseInfo.hostName.label" default="Host Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: databaseInfoInstance, field: 'hostName', 'errors')}">
            <g:textField name="hostName" cols="40" rows="5" value="${databaseInfoInstance?.hostName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="databasePort"><g:message code="databaseInfo.databasePort.label" default="Database Port"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: databaseInfoInstance, field: 'databasePort', 'errors')}">
            <g:textField name="databasePort" value="${fieldValue(bean: databaseInfoInstance, field: 'databasePort')}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="url"><g:message code="databaseInfo.url.label" default="Url"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: databaseInfoInstance, field: 'url', 'errors')}">
            <g:textArea name="url" cols="40" rows="5" value="${databaseInfoInstance?.url}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="userName"><g:message code="databaseInfo.userName.label" default="User Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: databaseInfoInstance, field: 'userName', 'errors')}">
            <g:textField name="userName" cols="40" rows="5" value="${databaseInfoInstance?.userName}"/>
          </td>
        </tr>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="password"><g:message code="databaseInfo.password.label" default="Password"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: databaseInfoInstance, field: 'password', 'errors')}">
            <g:passwordField name="password" cols="40" rows="5" value="${databaseInfoInstance?.password}"/>
          </td>
        </tr>

        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="updateMtDbInfo" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
