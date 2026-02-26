
Imports System.Data

Partial Class RRHH_Lista_de_accesos
    Inherits System.Web.UI.Page
    Dim WSEBSE As wsr.ParaControlWebSoapClient = New wsr.ParaControlWebSoapClient
    Dim qtyTotal As Integer = 0
    Dim storid As Integer = 0
    Dim rowIndex As Integer = 1
    Private Sub RRHH_Ratificaciones_gral_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            'lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_sede.Text = Session("sede")
            'txt_siglacar.Text = Session("siglacar")
            ''txt_ciusuario.Text = Session("idus")
            ''txt_id_sede.Text = Session("sede")

        Else
            Response.Redirect("~/sesion.aspx")
        End If

    End Sub








End Class
