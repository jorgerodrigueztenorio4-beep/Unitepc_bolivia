
Partial Class DIR_CAR_designar_comun
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_designar_comun_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
            txt_sede.Text = Session("sede")
            txt_sigla_carrera.Text = Session("siglacar")
            txt_ciusuario.Text = Session("idus")
            txt_id_sede.Text = Session("sede")

        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql_ds_clase.Insert()
        sql_ds_clase.Update()

        gv_clase.DataBind()

        'Response.Write("<script>alert(""Se Registro la Materia Comun Exitosamente"");window.location.href = ""SEC_DIR_CAR_designar_comun.aspx"";</script>")
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Materia Comun Registrada Exitosamente"", type: ""success"" }, function(){window.location.href = ""DIR_CAR_designar_comun.aspx"";});</script>")
    End Sub
End Class
