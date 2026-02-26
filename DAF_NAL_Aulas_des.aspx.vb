
Partial Class DAF_NAL_Aulas_des
    Inherits System.Web.UI.Page


    Protected Sub gv_aulas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_aulas.SelectedIndexChanged
        txt_id_horario.Text = gv_aulas.SelectedRow.Cells(1).Text
    End Sub
    Protected Sub gv_detalle_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_detalle.SelectedIndexChanged
        txt_dia.Text = gv_detalle.SelectedRow.Cells(2).Text

    End Sub
End Class
