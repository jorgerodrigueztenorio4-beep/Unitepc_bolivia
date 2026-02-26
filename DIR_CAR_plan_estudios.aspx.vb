
Partial Class DIR_CAR_plan_estudios
    Inherits System.Web.UI.Page
    Dim ws1 As ws1.ParaControlWebSoapClient = New ws1.ParaControlWebSoapClient
    Private Sub DIR_CAR_plan_estudios_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_sede.Text = Session("sede")



        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub

    Protected Sub ddl_ant_nuevo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_ant_nuevo.SelectedIndexChanged
        gv_plan.DataSource = ws1.PlanesDeEstudio(Session("sede"), ddl_ant_nuevo.SelectedValue.ToString, Session("siglacar"))
        gv_plan.DataBind()
    End Sub
End Class
