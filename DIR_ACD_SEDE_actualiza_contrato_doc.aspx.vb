
Partial Class DIR_ACD_SEDE_actualiza_contrato_doc
    Inherits System.Web.UI.Page


    Protected Sub gv_busqueda_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_busqueda.SelectedIndexChanged
        txt_ci.Text = gv_busqueda.SelectedRow.Cells(5).Text
        Label1.Text = "Docente : " + gv_busqueda.SelectedRow.Cells(1).Text + " " + gv_busqueda.SelectedRow.Cells(2).Text + " " + gv_busqueda.SelectedRow.Cells(3).Text
        Label1.Visible = True

        'txt_buscar.Visible = False

        gv_buscar.DataBind()
        If gv_buscar.Rows.Count > 0 Then
            'Button1.Visible = False
            lbl_existe.Visible = True
            lbl_existe.Text = "El Contrato ya esta Registrado,Se Registro en Fecha : " + gv_buscar.Rows(0).Cells(6).Text + "--> Tipo de Contrato : " + gv_buscar.Rows(0).Cells(2).Text + "--> El tipo de Pago es  : " + gv_buscar.Rows(0).Cells(3).Text + "--> El Monto a Pagar es : " + gv_buscar.Rows(0).Cells(4).Text + "Bs."
            Button1.Visible = False
        Else
            Button1.Visible = True
            lbl_existe.Visible = False
        End If






    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql_ds_contrato.Insert()
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC Horarios"", text:""Docente Agregado Exitosamente"", type: ""success"" }, function(){window.location.href = ""DIR_ACD_SEDE_actualiza_contrato_doc"";});</script>")








    End Sub

    Private Sub DIR_CAR_actualiza_contrato_doc_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " ---> " + Session("sede_nombre") + " ---> " + Session("nombre_usuario")
            txt_sede.Text = Session("sede")
            'txt_ci_us.Text = Session("idus")


        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
End Class
