
Partial Class DIR_CAR_asistencia_dia_hoy
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_asistencia_dia_hoy_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            'lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_cius.Text = Session("idus")
            txt_sede.text = Session("sede")
            txt_sigla_car.text = Session("siglacar")

        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
End Class
