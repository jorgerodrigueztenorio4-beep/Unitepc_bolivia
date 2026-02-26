
Partial Class DIR_ACD_SEDE_datos_docente
    Inherits System.Web.UI.Page

    Private Sub DOCENTE_datos_docente_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
            txt_ci.Text = Session("idus")
            'gv_datos.DataBind()


        Else
            Response.Redirect("~/sesion.aspx")
        End If

    End Sub
End Class
