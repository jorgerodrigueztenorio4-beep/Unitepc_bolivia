
Partial Class DAF_NAL_clases_activas
    Inherits System.Web.UI.Page

    Private Sub ADM_BLO_clases_activas_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
            txt_idsde.Text = Session("sede")



        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
End Class
