<g:if test="${result}">
    <div>
        <table>
            <tr>
                <td>
                    <g:message code="diff.results.name.label"/>
                </td>
                <td>
                    <g:message code="diff.results.name.label"/>
                </td>
            </tr>
            <tr>
                <td>
                    ${result?.productName?.referenceVersion}
                </td>
                <td>
                    ${result?.productName?.baseVersion}
                </td>
            </tr>
            <tr>
                <td>
                    <g:message code="diff.results.version.label"/>
                </td>
                <td>
                    <g:message code="diff.results.version.label"/>
                </td>
            </tr>
            <tr>
                <td>
                    ${result?.productVersion?.referenceVersion}
                </td>
                <td>
                    ${result?.productVersion?.baseVersion}
                </td>
            </tr>
            <tr>
                <td>
                    <h2><g:message code="diff.results.label" args="[referenceDatabaseInfo?.name,sourceDatabaseInfo?.name]"/></h2>
                </td>
                <td>
                    <h2><g:message code="diff.results.label" args="[sourceDatabaseInfo?.name,referenceDatabaseInfo?.name]"/></h2>
                </td>
            </tr>
            <tr>
                <td>
                    <h3><g:message code="diff.results.tables.label"/></h3><br/>
                    <g:each in="${result?.missingTables}" var="table">
                        ${table}<br/>
                    </g:each>
                </td>
                <td>
                    <h3><g:message code="diff.results.tables.label"/></h3><br/>
                    <g:each in="${result?.unexpectedTables}" var="table">
                        ${table}<br/>
                    </g:each>
                </td>
            </tr>
            <tr>
                <td>
                    <h3><g:message code="diff.results.views.label"/></h3><br/>
                    <g:each in="${result?.missingViews}" var="view">
                        ${view}<br/>
                    </g:each>
                </td>
                <td>
                    <h3><g:message code="diff.results.views.label"/></h3><br/>
                    <g:each in="${result?.unexpectedViews}" var="view">
                        ${view}<br/>
                    </g:each>
                </td>
            </tr>
            <tr>
                <td>
                    <h3><g:message code="diff.results.changedViews.label"/></h3><br/>
                    <g:each in="${result?.changedViews}" var="view">
                        ${view}<br/>
                    </g:each>
                </td>
                <td>
                    <h3><g:message code="diff.results.changedViews.label"/></h3><br/>
                    <g:each in="${result?.changedViews}" var="view">
                        ${view}<br/>
                    </g:each>
                </td>
            </tr>
            <tr>
                <td>
                    <h3><g:message code="diff.results.columns.label"/></h3><br/>
                    <g:each in="${result?.missingColumns}" var="column">
                        ${column}<br/>
                    </g:each>
                </td>
                <td>
                    <h3><g:message code="diff.results.columns.label"/></h3><br/>
                    <g:each in="${result?.unexpectedColumns}" var="column">
                        ${column}<br/>
                    </g:each>
                </td>
            </tr>
            <tr>
                <td>
                    <h3><g:message code="diff.results.changedColumns.label"/></h3><br/>
                    <dbm:columnChange result="${result}" forward="false"/>
                </td>
                <td>
                    <h3><g:message code="diff.results.changedColumns.label"/></h3><br/>
                    <dbm:columnChange result="${result}" forward="true"/>
                </td>
            </tr>
            <tr>
                <td>
                    <h3><g:message code="diff.results.foreignKeys.label"/></h3><br/>
                    <g:each in="${result?.missingForeignKeys}" var="foreignKey">
                        ${foreignKey}<br/>
                    </g:each>
                </td>
                <td>
                    <h3><g:message code="diff.results.foreignKeys.label"/></h3><br/>
                    <g:each in="${result?.unexpectedForeignKeys}" var="foreignKey">
                        ${foreignKey}<br/>
                    </g:each>
                </td>
            </tr>
            <tr>
                <td>
                    <h3><g:message code="diff.results.indexes.label"/></h3><br/>
                    <g:each in="${result?.missingIndexes}" var="index">
                        ${index}<br/>
                    </g:each>
                </td>
                <td>
                    <h3><g:message code="diff.results.indexes.label"/></h3><br/>
                    <g:each in="${result?.unexpectedIndexes}" var="index">
                        ${index}<br/>
                    </g:each>
                </td>
            </tr>
            <tr>
                <td>
                    <h3><g:message code="diff.results.primaryKeys.label"/></h3><br/>
                    <g:each in="${result?.missingPrimaryKeys}" var="primaryKey">
                        ${primaryKey}<br/>
                    </g:each>
                </td>
                <td>
                    <h3><g:message code="diff.results.primaryKeys.label"/></h3><br/>
                    <g:each in="${result?.unexpectedPrimaryKeys}" var="primaryKey">
                        ${primaryKey}<br/>
                    </g:each>
                </td>
            </tr>
            <tr>
                <td>
                    <h3><g:message code="diff.results.uniqueConstraints.label"/></h3><br/>
                    <g:each in="${result?.missingUniqueConstraints}" var="uniqueConstraint">
                        ${uniqueConstraint}<br/>
                    </g:each>
                </td>
                <td>
                    <h3><g:message code="diff.results.uniqueConstraints.label"/></h3><br/>
                    <g:each in="${result?.unexpectedUniqueConstraints}" var="uniqueConstraint">
                        ${uniqueConstraint}<br/>
                    </g:each>
                </td>
            </tr>
            <tr>
                <td>
                    <h3><g:message code="diff.results.sequences.label"/></h3><br/>
                    <g:each in="${result?.missingSequences}" var="sequence">
                        ${sequence}<br/>
                    </g:each>
                </td>
                <td>
                    <h3><g:message code="diff.results.sequences.label"/></h3><br/>
                    <g:each in="${result?.unexpectedSequences}" var="sequence">
                        ${sequence}<br/>
                    </g:each>
                </td>
            </tr>
        </table>
        <div>
            ${resultString.encodeAsHTML()}
        </div>
    </div>
</g:if>