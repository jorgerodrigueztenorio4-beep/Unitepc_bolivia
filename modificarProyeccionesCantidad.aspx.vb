
Partial Class modificarProyeccionesCantidad
    Inherits System.Web.UI.Page


    Protected Sub ddl_materias_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_materias.SelectedIndexChanged
        gv_materias.DataBind()

        If gv_materias.Rows.Count > 0 Then
            txt_semestre.Text = gv_materias.Rows(0).Cells(4).Text
            txt_sigla_mat.Text = Trim(gv_materias.Rows(0).Cells(2).Text)
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql_ds_proyecciones.Insert()
        gv_materias.DataBind()

    End Sub
End Class
