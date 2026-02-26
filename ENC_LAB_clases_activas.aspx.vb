
Partial Class ENC_LAB_clases_activas
    Inherits System.Web.UI.Page

    Private Sub ADM_BLO_clases_activas_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            'lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_cius.Text = Session("idus")
            'txt_sede.Text = Session("sede")
            'txt_sigla_car.Text = Session("siglacar")

        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub

End Class
