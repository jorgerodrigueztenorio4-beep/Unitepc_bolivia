
Partial Class DAF_LOCAL_Aulas_des_2
    Inherits System.Web.UI.Page


    Protected Sub gv_aulas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_aulas.SelectedIndexChanged
        txt_id_horario.Text = gv_aulas.SelectedRow.Cells(1).Text
        lbl_aula.Text = "Aula : " + gv_aulas.SelectedRow.Cells(2).Text
        lbl_bloque.Text = "Bloque : " + ddl_bloque.SelectedItem.Text
        lbl_sede.Text = "Sede : " + ddl_sede.SelectedItem.Text
    End Sub

    Private Sub gv_detalle_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv_detalle.RowDataBound
        'If e.Row.RowType = DataControlRowType.DataRow Then

        '    If e.Row.Cells(3).Text > "90" Then

        '        e.Row.Cells(0).BackColor = Drawing.Color.FromArgb(250, 169, 183)
        '    End If


        'End If




    End Sub
End Class
