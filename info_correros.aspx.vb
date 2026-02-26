
Partial Class info_correros
    Inherits System.Web.UI.Page




    Protected Sub btn_registrar_Click(sender As Object, e As EventArgs) Handles btn_registrar.Click

        sql_ds_infos.Insert()
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Datos Registrados Exitosamente"", type: ""success"",timer:3000}, function(){window.location.href = ""info_correros.aspx"";});</script>")
    End Sub

    Protected Sub txt_ci_TextChanged(sender As Object, e As EventArgs) Handles txt_ci.TextChanged
        gv_info.DataBind()

        If gv_info.Rows.Count > 0 Then
            btn_registrar.Visible = False
        ElseIf gv_info.Rows.Count <= 0 Then
            btn_registrar.Visible = True

        End If
    End Sub
End Class
