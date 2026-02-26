
Imports System.Data

Partial Class prueba_horario_est
    Inherits System.Web.UI.Page
    Dim ws As wsr.ParaControlWebSoap = New wsr.ParaControlWebSoapClient
    Dim ds As New DataSet
    Dim dt As New DataTable("tablamoodle")
    Dim s As Integer
    Private Sub prueba_horario_est_Load(sender As Object, e As EventArgs) Handles Me.Load


    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_est.DataSource = ws.MateriasDelEstudiantes(1, "N", txt_carrera.Text, txt_cod_est.Text)

        gv_est.DataBind()

        gv_horario.DataBind()


        'dt.Columns.Add("Horai") '0
        'dt.Columns.Add("horaf") '1
        'dt.Columns.Add("materia") '2
        ''dt.Columns.Add("lastname") '3
        ''dt.Columns.Add("email") '4
        ''dt.Columns.Add("type1") '5
        ''dt.Columns.Add("course1") '6
        ''dt.Columns.Add("city") '7
        ''dt.Columns.Add("profile_field_sedeuser") '8
        ''dt.Columns.Add("profile_field_carrerauser") '9
        ''dt.Columns.Add("course2") '10
        'ds.Tables.Add(dt)



        'For filas As Integer = 0 To gv_est.Rows.Count - 1

        '    txt_oferta.Text = gv_est.Rows(filas).Cells(5).Text
        '    'txt_oferta.Text = filas
        '    For filas2 As Integer = 0 To gv_horario.Rows.Count - 1
        '        txt_horario.Text = gv_horario.Rows(filas2).Cells(4).Text
        '        '    'txt_horario.Text = filas2

        '        '    If txt_oferta.Text = "BYF-126" Then
        '        '        s = s + 1
        '        '        txt_armado.Text = s

        '        '        'Dim dr As DataRow = dt.NewRow
        '        '        'dr(0) = gv_horario.Rows(filas).Cells(1).Text
        '        '        'dr(1) = gv_horario.Rows(filas).Cells(2).Text
        '        '        'dr(2) = gv_horario.Rows(filas).Cells(3).Text
        '        '        'dt.Rows.Add(dr)
        '        '    End If


        '    Next


        'Next
        'ds.Clear()
        'ds.Merge(dt)


        'gv_res.DataSource = ds
        'gv_res.DataBind()


    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        'gv_est.DataBind()
        dt.Columns.Add("dia") '0
        dt.Columns.Add("horai") '1
        dt.Columns.Add("horaf") '2
        dt.Columns.Add("materia") '3
        dt.Columns.Add("aula") '4
        dt.Columns.Add("docente") '5
        dt.Columns.Add("tipo_clase") '6
        dt.Columns.Add("grupo") '7
        'dt.Columns.Add("profile_field_sedeuser") '8
        'dt.Columns.Add("profile_field_carrerauser") '9
        'dt.Columns.Add("course2") '10
        ds.Tables.Add(dt)
        gv_horario.DataBind()
        For filas As Integer = 0 To gv_est.Rows.Count - 1

            txt_oferta.Text = gv_est.Rows(filas).Cells(5).Text.Trim
            'txt_oferta.Text = filas
            For filas2 As Integer = 0 To gv_horario.Rows.Count - 1
                txt_horario.Text = gv_horario.Rows(filas2).Cells(4).Text.Trim
                '    'txt_horario.Text = filas2

                If gv_est.Rows(filas).Cells(5).Text.Trim = gv_horario.Rows(filas2).Cells(4).Text.Trim And gv_est.Rows(filas).Cells(7).Text.Trim = gv_horario.Rows(filas2).Cells(5).Text.Trim Then
                    's = s + 1
                    txt_armado.Text = txt_armado.Text + "-" + gv_horario.Rows(filas2).Cells(3).Text

                    Dim dr As DataRow = dt.NewRow
                    dr(0) = gv_horario.Rows(filas2).Cells(0).Text
                    dr(1) = gv_horario.Rows(filas2).Cells(1).Text
                    dr(2) = gv_horario.Rows(filas2).Cells(2).Text
                    dr(3) = gv_horario.Rows(filas2).Cells(3).Text
                    dr(4) = gv_horario.Rows(filas2).Cells(6).Text
                    dr(5) = gv_horario.Rows(filas2).Cells(8).Text
                    dr(6) = gv_horario.Rows(filas2).Cells(7).Text
                    dt.Rows.Add(dr)
                End If


            Next


        Next
        'ds.Clear()
        'ds.Merge(dt)


        gv_res.DataSource = ds
        gv_res.DataBind()
    End Sub
End Class
