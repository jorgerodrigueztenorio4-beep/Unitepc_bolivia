
Partial Class RR_HH_comunes_todo
    Inherits System.Web.UI.Page

    Private Sub RR_HH_comunes_todo_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_sede.Text = Session("sede")



        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
End Class
