
Partial Class DIR_ACD_SEDE_agregar_datos_docente
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_personal.DataBind()
        If gv_personal.Rows.Count > 0 Then
            'Button1.Visible = False
            lbl_existe.Visible = True
        Else
            sql_ds_docnete.Insert()
            sql_ds_ingreso.Insert()
            sql_ds_extencion.Insert()
            sql_ds_contrato.Insert()

            ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC Horarios"", text:""Docente Agregado Exitosamente"", type: ""success"" }, function(){window.location.href = ""DIR_ACD_SEDE_agregar_datos_docente.aspx"";});</script>")
        End If
    End Sub

    Private Sub ADM_agregar_datos_docente_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " ---> " + Session("sede_nombre") + " ---> " + Session("nombre_usuario")
            txt_sede.Text = Session("sede")
            'txt_ci_us.Text = Session("idus")


        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
End Class
