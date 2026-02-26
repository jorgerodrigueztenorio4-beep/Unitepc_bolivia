


Imports System.Data
Imports System.Drawing
Imports System.Configuration
Imports System.Data.SqlClient

Partial Class ver_proyeccion_materias
    Inherits System.Web.UI.Page

    Private currentId As String = "0"
    Private subTotal As Decimal = 0
    Private total As Decimal = 0
    Private subTotalRowIndex As Integer = 0


    'Dim qtyTotal As Integer = 1
    'Dim storid As String = "0"
    'Dim rowIndex As Integer = 0

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim fechaini, fechater As Date

        Dim dias, i, Dom1, Lun, Mar, Mie, Jue, Vie, sab As Integer
        i = 1
        fechaini = txt_fi.Text
        fechater = txt_ff.Text
        Me.TextBox8.Text = DateDiff(DateInterval.Day, fechaini, fechater) + 1
        dias = Me.TextBox8.Text

        While i <= dias

            If fechaini.DayOfWeek = DayOfWeek.Sunday Then
                Dom1 += 1
                'Me.TextBox1.Text = Dom1.ToString
            ElseIf fechaini.DayOfWeek = DayOfWeek.Monday Then
                Lun += 1
                Me.txt_lunes.Text = Lun.ToString
            ElseIf fechaini.DayOfWeek = DayOfWeek.Tuesday Then
                Mar += 1
                Me.txt_martes.Text = Mar.ToString
            ElseIf fechaini.DayOfWeek = DayOfWeek.Wednesday Then
                Mie += 1
                Me.txt_miercoles.Text = Mie.ToString
            ElseIf fechaini.DayOfWeek = DayOfWeek.Thursday Then
                Jue += 1
                Me.txt_jueves.Text = Jue.ToString

            ElseIf fechaini.DayOfWeek = DayOfWeek.Friday Then
                Vie += 1
                Me.txt_viernes.Text = Vie.ToString
            ElseIf fechaini.DayOfWeek = DayOfWeek.Saturday Then
                sab += 1
                Me.txt_sabado.Text = sab.ToString


            End If
            i += 1
            fechaini = fechaini.AddDays(1)
        End While
        'Me.TextBox9.Text = Dom1 + Lun + Mar + Mie + Jue + Vie + sab



        If gv_horario.Rows.Count > 0 Then
            TextBox1.Text = gv_horario.Rows.Count
            Dim ds As New DataSet
            Dim dt As New DataTable("tablahoras")
            dt.Columns.Add("Docente") '0
            dt.Columns.Add("C.I.") '1
            dt.Columns.Add("Carrera") '2
            dt.Columns.Add("Horas Programadas") '3
            dt.Columns.Add("Horas para Ejecutar") '4
            dt.Columns.Add("Dia") '5
            dt.Columns.Add("Materia") '6
            dt.Columns.Add("Sigla") '7
            dt.Columns.Add("Tipo de Clase") '8
            ds.Tables.Add(dt)

            For filas As Integer = 0 To gv_horario.Rows.Count - 1
                'For filash As Integer = 0 To gv_marcado.Rows.Count - 1
                'SIGLA CARRERA,SEDE,SIGLA MAT , tipo de clase , grupo'
                Dim dr As DataRow = dt.NewRow
                dr(0) = HttpUtility.HtmlDecode(gv_horario.Rows(filas).Cells(1).Text)
                dr(1) = HttpUtility.HtmlDecode(gv_horario.Rows(filas).Cells(0).Text)
                dr(2) = gv_horario.Rows(filas).Cells(4).Text
                dr(3) = gv_horario.Rows(filas).Cells(2).Text
                If gv_horario.Rows(filas).Cells(6).Text = "Lunes" Then
                    dr(4) = gv_horario.Rows(filas).Cells(2).Text * Me.txt_lunes.Text
                    'dr(5) = (gv_horario.Rows(filas).Cells(2).Text * 1) - gv_marcado.Rows(filash).Cells(2).Text

                End If
                If gv_horario.Rows(filas).Cells(6).Text = "Martes" Then
                    dr(4) = gv_horario.Rows(filas).Cells(2).Text * Me.txt_martes.Text
                    'dr(5) = (gv_horario.Rows(filas).Cells(2).Text * 1) - gv_marcado.Rows(filash).Cells(2).Text

                End If
                If gv_horario.Rows(filas).Cells(6).Text = "Miercoles" Then
                    dr(4) = gv_horario.Rows(filas).Cells(2).Text * Me.txt_miercoles.Text
                    'dr(5) = (gv_horario.Rows(filas).Cells(2).Text * 1) - gv_marcado.Rows(filash).Cells(2).Text

                End If
                If gv_horario.Rows(filas).Cells(6).Text = "Jueves" Then
                    dr(4) = gv_horario.Rows(filas).Cells(2).Text * Me.txt_jueves.Text
                    'dr(5) = (gv_horario.Rows(filas).Cells(2).Text * 1) - gv_marcado.Rows(filash).Cells(2).Text

                End If
                If gv_horario.Rows(filas).Cells(6).Text = "Viernes" Then
                    dr(4) = gv_horario.Rows(filas).Cells(2).Text * Me.txt_viernes.Text
                    'dr(5) = (gv_horario.Rows(filas).Cells(2).Text * 1) - gv_marcado.Rows(filash).Cells(2).Text

                End If
                If gv_horario.Rows(filas).Cells(6).Text = "Sabado" Then
                    dr(4) = gv_horario.Rows(filas).Cells(2).Text * Me.txt_martes.Text
                    'dr(5) = (gv_horario.Rows(filas).Cells(2).Text * 1) - gv_marcado.Rows(filash).Cells(2).Text

                End If
                'If gv_lista.Rows(filas).Cells(5).Text = GV_HORARIOS.Rows(filash).Cells(6).Text + "1" And gv_lista.Rows(filas).Cells(8).Text = GV_HORARIOS.Rows(filash).Cells(12).Text And gv_lista.Rows(filas).Cells(6).Text = GV_HORARIOS.Rows(filash).Cells(8).Text And gv_lista.Rows(filas).Cells(9).Text = GV_HORARIOS.Rows(filash).Cells(9).Text And gv_lista.Rows(filas).Cells(10).Text = GV_HORARIOS.Rows(filash).Cells(5).Text Then
                '    txt_ci.Text = gv_lista.Rows(filas).Cells(0).Text
                '    txt_id_horario.Text = GV_HORARIOS.Rows(filash).Cells(0).Text
                '    sql_ds_existe.Update()
                dr(5) = gv_horario.Rows(filas).Cells(6).Text
                dr(6) = gv_horario.Rows(filas).Cells(7).Text
                dr(7) = gv_horario.Rows(filas).Cells(9).Text
                dr(8) = gv_horario.Rows(filas).Cells(5).Text
                dt.Rows.Add(dr)
                'End If
                ' Next
                gv_total.DataSource = dt
                gv_total.DataBind()
                TextBox9.Text = gv_total.Rows.Count
            Next

        End If

    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        If gv_calculado.Rows.Count > 0 Then
            Dim tw As New IO.StringWriter()
            Dim hw As New System.Web.UI.HtmlTextWriter(tw)
            Dim frm As HtmlForm = New HtmlForm()
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("content-disposition", "attachment;filename=" & ddl_sede.SelectedItem.Text + "-" + ddl_carrera.SelectedItem.Text & ".xls")
            Response.Charset = ""
            EnableViewState = False
            Controls.Add(frm)
            frm.Controls.Add(gv_calculado) 'GridView1 nombre del GridView suyo
            frm.RenderControl(hw)
            Response.Write(tw.ToString())
            Response.End()
        End If
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim ds As New DataSet
        Dim dt As New DataTable("horas")
        dt.Columns.Add("Docente") '0
        dt.Columns.Add("C.I.") '1
        dt.Columns.Add("Carrera") '2
        'dt.Columns.Add("Horas Programadas") '3
        dt.Columns.Add("Horas a Ejecutar") '3
        'dt.Columns.Add("Dia") '5
        dt.Columns.Add("Materia") '4
        dt.Columns.Add("Sigla") '5
        dt.Columns.Add("Tipo de Clase") '6
        ds.Tables.Add(dt)
        Dim ban As Integer = 0
        Dim ban2 As Integer = 0
        For filas As Integer = 0 To gv_grupo.Rows.Count - 1
            Dim he As Integer = 0
            Dim dr As DataRow = dt.NewRow
            For filash As Integer = 0 To gv_total.Rows.Count - 1
                If gv_grupo.Rows(filas).Cells(0).Text = gv_total.Rows(filash).Cells(1).Text And gv_grupo.Rows(filas).Cells(4).Text = gv_total.Rows(filash).Cells(7).Text And gv_grupo.Rows(filas).Cells(2).Text = gv_total.Rows(filash).Cells(8).Text Then
                    'gv_horario.Rows(filas).Cells(5).Text = gv_total.Rows(filash).Cells(8).Text And  And gv_horario.Rows(filas).Cells(0).Text = gv_total.Rows(filash).Cells(1).Text Then
                    'If gv_horario.Rows(filas).Cells(9).Text = gv_total.Rows(filash).Cells(7).Text Then
                    '    
                    'he = he + 1
                    he = he + gv_total.Rows(filash).Cells(4).Text
                Else
                End If

            Next


            dr(0) = HttpUtility.HtmlDecode(gv_grupo.Rows(filas).Cells(1).Text)
                dr(1) = HttpUtility.HtmlDecode(gv_grupo.Rows(filas).Cells(0).Text)
                dr(2) = gv_total.Rows(filas).Cells(2).Text
                dr(4) = gv_grupo.Rows(filas).Cells(3).Text
                dr(5) = gv_grupo.Rows(filas).Cells(4).Text
                dr(6) = gv_grupo.Rows(filas).Cells(2).Text
                dr(3) = he.ToString
                dt.Rows.Add(dr)


        Next

        gv_calculado.DataSource = dt
        gv_calculado.DataBind()

    End Sub

    Private Sub ver_proyeccion_materias_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            'lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_sede.Text = Session("sede")
            'txt_siglacar.Text = Session("siglacar")
            ''txt_ciusuario.Text = Session("idus")
            ''txt_id_sede.Text = Session("sede")

        Else
            Response.Redirect("~/sesion.aspx")
        End If

    End Sub
End Class
