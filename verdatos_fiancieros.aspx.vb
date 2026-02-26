
Imports System.Data

Partial Class verdatos_fiancieros
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim ds As New DataSet
        Dim dt As New DataTable("tablafin")

        dt.Columns.Add("cip") '0
        dt.Columns.Add("cif") '1
        dt.Columns.Add("cta") '2
        'dt.Columns.Add("lastname") '3
        'dt.Columns.Add("email") '4
        'dt.Columns.Add("type1") '5
        'dt.Columns.Add("course1") '6
        'dt.Columns.Add("city") '7
        'dt.Columns.Add("profile_field_sedeuser") '8
        'dt.Columns.Add("profile_field_carrerauser") '9
        'dt.Columns.Add("course2") '10
        ds.Tables.Add(dt)


        For filas As Integer = 0 To gv_docente.Rows.Count - 1
            txt_ci.Text = gv_docente.Rows(filas).Cells(0).Text
            sql_ds_docente.Insert()


        Next
    End Sub
End Class
