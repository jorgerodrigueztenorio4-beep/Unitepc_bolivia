
Partial Class RR_HH_habilitar_horarios
    Inherits System.Web.UI.Page

    Private Sub RR_HH_habilitar_horarios_Load(sender As Object, e As EventArgs) Handles Me.Load
        gv1.DataBind()

        If gv1.Rows.Count > 0 Then
            txt_id_habilitado.Text = gv1.Rows(0).Cells(0).Text
            Button1.Visible = True
            ddl_estado.Visible = True

        End If
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

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql_ds_detalle.Update()
        gv1.DataBind()


    End Sub
End Class
