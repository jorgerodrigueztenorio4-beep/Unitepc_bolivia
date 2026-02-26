Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data
Imports System.Web.UI.WebControls
Imports System
Imports CrystalDecisions.Shared

Partial Class RR_HH_Reportes_respaldos2_1_todo
    Inherits System.Web.UI.Page
    Dim ds1 As New RR_HH_2_1
    Public rptdocumento As New CrystalDecisions.CrystalReports.Engine.ReportDocument
    Public suma As Double = 0
    Public suma2 As Double = 0
    Dim noti As String
    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            suma = suma + e.Row.Cells(8).Text
            suma2 = suma2 + e.Row.Cells(7).Text
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(9).Text = "Total Programado"
            e.Row.Cells(6).Text = "Total Ejecutado"
            e.Row.Cells(8).Text = suma
            e.Row.Cells(7).Text = suma2
            txt_hra_eje.Text = e.Row.Cells(7).Text

            txt_hra_eje.Text = suma2
            txt_hraprog.Text = suma


            e.Row.Cells(8).BackColor = Drawing.Color.LightBlue
            e.Row.Cells(9).BackColor = Drawing.Color.Yellow
            e.Row.Cells(7).BackColor = Drawing.Color.LightBlue
            e.Row.Cells(6).BackColor = Drawing.Color.Yellow

        End If

        'If e.Row.RowType = DataControlRowType.DataRow Then
        If e.Row.Cells(7).Text <> e.Row.Cells(8).Text Then
            e.Row.Cells(7).BackColor = Drawing.Color.Red
            e.Row.Cells(8).BackColor = Drawing.Color.Red

        End If

        ' End If
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
        gv_docentes.DataBind()
        If gv_docentes.Rows.Count > 0 Then


            For i = 0 To gv_docentes.Rows.Count - 1
                txt_ci_doc.Text = gv_docentes.Rows(i).Cells(1).Text

                rptdocumento.Dispose()
                rptdocumento.Close()
                Dim dv As New DataView
                Dim dt As DataTable

                Dim nom As String

                dv = Me.sql_ds_horas.Select(DataSourceSelectArguments.Empty)
                dt = dv.ToTable
                Dim dat_ventas As DataTable = New RR_HH_2_1.tb_ing_salDataTable
                nom = ddl_docente.SelectedItem.Text
                ds1.Clear()
                dat_ventas.Merge(dt)
                ds1.Merge(dat_ventas)
                Dim srtreportpatch As String
                srtreportpatch = Server.MapPath("~/RR_HH_2_1.rpt")
                If Not IO.File.Exists(srtreportpatch) Then Throw (New Exception("no se encuentra el archivo:" & vbCrLf & srtreportpatch))
                rptdocumento.Load(srtreportpatch)
                rptdocumento.SetDataSource(ds1)
                rptdocumento.SetParameterValue("fechaini", txt_fini.Text)
                rptdocumento.SetParameterValue("fechafin", txt_ffin.Text)
                rptdocumento.SetParameterValue("hra_eje", txt_hra_eje.Text)
                rptdocumento.SetParameterValue("nombre", txt_ci_doc.Text)
                rptdocumento.SetParameterValue("carrera", ddl_carrera.SelectedItem.Text)
                'rptdocumento.SetParameterValue("ajuste", txt_ajuste.Text)
                rptdocumento.SetParameterValue("hra_prog", txt_hraprog.Text)
                rptdocumento.SetParameterValue("notificacion", Label1.Text)

                'rptdocumento.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, txt_ci_doc.Text)
                If i < gv_docentes.Rows.Count Then
                    rptdocumento.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, txt_ci_doc.Text)
                End If

            Next

        End If




    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        ds1.Clear()
        gv_ajustes.DataBind()
        txt_ajuste.DataBind()
        If gv_ajustes.Rows.Count <= 0 Then
            txt_ajuste.Text = "0"

        ElseIf gv_ajustes.Rows.Count > 0 Then
            Dim ajus As Integer = 0
            For Fila As Integer = 0 To gv_ajustes.Rows.Count - 1

                ajus = ajus + gv_ajustes.Rows(Fila).Cells(6).Text

            Next

            txt_ajuste.Text = ajus


        End If



        'car = GridView2.Rows(0).Cells(1).ToString
        GridView1.DataBind()

        If GridView1.Rows.Count > 0 Then
            'txt_sumas2.Text = Convert.ToDecimal(txt_sumas.Text) + Convert.ToDecimal(txt_ajuste.Text)
            'Label1.Text = ""
        ElseIf GridView1.Rows.Count <= 0 Then
            'txt_sumas.Text = "0"
            'txt_sumas2.Text = Convert.ToDecimal(0) + Convert.ToDecimal(txt_ajuste.Text)

            noti = "No tiene Clases Marcados en el Sistema"
            Label1.Text = noti

        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub ddl_carrera_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_carrera.SelectedIndexChanged
        ddl_docente.DataBind()

    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        sql_ds_horas.Insert()
        gv_ajustes.DataBind()
    End Sub

    Private Sub RR_HH_Reportes_respaldos2_1_Unload(sender As Object, e As EventArgs) Handles Me.Unload
        rptdocumento.Close()
        rptdocumento.Dispose()

    End Sub
End Class
