
Imports System.Data
Imports CrystalDecisions.Shared

Partial Class SEC_DIR_ACD_datos_docente2
    Inherits System.Web.UI.Page
    Dim dsp, dsf, dsa, dsc, dsh As New ds_datos_doc
    Public rptdocumento As New CrystalDecisions.CrystalReports.Engine.ReportDocument
    Private Sub DOCENTE_datos_docente_Load(sender As Object, e As EventArgs) Handles Me.Load
        'If Session("idus") <> "" Then

        '    lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
        '    txt_ci.Text = Session("idus")
        '    'gv_datos.DataBind()


        'Else
        '    Response.Redirect("~/sesion.aspx")
        'End If

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim dvp, dvf, dva, dvc, dvh As New DataView
        Dim dtp, dtf, dta, dtc, dth As DataTable

        'llenar personal
        dvp = Me.sql_ds_docente.Select(DataSourceSelectArguments.Empty)
        dtp = dvp.ToTable
        Dim dat_personal As DataTable = New ds_datos_doc.tb_personalDataTable
        dsp.Clear()
        dat_personal.Merge(dtp)
        dsp.Merge(dat_personal)
        'fin llenado personal

        'llenar financiero
        dvf = Me.sql_ds_financiero.Select(DataSourceSelectArguments.Empty)
        dtf = dvf.ToTable
        Dim dat_financiero As DataTable = New ds_datos_doc.tb_datos_financierosDataTable
        'dsp.Clear()
        dat_financiero.Merge(dtf)
        dsp.Merge(dat_financiero)
        'fin llenado financiero

        'llenar academico
        dva = Me.sql_ds_acadmeico.Select(DataSourceSelectArguments.Empty)
        dta = dva.ToTable
        Dim dat_academico As DataTable = New ds_datos_doc.tb_grado_academicoDataTable
        'dsp.Clear()
        dat_academico.Merge(dta)
        dsp.Merge(dat_academico)
        'fin llenado academico


        'llenar contratos
        dvc = Me.sql_ds_tipocontrato.Select(DataSourceSelectArguments.Empty)
        dtc = dvc.ToTable
        Dim dat_contrato As DataTable = New ds_datos_doc.tb_contratosDataTable
        'dsp.Clear()
        dat_contrato.Merge(dtc)
        dsp.Merge(dat_contrato)
        'fin llenado contratos

        'llenar herederos
        dvh = Me.sql_ds_herederos.Select(DataSourceSelectArguments.Empty)
        dth = dvh.ToTable
        Dim dat_herederos As DataTable = New ds_datos_doc.tb_herederosDataTable
        'dsp.Clear()
        dat_herederos.Merge(dth)
        dsp.Merge(dat_herederos)
        'fin llenado herederos

        Dim srtreportpatch As String
        srtreportpatch = Server.MapPath("~/datos_docente.rpt")
        If Not IO.File.Exists(srtreportpatch) Then Throw (New Exception("no se encuentra el archivo:" & vbCrLf & srtreportpatch))

        rptdocumento.Load(srtreportpatch)
        rptdocumento.SetDataSource(dsp)
        rptdocumento.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, txt_ci.Text)
    End Sub

    Protected Sub gv_buscar_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_buscar.SelectedIndexChanged
        txt_ci.Text = gv_buscar.SelectedRow.Cells(2).Text
    End Sub
End Class
