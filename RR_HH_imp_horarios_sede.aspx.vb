
Imports System.Data
Imports CrystalDecisions.Shared

Partial Class RR_HH_imp_horarios_sede
    Inherits System.Web.UI.Page
    Dim ds As New DS_HORARIO_DOCENTE
    Public rptdocumento As New CrystalDecisions.CrystalReports.Engine.ReportDocument

    Protected Sub btn_registrar_Click(sender As Object, e As EventArgs) Handles btn_registrar.Click
        Dim dv As New DataView
        Dim dt As DataTable

        Dim nom As String

        dv = Me.sql_ds_horario.Select(DataSourceSelectArguments.Empty)
        dt = dv.ToTable
        Dim dat_ventas As DataTable = New DS_HORARIO_DOCENTE.DataTable1DataTable
        nom = ddl_docente.SelectedItem.Text
        ds.Clear()
        dat_ventas.Merge(dt)
        ds.Merge(dat_ventas)
        Dim srtreportpatch As String
        srtreportpatch = Server.MapPath("~/HORARIO_DOCENTE.rpt")
        If Not IO.File.Exists(srtreportpatch) Then Throw (New Exception("no se encuentra el archivo:" & vbCrLf & srtreportpatch))
        rptdocumento.Load(srtreportpatch)
        rptdocumento.SetDataSource(ds)
        'rptdocumento.SetParameterValue("fechaini", txt_fini.Text)
        'rptdocumento.SetParameterValue("fechafin", txt_ffin.Text)
        'rptdocumento.SetParameterValue("horasgral", txt_sumas.Text)
        'rptdocumento.SetParameterValue("nombre", nom)
        'rptdocumento.SetParameterValue("carrera", ddl_carrera.SelectedItem.Text)
        'rptdocumento.SetParameterValue("ajuste", txt_ajuste.Text)
        'rptdocumento.SetParameterValue("total_ajustes", txt_sumas2.Text)
        'rptdocumento.SetParameterValue("notificacion", Label1.Text)


        rptdocumento.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, ddl_docente.SelectedItem.Text)
    End Sub

    Private Sub RR_HH_imp_horarios_Unload(sender As Object, e As EventArgs) Handles Me.Unload
        Me.rptdocumento.Close()
        Me.rptdocumento.Dispose()


        rptdocumento.Dispose()
        rptdocumento.Close()
    End Sub
End Class
