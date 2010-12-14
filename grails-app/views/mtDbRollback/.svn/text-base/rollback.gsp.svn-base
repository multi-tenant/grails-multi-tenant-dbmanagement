<html>
<head>
    <title><g:message code="rollback.heading" default="Rollback"/></title>
    <meta name="layout" content="main"/>
</head>
<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
</div>
<div>
    <g:if test="${flash?.error}">
        <div class="message errors">
            ${flash?.error}
        </div>
    </g:if>
    <g:if test="${flash?.message}">
        <div class="message">
            ${flash?.message}
        </div>
    </g:if>
</div>
<h2><g:message code="rollback.heading"/></h2>
<div>&nbsp;</div>
<g:form>
    <table>
        <tr>
            <td><g:message code="rollback.database.label"/>&nbsp;<g:select name="database" optionKey="id" optionValue="name" value="${databaseInfo?.id}" from="${com.triplecreekassociates.dbmanager.domain.DatabaseInfo.list()}" noSelection="['':'-Choose a Database-']"/></td>
        </tr>
        <tr>
            <td><g:message code="rollback.count.label"/>&nbsp;<g:textField name="rollbackCount" value="${rollbackCount}"/></td>
        </tr>
        <tr>
            <td><g:message code="update.changeLogFile.label"/>&nbsp;<g:textField name="changeLogFile" value="${changeLogFile}"/></td>
        </tr>
    </table>
    <div>&nbsp;</div>
    <div>
        <g:actionSubmit value="${message(code:'submit.button')}" action="rollback"/>
    </div>
    <div>&nbsp;</div>
    <div>${results}</div>
</g:form>
</body>
</html>