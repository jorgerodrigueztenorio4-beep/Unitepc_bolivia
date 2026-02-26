
Partial Class VICE_INST_materias_con_docente
    Inherits System.Web.UI.Page

    Protected Sub ddl_carrera_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_carrera.SelectedIndexChanged
        gv_con_doc.DataBind()
        gv_sin_mat.DataBind()

        If gv_con_doc.Rows.Count > 0 Then
            lbl_cantc.Text = gv_con_doc.Rows.Count.ToString
        End If
        If gv_sin_mat.Rows.Count > 0 Then
            lbl_sin_doc.Text = gv_sin_mat.Rows.Count.ToString
        End If
    End Sub
End Class
