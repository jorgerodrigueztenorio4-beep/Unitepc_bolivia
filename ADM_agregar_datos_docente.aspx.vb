
Partial Class ADM_agregar_datos_docente
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql_ds_docnete.Insert()
        Response.Write("<script>alert(""Se Registro al Docente Exitosamente"");window.location.href = ""ADM_agregar_datos_docente.aspx"";</script>")
    End Sub
End Class
