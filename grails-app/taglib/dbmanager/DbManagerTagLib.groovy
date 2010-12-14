package dbmanager

import liquibase.diff.DiffResult
import liquibase.database.structure.Column

class DbManagerTagLib
{
    static namespace = 'dbm'
    def columnChange = {attrs, body ->
        DiffResult result = attrs.result
        if (result?.changedColumns?.size() == 0)
        {
            out << "NONE"
        }
        else
        {
            if (attrs?.forward == "true")
            {
                result.changedColumns.each {column ->
                    out << "     " + column
                    Column baseColumn = result.referenceSnapshot.getColumn(column.getTable().getName(), column.getName())
                    if (baseColumn != null)
                    {
                        if (baseColumn.isDataTypeDifferent(column))
                        {
                            out << " from " + baseColumn.getDataTypeString(result.referenceSnapshot.getDatabase()) + " to " + result.targetSnapshot.getColumn(column.getTable().getName(), column.getName()).getDataTypeString(result.targetSnapshot.getDatabase())
                        }
                        if (baseColumn.isNullabilityDifferent(column))
                        {
                            Boolean nowNullable = result.targetSnapshot.getColumn(column.getTable().getName(), column.getName()).isNullable()
                            if (nowNullable == null)
                            {
                                nowNullable = true
                            }
                            if (nowNullable)
                            {
                                out << " now nullable"
                            } else
                            {
                                out << " now not null"
                            }
                        }
                        if (baseColumn.isAutoIncrement())
                        {
                            out << "AutoIncrement is true"
                        }
                        else
                        {
                            out << " AutoIncrement is false"
                        }
                    }
                    out << "<br/>"
                }
            }
            else
            {
                result.changedColumns.each {column ->
                    out << "     " + column
                    Column baseColumn = result.targetSnapshot.getColumn(column.getTable().getName(), column.getName())
                    if (baseColumn != null)
                    {
                        if (baseColumn.isDataTypeDifferent(column))
                        {
                            out << " from " + baseColumn.getDataTypeString(result.targetSnapshot.getDatabase()) + " to " + result.referenceSnapshot.getColumn(column.getTable().getName(), column.getName()).getDataTypeString(result.referenceSnapshot.getDatabase())
                        }
                        if (baseColumn.isNullabilityDifferent(column))
                        {
                            Boolean nowNullable = result.referenceSnapshot.getColumn(column.getTable().getName(), column.getName()).isNullable()
                            if (nowNullable == null)
                            {
                                nowNullable = true
                            }
                            if (nowNullable)
                            {
                                out << " now nullable"
                            } else
                            {
                                out << " now not null"
                            }
                        }
                        if (baseColumn.isAutoIncrement())
                        {
                            out << "AutoIncrement is true"
                        }
                        else
                        {
                            out << " AutoIncrement is false"
                        }
                    }
                    out << "<br/>"
                }
            }
        }
    }
}