Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Linq

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private table As DataTable

	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		InitializeDataTable()
		gv.DataSource = GetDataTable()
		gv.DataBind()
	End Sub

	Private Function GetDataTable() As DataTable
		If Session("DataTable") Is Nothing Then
			InitializeDataTable()
			Session("DataTable") = table
		End If
		table = CType(Session("DataTable"), DataTable)
		Return table
	End Function

	Private Sub InitializeDataTable()
		table = New DataTable("Table")
		Dim column As DataColumn

		column = New DataColumn()
		column.DataType = GetType(Int32)
		column.ColumnName = "ID"
		table.Columns.Add(column)

		table.PrimaryKey = New DataColumn() { column }

		column = New DataColumn()
		column.DataType = GetType(String)
		column.ColumnName = "Item"
		table.Columns.Add(column)

		PopulateDataTable()
	End Sub

	Private Sub PopulateDataTable()
		Dim row As DataRow
		For i As Integer = 0 To 4
			row = table.NewRow()
			row("ID") = i
			row("Item") = "Item" & i
			table.Rows.Add(row)
		Next i
	End Sub
End Class