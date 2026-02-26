Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data
Imports System.Web.UI.WebControls
Imports System
Imports CrystalDecisions.Shared
Partial Class DAF_LOCAL_horario_x_dia
    Inherits System.Web.UI.Page
    Dim ds As New ds_horarios_por_dia
    Public rptdocumento As New CrystalDecisions.CrystalReports.Engine.ReportDocument
    Private Sub ADM_BLO_horario_x_dia_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            'lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
            txt_idsde.Text = Session("sede")



        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub

    Protected Sub btn_reporte_Click(sender As Object, e As EventArgs) Handles btn_reporte.Click

        If gv_horario.Rows.Count > 1 Then
            Dim dv As New DataView
            Dim dt As DataTable
            'Dim nom, car As String
            'nom = ddl_docente.SelectedItem.Text
            'car = GridView2.Rows(0).Cells(1).ToString

            dv = Me.sql_ds_horario.Select(DataSourceSelectArguments.Empty)
            dt = dv.ToTable
            Dim dat_ventas As DataTable = New ds_horarios_por_dia.DataTable1DataTable




            ds.Clear()
            dat_ventas.Merge(dt)
            ds.Merge(dat_ventas)
            Dim srtreportpatch As String
            srtreportpatch = Server.MapPath("~/horarios_por_dia.rpt")
            If Not IO.File.Exists(srtreportpatch) Then Throw (New Exception("no se encuentra el archivo:" & vbCrLf & srtreportpatch))

            rptdocumento.Load(srtreportpatch)
            rptdocumento.SetDataSource(ds)
            rptdocumento.SetParameterValue("Bloque", ddl_bloque.SelectedItem.Text)
            rptdocumento.SetParameterValue("dia", ddl_dia.SelectedValue.ToString)
            'rptdocumento.SetParameterValue("horasgral", txt_sumas.Text)
            'rptdocumento.SetParameterValue("nombre", nom)
            'rptdocumento.SetParameterValue("carrera", GridView2.Rows(0).Cells(0).Text)

            rptdocumento.ExportToHttpResponse(ExportFormatType.Excel, Response, True, "Horario")
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If gv_horario.Rows.Count > 1 Then
            Dim dv As New DataView
            Dim dt As DataTable
            'Dim nom, car As String
            'nom = ddl_docente.SelectedItem.Text
            'car = GridView2.Rows(0).Cells(1).ToString

            dv = Me.sql_ds_horario.Select(DataSourceSelectArguments.Empty)
            dt = dv.ToTable
            Dim dat_ventas As DataTable = New ds_horarios_por_dia.DataTable1DataTable




            ds.Clear()
            dat_ventas.Merge(dt)
            ds.Merge(dat_ventas)
            Dim srtreportpatch As String
            srtreportpatch = Server.MapPath("~/horarios_por_dia.rpt")
            If Not IO.File.Exists(srtreportpatch) Then Throw (New Exception("no se encuentra el archivo:" & vbCrLf & srtreportpatch))

            rptdocumento.Load(srtreportpatch)
            rptdocumento.SetDataSource(ds)
            rptdocumento.SetParameterValue("Bloque", ddl_bloque.SelectedItem.Text)
            rptdocumento.SetParameterValue("dia", ddl_dia.SelectedValue.ToString)
            'rptdocumento.SetParameterValue("horasgral", txt_sumas.Text)
            'rptdocumento.SetParameterValue("nombre", nom)
            'rptdocumento.SetParameterValue("carrera", GridView2.Rows(0).Cells(0).Text)

            rptdocumento.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, "Horario")
        End If



    End Sub
End Class
