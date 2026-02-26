
Partial Class DAF_LOCAL_horarios_virtuales
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_horarios_virtuales_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            'lbl_cargo.Text = Session("rol_nombre") + Session("nombrecar") + "--->" + Session("nombre_usuario")
            ' txt_cius.Text = Session("idus")
            txt_sede.text = Session("sede")



        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
End Class
