
Partial Class DIR_CAR_respaldo_docente
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        txt_id_horario.Text = GridView1.SelectedRow.Cells(2).Text
        gv_docente_clases.DataBind()

    End Sub
End Class
