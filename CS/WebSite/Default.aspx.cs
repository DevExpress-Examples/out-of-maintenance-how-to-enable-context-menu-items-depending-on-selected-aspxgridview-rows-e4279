using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

public partial class _Default : System.Web.UI.Page {
    private DataTable table;

    protected void Page_Init(object sender, EventArgs e) {
        InitializeDataTable();
        gv.DataSource = GetDataTable();
        gv.DataBind();
    }

    private DataTable GetDataTable() {
        if(Session["DataTable"] == null) {
            InitializeDataTable();
            Session["DataTable"] = table;
        }
        table = (DataTable)Session["DataTable"];
        return table;
    }

    private void InitializeDataTable() {
        table = new DataTable("Table");
        DataColumn column;

        column = new DataColumn();
        column.DataType = typeof(Int32);
        column.ColumnName = "ID";
        table.Columns.Add(column);

        table.PrimaryKey = new DataColumn[] { column };

        column = new DataColumn();
        column.DataType = typeof(String);
        column.ColumnName = "Item";
        table.Columns.Add(column);

        PopulateDataTable();
    }

    private void PopulateDataTable() {
        DataRow row;
        for(int i = 0; i < 5; i++) {
            row = table.NewRow();
            row["ID"] = i;
            row["Item"] = "Item" + i;
            table.Rows.Add(row);
        }
    }
}