
Partial Class agregarexamens2horas
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'gv_materias.DataBind()
        'gv_reg.DataBind()

        'For i As Integer = 0 To gv_materias.Rows.Count - 1


        '    txt_ci.Text = gv_materias.Rows(i).Cells(0).Text
        '    txt_nom_materia.Text = HttpUtility.HtmlEncode(gv_materias.Rows(i).Cells(1).Text)
        '    txt_carsigla.Text = gv_materias.Rows(i).Cells(2).Text
        '    txt_aula.Text = gv_materias.Rows(i).Cells(3).Text
        '    txt_id_horario.Text = gv_materias.Rows(i).Cells(4).Text
        '    txt_sede.Text = gv_materias.Rows(i).Cells(5).Text
        '    txt_siglaplan.Text = gv_materias.Rows(i).Cells(6).Text.Trim()
        '    txt_tipo_clase.Text = gv_materias.Rows(i).Cells(7).Text
        '    txt_horainicio.Text = gv_materias.Rows(i).Cells(8).Text
        '    txt_horafin.Text = gv_materias.Rows(i).Cells(9).Text
        '    txt_grupo.Text = gv_materias.Rows(i).Cells(10).Text
        '    txt_gestion.Text = gv_materias.Rows(i).Cells(11).Text
        '    txt_horas.Text = gv_materias.Rows(i).Cells(12).Text
        '    txt_bloque.Text = gv_materias.Rows(i).Cells(13).Text
        '    txt_observaciones.Text = "Clase Examen Final"
        '    txt_fecha_registro.Text = "20/12/2025"



        '    If gv_reg.Rows.Count <= 0 Then

        '        sql_ds_registrado.Insert()

        '        gv_reg.DataBind()
        '    End If

        '    For j As Integer = 0 To gv_reg.Rows.Count - 1


        '        If (gv_materias.Rows(i).Cells(0).Text.Trim() = gv_reg.Rows(j).Cells(1).Text.Trim()) And
        '                (gv_materias.Rows(i).Cells(5).Text.Trim() = gv_reg.Rows(j).Cells(11).Text.Trim()) And
        '                (gv_materias.Rows(i).Cells(6).Text.Trim() = gv_reg.Rows(j).Cells(12).Text.Trim()) And
        '            (gv_materias.Rows(i).Cells(2).Text.Trim() = gv_reg.Rows(j).Cells(7).Text.Trim()) Then


        '        Else
        '            sql_ds_registrado.Insert()
        '            gv_reg.DataBind()

        '        End If

        '    Next

        'Next




        gv_materias.DataBind()
        gv_reg.DataBind()

        For i As Integer = 0 To gv_materias.Rows.Count - 1
            gv_reg.DataBind()

            txt_ci.Text = gv_materias.Rows(i).Cells(0).Text
            txt_nom_materia.Text = HttpUtility.HtmlDecode(gv_materias.Rows(i).Cells(1).Text)
            txt_carsigla.Text = gv_materias.Rows(i).Cells(2).Text
            txt_aula.Text = gv_materias.Rows(i).Cells(3).Text
            txt_id_horario.Text = gv_materias.Rows(i).Cells(4).Text
            txt_sede.Text = gv_materias.Rows(i).Cells(5).Text
            txt_siglaplan.Text = gv_materias.Rows(i).Cells(6).Text.Trim()
            txt_tipo_clase.Text = gv_materias.Rows(i).Cells(7).Text
            txt_horainicio.Text = gv_materias.Rows(i).Cells(8).Text
            txt_horafin.Text = gv_materias.Rows(i).Cells(9).Text
            txt_grupo.Text = gv_materias.Rows(i).Cells(10).Text
            txt_gestion.Text = gv_materias.Rows(i).Cells(11).Text
            txt_horas.Text = gv_materias.Rows(i).Cells(12).Text
            txt_bloque.Text = gv_materias.Rows(i).Cells(13).Text
            txt_observaciones.Text = "Clase Examen Final"
            txt_fecha_registro.Text = "20/12/2025"

            Dim existe As Boolean = False

            ' Recorremos gv_reg para ver si ya existe
            For j As Integer = 0 To gv_reg.Rows.Count - 1
                If gv_materias.Rows(i).Cells(0).Text.Trim() = gv_reg.Rows(j).Cells(1).Text.Trim() AndAlso
           gv_materias.Rows(i).Cells(5).Text.Trim() = gv_reg.Rows(j).Cells(11).Text.Trim() AndAlso
           gv_materias.Rows(i).Cells(6).Text.Trim() = gv_reg.Rows(j).Cells(12).Text.Trim() AndAlso
           gv_materias.Rows(i).Cells(2).Text.Trim() = gv_reg.Rows(j).Cells(7).Text.Trim() Then

                    existe = True
                    Exit For ' ya existe, no hace falta seguir revisando
                End If
            Next

            ' Insertamos solo si NO existe
            If Not existe Then
                sql_ds_registrado.Insert()
            End If

        Next

        ' Finalmente refrescamos gv_reg una sola vez
        gv_reg.DataBind()


    End Sub
End Class
