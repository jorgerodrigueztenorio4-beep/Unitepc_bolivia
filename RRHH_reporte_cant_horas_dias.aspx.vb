
Imports System.Data

Partial Class RRHH_reporte_cant_horas_dias
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
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
                Me.TextBox1.Text = Dom1.ToString
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
        Me.TextBox9.Text = Dom1 + Lun + Mar + Mie + Jue + Vie + sab
    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim ds As New DataSet
        Dim dt As New DataTable("tablahoras")
        dt.Columns.Add("Docente") '0
        dt.Columns.Add("C.I.") '1
        dt.Columns.Add("Carrera") '2
        dt.Columns.Add("Horas Programadas") '3
        dt.Columns.Add("Horas Ejecutadas") '4
        dt.Columns.Add("Diferencia") '5

        ds.Tables.Add(dt)

        For filas As Integer = 0 To gv_horario.Rows.Count - 1
            For filash As Integer = 0 To gv_marcado.Rows.Count - 1
                'SIGLA CARRERA,SEDE,SIGLA MAT , tipo de clase , grupo'
                If gv_horario.Rows(filas).Cells(0).Text = gv_marcado.Rows(filash).Cells(0).Text Then

                    Dim dr As DataRow = dt.NewRow
                    dr(0) = gv_horario.Rows(filas).Cells(0).Text
                    dr(1) = gv_horario.Rows(filas).Cells(1).Text
                    dr(2) = gv_horario.Rows(filas).Cells(4).Text
                    dr(3) = gv_horario.Rows(filas).Cells(2).Text * 1
                    dr(4) = gv_marcado.Rows(filash).Cells(2).Text
                    dr(5) = (gv_horario.Rows(filas).Cells(2).Text * 1) - gv_marcado.Rows(filash).Cells(2).Text
                    dt.Rows.Add(dr)
                End If
                'If gv_lista.Rows(filas).Cells(5).Text = GV_HORARIOS.Rows(filash).Cells(6).Text + "1" And gv_lista.Rows(filas).Cells(8).Text = GV_HORARIOS.Rows(filash).Cells(12).Text And gv_lista.Rows(filas).Cells(6).Text = GV_HORARIOS.Rows(filash).Cells(8).Text And gv_lista.Rows(filas).Cells(9).Text = GV_HORARIOS.Rows(filash).Cells(9).Text And gv_lista.Rows(filas).Cells(10).Text = GV_HORARIOS.Rows(filash).Cells(5).Text Then
                '    txt_ci.Text = gv_lista.Rows(filas).Cells(0).Text
                '    txt_id_horario.Text = GV_HORARIOS.Rows(filash).Cells(0).Text
                '    sql_ds_existe.Update()



                'End If
            Next
            gv_total.DataSource = dt
            gv_total.DataBind()

        Next
    End Sub
End Class
