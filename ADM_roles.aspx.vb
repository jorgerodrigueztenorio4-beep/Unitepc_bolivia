
Partial Class ADM_roles
    Inherits System.Web.UI.Page

    Protected Sub btn_agregar_Click(sender As Object, e As EventArgs) Handles btn_agregar.Click
        sql_roles.Insert()
        gv_roles.DataBind()

    End Sub
End Class
