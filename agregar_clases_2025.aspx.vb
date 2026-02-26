Imports OfficeOpenXml
Imports System.Data
Imports System.IO
Imports System.Globalization

Public Class agregar_clases_2025
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        gv_clases.DataBind()

        lbl_cont.Text = gv_clases.Rows.Count


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        For Each row1 As GridViewRow In gv_clases.Rows

            Dim ci As String = row1.Cells(1).Text.Trim()
            Dim dia As String = row1.Cells(6).Text.Trim()
            Dim hora As String = row1.Cells(4).Text.Trim()
            txt_ci_busqueda.Text = row1.Cells(1).Text.Trim()
            GridView1.DataBind()

            For Each row2 As GridViewRow In GridView1.Rows
                Dim ci2 As String = row2.Cells(0).Text.Trim()
                Dim dia2 As String = row2.Cells(11).Text.Trim()
                Dim hora2 As String = row2.Cells(8).Text.Trim()

                If dia = dia2 And ci = ci2 And hora = hora2 Then

                    txt_cidoc.Text = row2.Cells(0).Text.Trim()
                    txt_materia.Text = row2.Cells(1).Text.Trim()
                    txt_carsigla.Text = row2.Cells(2).Text.Trim()
                    txt_aula.Text = row2.Cells(3).Text.Trim()
                    txt_idhorario.Text = row2.Cells(4).Text.Trim()
                    txt_sede.Text = row2.Cells(5).Text.Trim()
                    txt_siglamateria.Text = row2.Cells(6).Text.Trim()
                    txt_tipoclase.Text = row2.Cells(7).Text.Trim()
                    txt_hrainicio.Text = row2.Cells(8).Text.Trim()
                    txt_horafin.Text = row2.Cells(9).Text.Trim()
                    txt_grupo.Text = row2.Cells(10).Text.Trim()
                    txt_dia.Text = row2.Cells(11).Text.Trim()
                    txt_gestion.Text = row2.Cells(12).Text.Trim()
                    txt_horas.Text = row2.Cells(13).Text.Trim()
                    txt_bloque.Text = row2.Cells(15).Text.Trim()
                    txt_horaregistro.Text = row1.Cells(3).Text.Trim()

                    row2.BackColor = System.Drawing.Color.Yellow
                    sql_ds_horario.Insert()





                End If
            Next
        Next


    End Sub

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        Dim fechaSeleccionada As Date = Calendar1.SelectedDate

        ' Formatear la fecha en formato ISO (YYYY-MM-DD)
        Dim fechaFormateada As String = fechaSeleccionada.ToString("yyyy-MM-dd")

        ' Concatenar una hora (por ejemplo 08:30:00)
        Dim hora As String = "08:30:00"
        Dim fechaCompleta As String = fechaFormateada
        txt_fecha.Text = fechaCompleta
        'Dim fechaSeleccionada As Date = Calendar1.SelectedDate
        Dim nombreDia As String = fechaSeleccionada.ToString("dddd", New System.Globalization.CultureInfo("es-ES"))
        nombreDia = QuitarAcentos(nombreDia)
        txt_dia.Text = nombreDia
    End Sub

    Protected Sub txt_dia_TextChanged(sender As Object, e As EventArgs) Handles txt_dia.TextChanged
        If txt_dia.Text <> "" Then
            GridView2.DataBind()

        End If
    End Sub

    Private Function QuitarAcentos(ByVal texto As String) As String
        Dim conAcentos As String = "áéíóúÁÉÍÓÚ"
        Dim sinAcentos As String = "aeiouAEIOU"

        For i As Integer = 0 To conAcentos.Length - 1
            texto = texto.Replace(conAcentos(i), sinAcentos(i))
        Next

        Return texto
    End Function



    Protected Sub btn_dir_Click(sender As Object, e As EventArgs) Handles btn_dir.Click
        For Each row1 As GridViewRow In GridView2.Rows

            txt_cidoc.Text = row1.Cells(0).Text.Trim()
            txt_hraingreso.Text = row1.Cells(1).Text.Trim()
            txt_hrasalida.Text = row1.Cells(2).Text.Trim()
            txt_materia.Text = row1.Cells(3).Text.Trim()
            txt_carsigla.Text = row1.Cells(4).Text.Trim()
            txt_aula.Text = row1.Cells(5).Text.Trim()
            txt_idhorario.Text = row1.Cells(6).Text.Trim()
            txt_sede.Text = row1.Cells(7).Text.Trim()
            txt_siglamateria.Text = row1.Cells(8).Text.Trim()
            txt_tipoclase.Text = row1.Cells(9).Text.Trim()
            txt_hrainicio.Text = row1.Cells(10).Text.Trim()
            txt_horafin.Text = row1.Cells(11).Text.Trim()
            txt_grupo.Text = row1.Cells(12).Text.Trim()
            'txt_dia.Text = row1.Cells(11).Text.Trim()
            txt_gestion.Text = row1.Cells(14).Text.Trim()
            txt_horas.Text = row1.Cells(15).Text.Trim()
            txt_bloque.Text = row1.Cells(17).Text.Trim()
            txt_horaregistro.Text = row1.Cells(16).Text.Trim()
            txt_observaciones.Text = row1.Cells(18).Text.Trim()

            sql_agregar.Insert()

        Next
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

        For Each Fila As GridViewRow In gv_horarios.Rows

            txt_id_horario.Text = Fila.Cells(0).Text
            gv_designacion.DataBind()
            sql_ds_horarios.Insert()


            For Each Filagd As GridViewRow In gv_designacion.Rows

                txt_id_desig.Text = Filagd.Cells(0).Text
                sql_designacion.Insert()



            Next




        Next

    End Sub
End Class

