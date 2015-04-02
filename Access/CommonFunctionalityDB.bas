'
'      CommonFunctionalityDB
'

option compare database
option explicit

function getRS(stmt as string) as dao.recordSet
    set getRS = dbEngine.workspaces(0).databases(0).openRecordset(stmt)
end function

sub executeSQL(stmt as string)
    call dbEngine.workspaces(0).databases(0).execute(stmt, dbFailOnError)
end sub

sub deleteTable(tableName as string)
    call executeSQL("delete from " & tableName)
end sub

sub dropTableIfExists(tablename as string)
    on error resume next
    executeSQL("drop table " & tablename)
end sub