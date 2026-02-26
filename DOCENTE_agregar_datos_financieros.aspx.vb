
Partial Class DOCENTE_agregar_datos_financieros
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        txt_banco.Text = bancos.Value



        sql_ds_financiero.Insert()

    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
            txt_ci.Text = Session("idus")
            'gv_datos.DataBind()


        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
End Class
