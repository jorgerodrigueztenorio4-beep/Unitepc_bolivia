
Partial Class COORDINADOR_horarios_presenciales
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_horarios_virtuales_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            txt_cius.Text = Session("idus")
            txt_siglacar.Text = Session("siglacar")
            txt_sede.Text = Session("sede")


        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub

    Protected Sub gv_horarios_v_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarios_v.SelectedIndexChanged
        txt_id_horario.Text = gv_horarios_v.SelectedRow.Cells(1).Text
        sql_ds_carrera.Delete()
        sql_virtuales.Delete()
        ' sql_virtuales.Update()

        gv_horarios_v.DataBind()
    End Sub
End Class
