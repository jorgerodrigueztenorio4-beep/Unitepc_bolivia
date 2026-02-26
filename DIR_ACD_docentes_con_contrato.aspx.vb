
Partial Class DIR_ACD_docentes_con_contrato
    Inherits System.Web.UI.Page
    Dim wsr As wsr.ParaControlWebSoapClient = New wsr.ParaControlWebSoapClient

    Private Sub DIR_ACD_docentes_con_contrato_Load(sender As Object, e As EventArgs) Handles Me.Load
        gv_contrato.DataSource = wsr.DocentesGrabadoContrato2022()

        gv_contrato.DataBind()

    End Sub
End Class
