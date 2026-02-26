
Partial Class DOCENTE_completar_datos
    Inherits System.Web.UI.Page

    Private Sub DOCENTE_completar_datos_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
            txt_ci.Text = Session("idus")
            gv_datos.DataBind()

            If gv_datos.Rows.Count > 0 Then
                lbl_existe.Visible = False
                txt_nombres.Text = gv_datos.Rows(0).Cells(1).Text
                txt_papellidos.Text = gv_datos.Rows(0).Cells(2).Text
                txt_sapellido.Text = gv_datos.Rows(0).Cells(3).Text
                txtemail.Text = gv_datos.Rows(0).Cells(4).Text
                txt_nro_ci.Text = gv_datos.Rows(0).Cells(5).Text
                txt_celular.Text = gv_datos.Rows(0).Cells(11).Text
            ElseIf gv_datos.Rows.Count >= 0 Then
                lbl_existe.Visible = True
                txt_nombres.Visible = False
                txt_papellidos.Visible = False
                txt_sapellido.Visible = False
                txtemail.Visible = False
                txt_nro_ci.Visible = False
                txt_celular.Visible = False
                ddl_estado_civil.Visible = False
                ddl_extencion.Visible = False
                ddl_genero.Visible = False
                ddl_nacionalidad.Visible = False
                txt_fecha_nac.Visible = False
                txt_direccion.Visible = False
                txt_telefono.Visible = False
                Button1.Visible = False

            End If



        Else
            Response.Redirect("~/sesion.aspx")
        End If



    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql_ds_datos.Update()
        Response.Redirect("~/DOCENTE_completar_datos.aspx")
    End Sub
End Class
