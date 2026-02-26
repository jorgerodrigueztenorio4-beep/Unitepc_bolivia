
Imports System.Data
Imports System.Drawing

Partial Class contratos_horarios_new

    Inherits System.Web.UI.Page
    Dim WSEBSE As wsr2.ParaControlWebSoapClient = New wsr2.ParaControlWebSoapClient

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_lista.DataSource = WSEBSE.RRHHListaDeDocentes2023()

        gv_lista.DataBind()
        For filas As Integer = 0 To gv_lista.Rows.Count - 1
            txt_ci.Text = gv_lista.Rows(filas).Cells(0).Text
            txt_nombre.Text = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(1).Text)
            txt_ppa.Text = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(2).Text)
            txt_sap.Text = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(3).Text)
            gv_existe.DataBind()

            If gv_existe.Rows.Count > 0 Then


            ElseIf gv_existe.Rows.Count <= 0 Then
                'sql_ds_existe.Insert()
            End If
        Next
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        'gv_lista.DataSource = WSEBSE.RRHHListaDeDocentes2023()
        Dim NUMSOC, NUM_SOCIO As String
        'gv_lista.DataBind().
        For filas As Integer = 0 To gv_lista.Rows.Count - 1


            'NUMSOC = gv_lista.Rows(i).Cells(0).Text



            For filash As Integer = 0 To GV_HORARIOS.Rows.Count - 1

                ' NUM_SOCIO = GV_HORARIOS.Rows(A).Cells(1).Text

                If gv_lista.Rows(filas).Cells(5).Text = GV_HORARIOS.Rows(filash).Cells(6).Text + "1" And gv_lista.Rows(filas).Cells(8).Text = GV_HORARIOS.Rows(filash).Cells(12).Text And RTrim(gv_lista.Rows(filas).Cells(6).Text) = GV_HORARIOS.Rows(filash).Cells(8).Text And gv_lista.Rows(filas).Cells(9).Text = GV_HORARIOS.Rows(filash).Cells(9).Text And gv_lista.Rows(filas).Cells(10).Text = GV_HORARIOS.Rows(filash).Cells(5).Text Then

                    gv_lista.Rows(filas).BackColor = Color.LightGreen
                End If

                If gv_lista.Rows(filas).BackColor <> Color.LightGreen Then
                    gv_lista.Rows(filas).BackColor = Color.Red
                End If


            Next
        Next
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click

        'Dim ds As New DataSet
        'Dim dt As New DataTable("tb_faltantes")
        'dt.Columns.Add("ci")
        ''dt.Columns.Add("docente")
        ''dt.Columns.Add("carrera")
        ''dt.Columns.Add("sigla")
        ''dt.Columns.Add("email")
        ''dt.Columns.Add("type1")
        ''dt.Columns.Add("course1")
        ''dt.Columns.Add("city")

        'ds.Tables.Add(dt)



        'For filas As Integer = 0 To gv_lista.Rows.Count - 1
        '    Dim t1, t2 As Integer

        '    For filash As Integer = 0 To GV_HORARIOS.Rows.Count - 1
        '        t1 = 0
        '        t2 = 0

        '        'SIGLA CARRERA,SEDE,SIGLA MAT , tipo de clase , grupo'
        '        'If gv_lista.Rows(filas).Cells(5).Text = GV_HORARIOS.Rows(filash).Cells(6).Text + "1" And gv_lista.Rows(filas).Cells(8).Text = GV_HORARIOS.Rows(filash).Cells(12).Text And RTrim(gv_lista.Rows(filas).Cells(6).Text) = GV_HORARIOS.Rows(filash).Cells(8).Text And gv_lista.Rows(filas).Cells(9).Text = GV_HORARIOS.Rows(filash).Cells(9).Text And gv_lista.Rows(filas).Cells(10).Text = GV_HORARIOS.Rows(filash).Cells(5).Text Then
        '        If gv_lista.Rows(filas).Cells(0).Text = GV_HORARIOS.Rows(filash).Cells(1).Text Then
        '            t1 = t1 + 1


        '        Else
        '            t2 = t2 + 1

        '        End If
        '        If t1 > t2 Then
        '        ElseIf t2 >= 1 Then
        '            Dim dr As DataRow = dt.NewRow
        '            dr(0) = gv_lista.Rows(filas).Cells(0).Text
        '            'dr(1) = gv_lista.Rows(filas).Cells(1).Text + " " + gv_lista.Rows(filas).Cells(2).Text + "" + gv_lista.Rows(filas).Cells(3).Text
        '            'dr(2) = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(5).Text)
        '            'dr(3) = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(6).Text)
        '            'dr(4) = gw_matriculados_fecha.Rows(filas).Cells(0).Text + "@gmail.com"
        '            'dr(5) = "1"
        '            'dr(6) = gw_matriculados_fecha.Rows(filas).Cells(5).Text + "-" + sede + "-" + "G" + gw_matriculados_fecha.Rows(filas).Cells(6).Text
        '            'dr(7) = ddl_sede.SelectedItem.Text
        '            dt.Rows.Add(dr)
        '        End If


        '    Next

        'Next
        'gv_sin_materia.DataSource = dt
        'gv_sin_materia.DataBind()
        If gv_lista.Rows.Count > 0 Then
            Dim tw As New IO.StringWriter()
            Dim hw As New System.Web.UI.HtmlTextWriter(tw)
            Dim frm As HtmlForm = New HtmlForm()
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("content-disposition", "attachment;filename=" & "Horarios" & ".xls")
            Response.Charset = ""
            EnableViewState = False
            Controls.Add(frm)
            frm.Controls.Add(gv_lista) 'GridView1 nombre del GridView suyo
            frm.RenderControl(hw)
            Response.Write(tw.ToString())
            Response.End()
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub ddl_sede_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_sede.SelectedIndexChanged

    End Sub
End Class
