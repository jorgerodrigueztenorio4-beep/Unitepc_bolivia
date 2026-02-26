
Imports System.Data

Partial Class DIR_ACD_pivot
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'sql_ds_horas.DataSourceMode = SqlDataSourceMode.DataSet
        'Dim dv As DataView = CType(sql_ds_horas.[Select](DataSourceSelectArguments.Empty), DataView)
        'Dim ds As DataSet = New DataSet()
        'Dim dt As DataTable = dv.Table
        'ds.Tables.Add(dt.Copy())
        'gv_pivot.DataSource = ds
        'gv_pivot.DataBind()

        GridView1.DataSource = sql_ds_horas
        GridView1.DataBind()
        If GridView1.Rows.Count > 0 Then


        End If


    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If GridView1.Rows.Count > 0 Then
            Dim tw As New IO.StringWriter()
            Dim hw As New System.Web.UI.HtmlTextWriter(tw)
            Dim frm As HtmlForm = New HtmlForm()
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("content-disposition", "attachment;filename=" & "Reporte" & ".xls")
            Response.Charset = ""
            EnableViewState = False
            Controls.Add(frm)
            frm.Controls.Add(GridView1) 'GridView1 nombre del GridView suyo
            frm.RenderControl(hw)
            Response.Write(tw.ToString())
            Response.End()
        End If
    End Sub

    Private Sub DIR_ACD_pivot_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
            ' txt_cius.Text = Session("idus")



        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
End Class
