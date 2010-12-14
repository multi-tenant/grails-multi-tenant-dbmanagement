<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="default.edit.label"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="list" action="listMtDbEnvironmentType"><g:message code="default.list.label"/></g:link></span>
  <span class="menuButton"><g:link class="create" action="createMtDbEnvironmentType"><g:message code="default.new.label"/></g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.edit.label"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:hasErrors bean="${dbEnvironmentType}">
    <div class="errors">
      <g:renderErrors bean="${dbEnvironmentType}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form method="post">
    <g:hiddenField name="id" value="${dbEnvironmentType?.id}"/>
    <g:hiddenField name="version" value="${dbEnvironmentType?.version}"/>
    <div class="dialog">
      <table>
        <tbody>

        <tr class="prop">
          <td valign="top" class="name">
            <label for="name"><g:message code="dbEnvironmentType.name.label" default="Name"/></label>
          </td>
          <td valign="top" class="value ${hasErrors(bean: dbEnvironmentType, field: 'name', 'errors')}">
            <g:textField name="name" cols="40" rows="5" value="${dbEnvironmentType?.name}"/>
          </td>
        </tr>
        </tbody>
      </table>
    </div>
    <div class="buttons">
      <span class="button"><g:actionSubmit class="save" action="updateMtDbEnvironmentType" value="${message(code: 'default.button.update.label', default: 'Update')}"/></span>
    </div>
  </g:form>
</div>
</body>
</html>
