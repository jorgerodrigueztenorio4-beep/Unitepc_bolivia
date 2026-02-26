
Imports System.Data
Imports CrystalDecisions.Shared

Partial Class DES_ACADEMICO_horarios
    Inherits System.Web.UI.Page
    Dim ds As New ds_horarios_todo
    Public rptdocumento As New CrystalDecisions.CrystalReports.Engine.ReportDocument

    Private Sub DIR_CAR_horarios_virtuales_Load(sender As Object, e As EventArgs) Handles Me.Load
        'If Session("idus") <> "" Then

        '    lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
        '    'txt_cius.Text = Session("idus")
        '    txt_sede.Text = Session("sede")
        '    txt_sigla_car.Text = Session("siglacar")

        'Else
        '    Response.Redirect("~/sesion.aspx")
        'End If
    End Sub

    Protected Sub gv_horarios_v_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarios_v.SelectedIndexChanged

        'sql_ds_carrera.Delete()
        'sql_virtuales.Delete()


        'gv_horarios_v.DataBind()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_horarios_v.DataBind()
        If gv_horarios_v.Rows.Count > 0 Then
            Dim tw As New IO.StringWriter()
            Dim hw As New System.Web.UI.HtmlTextWriter(tw)
            Dim frm As HtmlForm = New HtmlForm()
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("content-disposition", "attachment;filename=" & "Horarios" & ".xls")
            Response.Charset = ""
            EnableViewState = False
            Controls.Add(frm)
            frm.Controls.Add(gv_horarios_v) 'GridView1 nombre del GridView suyo
            frm.RenderControl(hw)
            Response.Write(tw.ToString())
            Response.End()
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        rptdocumento.Dispose()
        rptdocumento.Close()
        Dim dv As New DataView
        Dim dt As DataTable

        ' Dim nom As String

        dv = Me.sql_virtuales.Select(DataSourceSelectArguments.Empty)
        dt = dv.ToTable
        Dim dat_ventas As DataTable = New ds_reporte_horas.DataTable1DataTable
        'nom = ddl_carrera.SelectedItem.Text
        ds.Clear()
        dat_ventas.Merge(dt)
        ds.Merge(dat_ventas)
        Dim srtreportpatch As String
        srtreportpatch = Server.MapPath("~/horarios_todo.rpt")
        If Not IO.File.Exists(srtreportpatch) Then Throw (New Exception("no se encuentra el archivo:" & vbCrLf & srtreportpatch))
        rptdocumento.Load(srtreportpatch)
        rptdocumento.SetDataSource(ds)
        rptdocumento.SetParameterValue("sede", ddl_sede.SelectedItem.Text)
        rptdocumento.SetParameterValue("gestion", ddl_gestion.SelectedValue.ToString)
        rptdocumento.SetParameterValue("carrera", ddl_carrera.SelectedItem.Text)
        'rptdocumento.SetParameterValue("nombre", nom)
        'rptdocumento.SetParameterValue("carrera", ddl_carrera.SelectedItem.Text)
        'rptdocumento.SetParameterValue("ajuste", txt_ajuste.Text)
        'rptdocumento.SetParameterValue("total_ajustes", txt_sumas2.Text)
        'rptdocumento.SetParameterValue("notificacion", Label1.Text)


        rptdocumento.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, ddl_carrera.SelectedItem.Text)
    End Sub
End Class
