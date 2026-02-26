
Partial Class RR_HH_SolicitudVacaciones
    Inherits System.Web.UI.Page
    Dim ws1 As wsr.ParaControlWebSoapClient = New wsr.ParaControlWebSoapClient

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv.DataSource = ws1.RRHHListaDeDocentes2023
        gv.DataBind()


    End Sub
End Class
