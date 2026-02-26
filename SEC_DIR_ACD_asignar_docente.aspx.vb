
Partial Class SEC_DIR_ACD_asignar_docente
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_horarios_virtuales_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
            'txt_cius.Text = Session("idus")



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
