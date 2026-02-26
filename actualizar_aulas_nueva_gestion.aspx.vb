
Partial Class actualizar_aulas_nueva_gestion
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        For filas = 0 To gv_aulas.Rows.Count - 1
            nomaula.Text = gv_aulas.Rows(filas).Cells(1).Text
            bloque.Text = gv_aulas.Rows(filas).Cells(2).Text
            capacidad.Text = HttpUtility.HtmlDecode(gv_aulas.Rows(filas).Cells(3).Text)
            dimensiones.Text = HttpUtility.HtmlDecode(gv_aulas.Rows(filas).Cells(4).Text)
            sede.Text = gv_aulas.Rows(filas).Cells(5).Text
            tipoambiente.Text = gv_aulas.Rows(filas).Cells(9).Text
            ubicacion.Text = HttpUtility.HtmlDecode(gv_aulas.Rows(filas).Cells(10).Text)
            capacidadbs.Text = HttpUtility.HtmlDecode(gv_aulas.Rows(filas).Cells(11).Text)
            estadoaula.Text = HttpUtility.HtmlDecode(gv_aulas.Rows(filas).Cells(12).Text)
            nropupitres.Text = HttpUtility.HtmlDecode(gv_aulas.Rows(filas).Cells(13).Text)
            sql_ds_aulas.Insert()

        Next
    End Sub
End Class
