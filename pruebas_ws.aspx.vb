
Partial Class pruebas_ws
    Inherits System.Web.UI.Page
    Dim WSEBSE As wsr2.ParaControlWebSoapClient = New wsr2.ParaControlWebSoapClient
    Private Sub pruebas_ws_Load(sender As Object, e As EventArgs) Handles Me.Load
        GridView1.DataSource = WSEBSE.RRHHListaDeDocentes2023()

        GridView1.DataBind()
    End Sub
End Class
