
Partial Class inventario_tecnologico
    Inherits System.Web.UI.Page

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        sql_ds_activos.Insert()
        gv_activos.DataBind()

    End Sub
End Class
