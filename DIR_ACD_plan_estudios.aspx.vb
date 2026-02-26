
Partial Class ADM_plan_estudios
    Inherits System.Web.UI.Page
    Dim ws1 As wsr.ParaControlWebSoapClient = New wsr.ParaControlWebSoapClient




    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_plan.DataSource = ws1.PlanesDeEstudio("3", ddl_ant_nuevo.SelectedValue.ToString, ddl_carrera.SelectedValue.ToString)
        gv_plan.DataBind()

    End Sub


End Class
