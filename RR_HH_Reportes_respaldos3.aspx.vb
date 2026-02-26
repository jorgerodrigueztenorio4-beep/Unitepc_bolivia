'Imports CrystalDecisions.CrystalReports.Engine
'Imports System.Data
'Imports System.Web.UI.WebControls
'Imports System
'Imports CrystalDecisions.Shared
'Imports System.IO.Compression
'Imports System.IO

'Partial Class RR_HH_Reportes_respaldos3

'    Inherits System.Web.UI.Page
'    Dim ds1 As New RR_HH_2_1
'    Public rptdocumento As New CrystalDecisions.CrystalReports.Engine.ReportDocument

'    Public suma As Double = 0
'    Public suma2 As Double = 0
'    Dim noti As String
'    Dim GridView1 As GridView


'    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
'        If e.Row.RowType = DataControlRowType.DataRow Then
'            suma = suma + e.Row.Cells(8).Text
'            suma2 = suma2 + e.Row.Cells(7).Text
'        ElseIf e.Row.RowType = DataControlRowType.Footer Then
'            e.Row.Cells(9).Text = "Total Programado"
'            e.Row.Cells(6).Text = "Total Ejecutado"
'            e.Row.Cells(8).Text = suma
'            e.Row.Cells(7).Text = suma2
'            txt_hra_eje.Text = e.Row.Cells(7).Text

'            txt_hra_eje.Text = suma2
'            txt_hraprog.Text = suma


'            e.Row.Cells(8).BackColor = Drawing.Color.LightBlue
'            e.Row.Cells(9).BackColor = Drawing.Color.Yellow
'            e.Row.Cells(7).BackColor = Drawing.Color.LightBlue
'            e.Row.Cells(6).BackColor = Drawing.Color.Yellow

'        End If

'        'If e.Row.RowType = DataControlRowType.DataRow Then
'        If e.Row.Cells(7).Text <> e.Row.Cells(8).Text Then
'            e.Row.Cells(7).BackColor = Drawing.Color.Red
'            e.Row.Cells(8).BackColor = Drawing.Color.Red

'        End If

'    End Sub

'    Private Sub Reportes_Load(sender As Object, e As EventArgs) Handles Me.Load
'        If Session("idus") <> "" Then

'            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
'            txt_sede.Text = Session("sede")
'            txt_siglacar.Text = Session("siglacar")
'            'txt_ciusuario.Text = Session("idus")
'            'txt_id_sede.Text = Session("sede")

'        Else
'            Response.Redirect("~/sesion.aspx")
'        End If
'    End Sub


'    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

'        Dim zipStream As New MemoryStream()

'        Using zip As New ZipArchive(zipStream, ZipArchiveMode.Create, True)

'            For i As Integer = 0 To gv_docentes.Rows.Count - 1

'                If ddl_carrera.SelectedValue.ToString = "FACEFA" Then

'                    GridView1.DataSource = sql_ds_horas

'                    GridView1.DataBind()
'                ElseIf ddl_carrera.SelectedValue.ToString = "INGENIERIAS" Then
'                    GridView1.DataSource = sql_ds_horas0
'                    GridView1.DataBind()
'                End If

'                Dim fila As GridViewRow = gv_docentes.Rows(i)

'                Dim ciDoc As String = fila.Cells(1).Text.Trim()        ' Ajusta el índice si el CI está en otra columna
'                Dim nombreDoc As String = fila.Cells(0).Text.Trim()    ' Nombre del docente

'                ' Obtener los datos desde el SqlDataSource con parámetros
'                Dim dv As New DataView
'                If ddl_carrera.SelectedValue = "FACEFA" Then
'                    sql_ds_horas.SelectParameters("ci").DefaultValue = ciDoc
'                    sql_ds_horas.SelectParameters("fini").DefaultValue = txt_fini.Text
'                    sql_ds_horas.SelectParameters("ffin").DefaultValue = txt_ffin.Text
'                    sql_ds_horas.SelectParameters("sede").DefaultValue = ddl_sede.SelectedValue.ToString

'                    dv = sql_ds_horas.Select(DataSourceSelectArguments.Empty)
'                ElseIf ddl_carrera.SelectedValue = "INGENIERIAS" Then
'                    sql_ds_horas0.SelectParameters("ci").DefaultValue = ciDoc
'                    sql_ds_horas0.SelectParameters("fini").DefaultValue = txt_fini.Text
'                    sql_ds_horas0.SelectParameters("ffin").DefaultValue = txt_ffin.Text
'                    sql_ds_horas0.SelectParameters("sede").DefaultValue = ddl_sede.SelectedValue.ToString
'                    dv = sql_ds_horas0.Select(DataSourceSelectArguments.Empty)
'                Else
'                    Continue For ' Si la carrera no aplica, pasa al siguiente docente
'                End If

'                Dim dt As DataTable = dv.ToTable()
'                If dt.Rows.Count = 0 Then Continue For

'                ' Cargar datos en el DataSet tipado
'                Dim ds1 As New RR_HH_2_1()
'                Dim tbIngSal As DataTable = New RR_HH_2_1.tb_ing_salDataTable()
'                tbIngSal.Merge(dt)
'                ds1.Merge(tbIngSal)

'                ' Generar el reporte Crystal
'                Dim rutaRpt As String = Server.MapPath("~/RR_HH_2_1.rpt")
'                Using rpt As New ReportDocument()
'                    rpt.Load(rutaRpt)
'                    rpt.SetDataSource(ds1)

'                    rpt.SetParameterValue("fechaini", txt_fini.Text)
'                    rpt.SetParameterValue("fechafin", txt_ffin.Text)
'                    rpt.SetParameterValue("hra_eje", txt_hra_eje.Text)
'                    rpt.SetParameterValue("nombre", nombreDoc)
'                    rpt.SetParameterValue("carrera", ddl_carrera.SelectedItem.Text)
'                    rpt.SetParameterValue("hra_prog", txt_hraprog.Text)
'                    rpt.SetParameterValue("notificacion", Label1.Text)

'                    ' Exportar a PDF en memoria
'                    Using pdfStream As Stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat)
'                        Dim entryName As String = String.Format("{0}_{1:yyyyMMddHHmmss}.pdf", nombreDoc, DateTime.Now)
'                        Dim entry As ZipArchiveEntry = zip.CreateEntry(entryName)

'                        Using entryStream As Stream = entry.Open()
'                            pdfStream.CopyTo(entryStream)
'                        End Using
'                    End Using
'                End Using
'            Next
'        End Using

'        ' Descargar el archivo ZIP
'        zipStream.Position = 0
'        Response.Clear()
'        Response.Buffer = True
'        Response.ContentType = "application/zip"
'        Response.AddHeader("Content-Disposition", "attachment; filename=Reportes_" & DateTime.Now.ToString("yyyyMMddHHmmss") & ".zip")
'        Response.BinaryWrite(zipStream.ToArray())
'        Response.End()
'    End Sub



'    'Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
'    '    For i As Integer = 0 To gv_docentes.Rows.Count - 1
'    '        Dim fila As GridViewRow = gv_docentes.Rows(i)
'    '        Dim ubicacion As String = fila.Cells(1).Text
'    '    Next

'    '    rptdocumento.Dispose()
'    '    rptdocumento.Close()
'    '    Dim dv As New DataView
'    '    Dim dt As DataTable

'    '    Dim nom As String
'    '    If ddl_carrera.SelectedValue.ToString = "FACEFA" Then

'    '        dv = Me.sql_ds_horas.Select(DataSourceSelectArguments.Empty)


'    '    ElseIf ddl_carrera.SelectedValue.ToString = "INGENIERIAS" Then
'    '        dv = Me.sql_ds_horas0.Select(DataSourceSelectArguments.Empty)
'    '    End If
'    '    'dv = Me.sql_ds_horas.Select(DataSourceSelectArguments.Empty)
'    '    dt = dv.ToTable
'    '    Dim dat_ventas As DataTable = New RR_HH_2_1.tb_ing_salDataTable
'    '    nom = ddl_docente.SelectedItem.Text
'    '    ds1.Clear()
'    '    dat_ventas.Merge(dt)
'    '    ds1.Merge(dat_ventas)
'    '    Dim srtreportpatch As String
'    '    srtreportpatch = Server.MapPath("~/RR_HH_2_1.rpt")
'    '    If Not IO.File.Exists(srtreportpatch) Then Throw (New Exception("no se encuentra el archivo:" & vbCrLf & srtreportpatch))
'    '    rptdocumento.Load(srtreportpatch)
'    '    rptdocumento.SetDataSource(ds1)
'    '    rptdocumento.SetParameterValue("fechaini", txt_fini.Text)
'    '    rptdocumento.SetParameterValue("fechafin", txt_ffin.Text)
'    '    rptdocumento.SetParameterValue("hra_eje", txt_hra_eje.Text)
'    '    rptdocumento.SetParameterValue("nombre", ddl_docente.SelectedItem.Text)
'    '    rptdocumento.SetParameterValue("carrera", ddl_carrera.SelectedItem.Text)
'    '    'rptdocumento.SetParameterValue("ajuste", txt_ajuste.Text)
'    '    rptdocumento.SetParameterValue("hra_prog", txt_hraprog.Text)
'    '    rptdocumento.SetParameterValue("notificacion", Label1.Text)
'    '    rptdocumento.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, ddl_docente.SelectedItem.Text)
'    'End Sub
'    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
'        'ds.Clear()
'        'gv_ajustes.DataBind()
'        'txt_ajuste.DataBind()
'        'If gv_ajustes.Rows.Count <= 0 Then
'        '    txt_ajuste.Text = "0"

'        'ElseIf gv_ajustes.Rows.Count > 0 Then
'        '    txt_ajuste.Text = gv_ajustes.Rows(0).Cells(5).Text
'        'End If



'        'car = GridView2.Rows(0).Cells(1).ToString






'        If ddl_carrera.SelectedValue.ToString = "FACEFA" Then

'            GridView1.DataSource = sql_ds_horas

'            GridView1.DataBind()
'        ElseIf ddl_carrera.SelectedValue.ToString = "INGENIERIAS" Then
'            GridView1.DataSource = sql_ds_horas0
'            GridView1.DataBind()
'        End If






'        'GridView1.DataBind()

'        'If GridView1.Rows.Count > 0 Then
'        '    txt_sumas2.Text = Convert.ToDecimal(txt_sumas.Text) + Convert.ToDecimal(txt_ajuste.Text)
'        '    Label1.Text = ""
'        'ElseIf GridView1.Rows.Count <= 0 Then
'        '    txt_sumas.Text = "0"
'        '    txt_sumas2.Text = Convert.ToDecimal(0) + Convert.ToDecimal(txt_ajuste.Text)

'        '    noti = "No tiene Clases Marcados en el Sistema"
'        '    Label1.Text = noti

'        'End If
'    End Sub



'    Protected Sub ddl_carrera_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_carrera.SelectedIndexChanged
'        If ddl_carrera.SelectedValue.ToString = "FACEFA" Then

'            gv_docentes.DataBind()

'            ddl_docente.DataSource = sql_ds_docente
'            ddl_docente.DataValueField = "ci_doc"
'            ddl_docente.DataTextField = "docente"
'            ddl_docente.DataBind()

'        ElseIf ddl_carrera.SelectedValue.ToString = "INGENIERIAS" Then

'            ddl_docente.DataSource = sql_ds_docente0
'            ddl_docente.DataValueField = "ci_doc"
'            ddl_docente.DataTextField = "docente"

'            ddl_docente.DataBind()

'        End If


'    End Sub

'    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click

'        sql_ds_horas.Insert()
'        gv_ajustes.DataBind()

'    End Sub

'    Protected Sub ddl_docente_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_docente.SelectedIndexChanged

'        txt_ci.Text = ddl_docente.SelectedValue.ToString

'    End Sub

'    Private Sub RR_HH_Reportes_respaldos3_Unload(sender As Object, e As EventArgs) Handles Me.Unload

'        rptdocumento.Close()
'        rptdocumento.Dispose()

'    End Sub
'End Class
Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data
Imports System.Web.UI.WebControls
Imports System
Imports CrystalDecisions.Shared
Imports System.IO.Compression
Imports System.IO

Partial Class RR_HH_Reportes_respaldos3
    Inherits System.Web.UI.Page

    '-----------------------------------------
    ' CAMPOS
    '-----------------------------------------
    Dim ds1 As New RR_HH_2_1
    Public rptdocumento As New CrystalDecisions.CrystalReports.Engine.ReportDocument

    Public suma As Double = 0
    Public suma2 As Double = 0
    Dim noti As String
    Dim GridView1 As GridView

    '-----------------------------------------
    ' EVENTO DINÁMICO DE GRIDVIEW
    '-----------------------------------------
    Private Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            suma += Val(e.Row.Cells(8).Text)
            suma2 += Val(e.Row.Cells(7).Text)
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(9).Text = "Total Programado"
            e.Row.Cells(6).Text = "Total Ejecutado"

            e.Row.Cells(8).Text = suma.ToString("N2")
            e.Row.Cells(7).Text = suma2.ToString("N2")

            txt_hraprog.Text = suma.ToString("N2")
            txt_hra_eje.Text = suma2.ToString("N2")

            e.Row.Cells(8).BackColor = Drawing.Color.LightBlue
            e.Row.Cells(9).BackColor = Drawing.Color.Yellow
            e.Row.Cells(7).BackColor = Drawing.Color.LightBlue
            e.Row.Cells(6).BackColor = Drawing.Color.Yellow
        End If

        ' Marcar en rojo si las horas no coinciden
        If e.Row.Cells(7).Text <> e.Row.Cells(8).Text Then
            e.Row.Cells(7).BackColor = Drawing.Color.Red
            e.Row.Cells(8).BackColor = Drawing.Color.Red
        End If
    End Sub

    '-----------------------------------------
    ' CARGA DE PÁGINA
    '-----------------------------------------
    Private Sub RR_HH_Reportes_respaldos3_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("idus") = "" Then
                Response.Redirect("~/sesion.aspx")
            End If

            lbl_cargo.Text = Session("rol_nombre") & " de " & Session("nombrecar") & " ---> " & Session("nombre_usuario")

            txt_sede.Text = Session("sede")
            txt_siglacar.Text = Session("siglacar")
        End If
    End Sub

    '-----------------------------------------
    ' BOTÓN PARA VER SUMAS EN GRIDVIEW
    '-----------------------------------------
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        PrepararGridView()

        If ddl_carrera.SelectedValue = "FACEFA" Then
            GridView1.DataSource = sql_ds_horas
        ElseIf ddl_carrera.SelectedValue = "INGENIERIAS" Then
            GridView1.DataSource = sql_ds_horas0
        End If

        GridView1.DataBind()
        'PlaceHolder1.Controls.Add(GridView1) ' Descomenta para mostrar el GridView.
    End Sub

    '-----------------------------------------
    ' BOTÓN PARA GENERAR ZIP DE REPORTES
    '-----------------------------------------
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim zipStream As New MemoryStream()

        PrepararGridView()

        If ddl_carrera.SelectedValue = "FACEFA" Then
            GridView1.DataSource = sql_ds_horas
        ElseIf ddl_carrera.SelectedValue = "INGENIERIAS" Then
            GridView1.DataSource = sql_ds_horas0
        End If

        GridView1.DataBind()

        Using zip As New ZipArchive(zipStream, ZipArchiveMode.Create, True)
            For i As Integer = 0 To gv_docentes.Rows.Count - 1
                ' Reiniciar acumuladores por docente
                suma = 0
                suma2 = 0

                Dim fila As GridViewRow = gv_docentes.Rows(i)
                Dim ciDoc As String = fila.Cells(1).Text.Trim()
                Dim nombreDoc As String = fila.Cells(0).Text.Trim()

                ' Preparar GridView y DataSource
                PrepararGridView()

                Dim dv As DataView

                If ddl_carrera.SelectedValue = "FACEFA" Then
                    ConfigurarParametros(sql_ds_horas, ciDoc)
                    dv = sql_ds_horas.Select(DataSourceSelectArguments.Empty)

                    GridView1.DataSource = sql_ds_horas
                ElseIf ddl_carrera.SelectedValue = "INGENIERIAS" Then
                    ConfigurarParametros(sql_ds_horas0, ciDoc)
                    dv = sql_ds_horas0.Select(DataSourceSelectArguments.Empty)
                    GridView1.DataSource = sql_ds_horas0
                Else
                    Continue For
                End If

                ' Vincular para activar RowDataBound
                GridView1.DataBind()

                Dim dt As DataTable = dv.ToTable()
                If dt.Rows.Count = 0 Then Continue For

                ' Dataset tipado para Crystal
                Dim dsTmp As New RR_HH_2_1()
                Dim tbIngSal As New RR_HH_2_1.tb_ing_salDataTable()
                tbIngSal.Merge(dt)
                dsTmp.Merge(tbIngSal)

                ' Generar reporte Crystal
                Dim rutaRpt As String = Server.MapPath("~/RR_HH_2_1.rpt")
                Using rpt As New ReportDocument()
                    rpt.Load(rutaRpt)
                    rpt.SetDataSource(dsTmp)

                    rpt.SetParameterValue("fechaini", txt_fini.Text)
                    rpt.SetParameterValue("fechafin", txt_ffin.Text)
                    rpt.SetParameterValue("hra_eje", suma2.ToString)
                    rpt.SetParameterValue("nombre", nombreDoc)
                    rpt.SetParameterValue("carrera", ddl_carrera.SelectedItem.Text)
                    rpt.SetParameterValue("hra_prog", suma.ToString)
                    rpt.SetParameterValue("notificacion", Label1.Text)

                    Using pdfStream As Stream = rpt.ExportToStream(ExportFormatType.PortableDocFormat)
                        Dim entryName As String = nombreDoc & "_" & DateTime.Now.ToString("yyyyMMddHHmmss") & ".pdf"

                        Dim entry As ZipArchiveEntry = zip.CreateEntry(entryName)

                        Using entryStream As Stream = entry.Open()
                            pdfStream.CopyTo(entryStream)
                        End Using
                    End Using
                End Using
            Next
        End Using

        ' Descargar ZIP
        zipStream.Position = 0
        Response.Clear()
        Response.Buffer = True
        Response.ContentType = "application/zip"
        Response.AddHeader("Content-Disposition", "attachment; filename=Reportes_" & DateTime.Now.ToString("yyyyMMddHHmmss") & ".zip")

        Response.BinaryWrite(zipStream.ToArray())
        Response.End()
    End Sub

    '-----------------------------------------
    ' MÉTODOS DE APOYO
    '-----------------------------------------
    Private Sub PrepararGridView()
        GridView1 = New GridView()
        AddHandler GridView1.RowDataBound, AddressOf GridView1_RowDataBound
    End Sub

    Private Sub ConfigurarParametros(ds As SqlDataSource, ciDoc As String)
        ' Asegurarse que el parámetro @ci no exista previamente
        If ds.SelectParameters("ci") IsNot Nothing Then
            ds.SelectParameters.Remove(ds.SelectParameters("ci"))
        End If

        ' Agregar el parámetro @ci con el valor del docente actual
        ds.SelectParameters.Add("ci", DbType.String, ciDoc)

        ' Actualizar los otros parámetros
        ds.SelectParameters("fini").DefaultValue = txt_fini.Text
        ds.SelectParameters("ffin").DefaultValue = txt_ffin.Text
        ds.SelectParameters("sede").DefaultValue = ddl_sede.SelectedValue
    End Sub

    '-----------------------------------------
    ' OTROS EVENTOS
    '-----------------------------------------
    Protected Sub ddl_carrera_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_carrera.SelectedIndexChanged
        ddl_docente.Items.Clear()

        If ddl_carrera.SelectedValue = "FACEFA" Then
            gv_docentes.DataSource = sql_ds_docente
            ddl_docente.DataSource = sql_ds_docente
        ElseIf ddl_carrera.SelectedValue = "INGENIERIAS" Then
            gv_docentes.DataSource = sql_ds_docente0
            ddl_docente.DataSource = sql_ds_docente0
        Else
            gv_docentes.DataSource = Nothing
            ddl_docente.DataSource = Nothing
        End If

        gv_docentes.DataBind()

        ddl_docente.DataValueField = "ci_doc"
        ddl_docente.DataTextField = "docente"
        ddl_docente.DataBind()
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        sql_ds_horas.Insert()
        gv_ajustes.DataBind()
    End Sub

    Protected Sub ddl_docente_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_docente.SelectedIndexChanged
        txt_ci.Text = ddl_docente.SelectedValue.ToString()
    End Sub

    Private Sub RR_HH_Reportes_respaldos3_Unload(sender As Object, e As EventArgs) Handles Me.Unload
        rptdocumento.Close()
        rptdocumento.Dispose()
    End Sub
End Class
