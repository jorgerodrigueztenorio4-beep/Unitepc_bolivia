
Partial Class reloj
    Inherits System.Web.UI.Page

    Private Sub reloj_Load(sender As Object, e As EventArgs) Handles Me.Load
        Timer1.Enabled = True

    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        gvreloj.DataBind()

    End Sub
End Class
