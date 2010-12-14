<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="layout" content="main"/>
  <title><g:message code="default.list.label"/></title>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
  <span class="menuButton"><g:link class="create" action="createMtDbInfo"><g:message code="default.new.label"/></g:link></span>
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
        <g:sortableColumn property="id" title="${message(code: 'databaseInfo.id.label', default: 'Id')}"/>
        <g:sortableColumn property="name" title="${message(code: 'databaseInfo.name.label', default: 'Name')}"/>
        <g:sortableColumn property="databaseSchema" title="${message(code: 'databaseInfo.databaseSchema.label', default: 'Database Schema')}"/>
        <g:sortableColumn property="databaseType" title="${message(code: 'databaseInfo.databaseType.label', default: 'Database Type')}"/>
        <g:sortableColumn property="environment" title="${message(code: 'databaseInfo.environment.label', default: 'Database Environment Type')}"/>
        <g:sortableColumn property="hostName" title="${message(code: 'databaseInfo.hostName.label', default: 'Host Name')}"/>
        <g:sortableColumn property="databasePort" title="${message(code: 'databaseInfo.databasePort.label', default: 'Database Port')}"/>
      </tr>
      </thead>
      <tbody>
      <g:each in="${dbInfoList}" status="i" var="dbInfoInstance">
        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
          <td><g:link action="editMtDbInfo" id="${databaseInfoInstance.id}">${fieldValue(bean: dbInfoInstance, field: "id")}</g:link></td>
          <td>${fieldValue(bean: dbInfoInstance, field: "name")}</td>
          <td>${fieldValue(bean: dbInfoInstance, field: "databaseSchema")}</td>
          <td>${fieldValue(bean: dbInfoInstance, field: "databaseType")}</td>
          <td>${fieldValue(bean: dbInfoInstance, field: "environment")}</td>
          <td>${fieldValue(bean: dbInfoInstance, field: "hostName")}</td>
          <td>${fieldValue(bean: dbInfoInstance, field: "databasePort")}</td>
        </tr>
      </g:each>
      </tbody>
    </table>
  </div>
  <div class="paginateButtons">
    <g:paginate total="${dbInfoTotal}"/>
  </div>
</div>
</body>
</html>
