
Partial Class ADM_agregar_semanas_acd
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql_semanas.Insert()
        gv_semas.DataBind()

    End Sub
End Class
