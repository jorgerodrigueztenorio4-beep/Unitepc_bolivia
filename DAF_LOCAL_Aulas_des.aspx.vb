
Partial Class DAF_LOCAL_Aulas_des
    Inherits System.Web.UI.Page


    Protected Sub gv_aulas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_aulas.SelectedIndexChanged
        txt_id_horario.Text = gv_aulas.SelectedRow.Cells(1).Text
    End Sub
End Class
