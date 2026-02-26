
Partial Class DOCENTE_agregar_heredero
    Inherits System.Web.UI.Page

    Private Sub DOCENTE_agregar_heredero_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
            txt_ci.Text = Session("idus")
            'gv_datos.DataBind()


        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql_ds_herederos.Insert()
        Response.Write("<script>alert(""Se Registro los Datos Exitosamente"");window.location.href = ""DOCENTE_agregar_heredero.aspx"";</script>")
    End Sub
End Class
