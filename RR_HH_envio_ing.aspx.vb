
Partial Class RR_HH_envio_ing
    Inherits System.Web.UI.Page
    Dim servicioing As sr1.WEB_SERVICE_SEGUIMIENTOSoapClient = New sr1.WEB_SERVICE_SEGUIMIENTOSoapClient


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_servicio.DataSource = servicioing.HORASDOCENTE2023(1, ddl_carrera.SelectedValue, txt_inicio.Text, txt_fin.Text)
        gv_servicio.DataBind()

        gv_lista.DataBind()

    End Sub

    Private Sub RR_HH_envio_ing_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            'lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_sede.Text = Session("sede")
            'txt_siglacar.Text = Session("siglacar")
            'txt_ciusuario.Text = Session("idus")
            'txt_id_sede.Text = Session("sede")

        Else
            Response.Redirect("~/sesion.aspx")
        End If
        'If ddl_carrera.SelectedItem.Text = "4518921" Then
        '    'ddl_docente.Attributes.Add("style", "background-color: Gold !important;")


        'End If
    End Sub
End Class
