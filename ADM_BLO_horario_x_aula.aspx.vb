
Partial Class ADM_BLO_horario_x_aula
    Inherits System.Web.UI.Page

    Private Sub ADM_BLO_horario_x_dia_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
            txt_idsde.Text = Session("sede")



        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub

    Protected Sub ddl_bloque_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_bloque.SelectedIndexChanged
        txt_idsde.Text = ddl_bloque.SelectedValue.ToString

    End Sub

    Protected Sub ddl_aula_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_aula.SelectedIndexChanged
        txt_aux.Text = ddl_aula.SelectedValue.ToString
        gv_horario.DataBind()

    End Sub
End Class
