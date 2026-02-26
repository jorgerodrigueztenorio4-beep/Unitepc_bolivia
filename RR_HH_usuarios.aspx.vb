
Partial Class RR_HH_usuarios
    Inherits System.Web.UI.Page


    Protected Sub ddl_usuario_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_usuario.SelectedIndexChanged
        txt_usuario.Text = ddl_usuario.SelectedValue.ToString
        txt_contraseña.Text = ddl_usuario.SelectedValue.ToString
    End Sub



    Protected Sub ddl_tipo_usuario_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_tipo_usuario.SelectedIndexChanged

    End Sub

    Protected Sub btn_registrar_Click(sender As Object, e As EventArgs) Handles btn_registrar.Click

        sql_ds_usuarios_asignados.Insert()
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Nuevo Personal Registrado Existosamente"", type: ""success"" ,timer:3000}, function(){window.location.href = ""RR_HH_usuarios.aspx"";});</script>")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub ddl_carrera_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_carrera.SelectedIndexChanged
        txt_nomcar.Text = ddl_carrera.SelectedValue.ToString

    End Sub
End Class
