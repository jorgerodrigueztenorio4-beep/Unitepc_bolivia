
Partial Class planes_estudio_grabar
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        For filas As Integer = 0 To gv_planes.Rows.Count - 1
            txt_cod_car.Text = gv_planes.Rows(filas).Cells(1).Text
            txt_sigla_p.Text = gv_planes.Rows(filas).Cells(2).Text
            txt_materia.Text = gv_planes.Rows(filas).Cells(3).Text
            txt_semestre.Text = gv_planes.Rows(filas).Cells(4).Text
            txt_horasteo.Text = gv_planes.Rows(filas).Cells(5).Text
            txt_hrsprac.Text = gv_planes.Rows(filas).Cells(6).Text
            txt_hrastotal.Text = gv_planes.Rows(filas).Cells(7).Text
            txt_creditos.Text = gv_planes.Rows(filas).Cells(8).Text
            txt_sisplan.Text = gv_planes.Rows(filas).Cells(10).Text
            sql_ds_planes.Insert()

        Next
    End Sub
End Class
