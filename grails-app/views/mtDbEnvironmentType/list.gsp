<<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="default.list.label"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="create" action="createMtDbEnvironmentType"><g:message code="default.new.label"/></g:link></span>
</div>
<div class="body">
  <h1><g:message code="default.list.label" args="[entityName]"/></h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div class="list">
    <table>
      <thead>
      <tr>
        <g:sortableColumn property="id" title="${message(code: 'databaseEnvironment.id.label', default: 'Id')}"/>
        <g:sortableColumn property="name" title="${message(code: 'databaseEnvironment.name.label', default: 'Name')}"/>
      </tr>
      </thead>
      <tbody>
      <g:each in="${dbEnvironmentTypeList}" status="i" var="dbEnvironmentInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
          <td><g:link action="editMtDbEnvironmentType" id="${dbEnvironmentInstance.id}">${fieldValue(bean: dbEnvironmentInstance, field: "id")}</g:link></td>
          <td>${fieldValue(bean: dbEnvironmentInstance, field: "name")}</td>
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${dbEnvironmentTypeTotal}"/>
  </div>
</div>
</body>
</html>
