<html>
<head>
    <title><g:message code="updateData.heading"/></title>
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
<h2><g:message code="updateData.heading"/></h2>
<div>&nbsp;</div>
<g:form>
    <table>
        <tr>
            <td><g:message code="update.database.label"/>&nbsp;<g:select name="database" optionKey="id" optionValue="name" value="${databaseInfo?.id}" from="${com.triplecreekassociates.dbmanager.domain.DatabaseInfo.list()}" noSelection="['':'-Choose a Database-']"/></td>
        </tr>
        <tr><td><g:message code="update.database.changeLogs"/></td></tr>
        <g:each var="filename" in="${filenameList}">
            <tr>
                <td>
                    <g:checkBox name="filename" value="${filename}"/>${filename}
                </td>
            </tr>
        </g:each>
    </table>
    <div>&nbsp;</div>
    <div>
        <g:actionSubmit value="${message(code:'submit.button')}" action="updateData"/>
    </div>
    <div>&nbsp;</div>
    <div>${results}</div>
</g:form>
</body>
</html>