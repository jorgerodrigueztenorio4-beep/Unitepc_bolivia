
Partial Class COORDINADOR_lista_docentes
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_lista_docentes_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_sede.Text = Session("sede")



        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
    Protected Sub gv_busqueda_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_busqueda.SelectedIndexChanged
        txt_ci.Text = gv_busqueda.SelectedRow.Cells(5).Text
        gv_seleccionado.DataBind()
        txt_comparar.Text = gv_seleccionado.Rows(0).Cells(4).Text
        If txt_comparar.Text = "&nbsp;" Then
            lbl_notificacion.Visible = True
        Else
            lbl_notificacion.Visible = False
        End If
    End Sub
End Class
