
Partial Class COORDINADOR_agregar_datos_docente

    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_personal.DataBind()
        If gv_personal.Rows.Count > 0 Then
            'Button1.Visible = False
            lbl_existe.Visible = True


        Else
            sql_ds_docnete.Insert()
            sql_ds_ingreso.Insert()
            Response.Write("<script>alert(""Se Registro al Docente Exitosamente"");window.location.href = ""COORDINADOR_agregar_datos_docente.aspx"";</script>")
        End If

    End Sub

    Private Sub ADM_agregar_datos_docente_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            txt_sede.Text = Session("sede")



        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
End Class
