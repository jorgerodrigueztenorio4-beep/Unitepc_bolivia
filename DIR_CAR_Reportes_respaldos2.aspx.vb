Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data
Imports System.Web.UI.WebControls
Imports System
Imports CrystalDecisions.Shared

Partial Class DIR_CAR_Reportes_respaldos2
    Inherits System.Web.UI.Page
    Dim ds As New ds_reporte_horas
    Public rptdocumento As New CrystalDecisions.CrystalReports.Engine.ReportDocument
    Public suma As Double = 0
    Public suma2 As Double = 0

    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            suma = suma + e.Row.Cells(7).Text
            suma2 = suma2 + e.Row.Cells(11).Text
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(6).Text = "Total General"
            e.Row.Cells(7).Text = Math.Round((suma / 45))
            txt_sumas.Text = e.Row.Cells(7).Text

            e.Row.Cells(6).BackColor = Drawing.Color.LightBlue
            e.Row.Cells(7).BackColor = Drawing.Color.Yellow


            e.Row.Cells(10).Text = "Total General2"
            e.Row.Cells(11).Text = Math.Round((suma2))


        End If
    End Sub

    Private Sub Reportes_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            txt_sede.Text = Session("sede")
            txt_siglacar.Text = Session("siglacar")
            'txt_ciusuario.Text = Session("idus")
            'txt_id_sede.Text = Session("sede")

        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

        Dim dv As New DataView
        Dim dt As DataTable
        'Dim nom, car As String
        'nom = ddl_docente.SelectedItem.Text
        'car = GridView2.Rows(0).Cells(1).ToString

        dv = Me.sql_ds_horas.Select(DataSourceSelectArguments.Empty)
        dt = dv.ToTable
        Dim dat_ventas As DataTable = New ds_reporte_horas.DataTable1DataTable




        ds.Clear()
        dat_ventas.Merge(dt)
        ds.Merge(dat_ventas)
        Dim srtreportpatch As String
        srtreportpatch = Server.MapPath("~/reporte_respaldos.rpt")
        If Not IO.File.Exists(srtreportpatch) Then Throw (New Exception("no se encuentra el archivo:" & vbCrLf & srtreportpatch))

        rptdocumento.Load(srtreportpatch)
        rptdocumento.SetDataSource(ds)
        rptdocumento.SetParameterValue("fechaini", txt_fini.Text)
        rptdocumento.SetParameterValue("fechafin", txt_ffin.Text)
        rptdocumento.SetParameterValue("horasgral", txt_sumas.Text)
        rptdocumento.SetParameterValue("nombre", ddl_docente.SelectedItem.Text)
        rptdocumento.SetParameterValue("carrera", txt_siglacar.Text) 'tipo_respaldo
        rptdocumento.SetParameterValue("tipo_respaldo", "Clases")


        rptdocumento.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, ddl_docente.SelectedItem.Text)

        'Me.CrystalReportViewer1.ReportSource = rptdocumento
        'Me.CrystalReportViewer1.Visible = True
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    'Protected Sub ddl_carrera_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_carrera.SelectedIndexChanged
    '    ddl_docente.DataBind()

    'End Sub
End Class
