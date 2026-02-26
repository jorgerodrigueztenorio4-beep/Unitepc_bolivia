
Partial Class DIR_CAR_asignar_docente2
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_horarios_virtuales_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_cius.Text = Session("idus")
            txt_sede.text = Session("sede")
            txt_sigla_car.text = Session("siglacar")

        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub

    Protected Sub gv_horarios_v_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarios_v.SelectedIndexChanged
        Dim v As String
        v = gv_horarios_v.SelectedRow.Cells(2).Text
        txt_ci.Text = v
    End Sub
End Class
