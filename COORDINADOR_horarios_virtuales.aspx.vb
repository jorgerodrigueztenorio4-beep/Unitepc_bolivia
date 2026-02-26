
Partial Class COORDINADOR_horarios_virtuales
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_horarios_virtuales_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            txt_idsede.Text = Session("sede")
            txt_carrera.Text = Session("siglacar")



        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
End Class
