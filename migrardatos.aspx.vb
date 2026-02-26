
Partial Class migrardatos
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        For i = 0 To gv_horario.Rows.Count - 1
            txt_id_horario.Text = gv_horario.Rows(i).Cells(0).Text
            txt_sede.Text = gv_horario.Rows(i).Cells(1).Text
            txt_gestion.Text = "1-2026"
            txt_tipo_clase.Text = gv_horario.Rows(i).Cells(4).Text
            txt_hrainicio.Text = gv_horario.Rows(i).Cells(5).Text
            txt_hrafin.Text = gv_horario.Rows(i).Cells(6).Text
            txt_cidoc.Text = "0"
            txt_grupo.Text = gv_horario.Rows(i).Cells(8).Text
            txt_dia.Text = gv_horario.Rows(i).Cells(9).Text
            txt_bloque.Text = gv_horario.Rows(i).Cells(11).Text
            txt_aula.Text = gv_horario.Rows(i).Cells(12).Text
            txt_designado.Text = gv_horario.Rows(i).Cells(15).Text
            sql_ds_horario.Insert()




            'sql_ds_horario.Delete()
            'sql_designacion.Delete()

            gv_registro.DataBind()

            gv_designacion.DataBind()
            For j = 0 To gv_designacion.Rows.Count - 1
                txt_id_designacion.Text = gv_designacion.Rows(j).Cells(0).Text
                txt_id_horario_desig.Text = gv_registro.Rows(0).Cells(0).Text
                txt_idmateria.Text = gv_designacion.Rows(j).Cells(2).Text
                txt_txt_idsede.Text = gv_designacion.Rows(j).Cells(4).Text
                txt_planest.Text = gv_designacion.Rows(j).Cells(5).Text
                txt_horas.Text = gv_designacion.Rows(j).Cells(6).Text
                txt_comun.Text = gv_designacion.Rows(j).Cells(7).Text
                txt_carrera.Text = gv_designacion.Rows(j).Cells(8).Text
                sql_designacion.Insert()

            Next
        Next

    End Sub
End Class
