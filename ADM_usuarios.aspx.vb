
Partial Class ADM_usuarios
    Inherits System.Web.UI.Page


    Protected Sub ddl_usuario_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_usuario.SelectedIndexChanged
        txt_usuario.Text = ddl_usuario.SelectedValue.ToString
        txt_contraseña.Text = ddl_usuario.SelectedValue.ToString
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql_ds_usuario.Insert()
        Response.Write("<script>alert(""Se registro los datos exitosamente"");window.location.href = ""ADM_usuarios.aspx"";</script>")
    End Sub
    Protected Sub ddl_carrera_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_carrera.SelectedIndexChanged
        txt_nomcar.Text = ddl_carrera.SelectedItem.Text

    End Sub
End Class
