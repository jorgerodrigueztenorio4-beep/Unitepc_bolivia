
Partial Class RR_HH_cargas_horarias
    Inherits System.Web.UI.Page


    Protected Sub gv_carga_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_carga.SelectedIndexChanged
        txt_cidoc.Text = gv_carga.SelectedRow.Cells(1).Text
        gv_detalle.DataBind()

    End Sub

    Private Sub RR_HH_cargas_horarias_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
            'txt_ci.Text = Session("idus")
            'gv_datos.DataBind()


        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
End Class
