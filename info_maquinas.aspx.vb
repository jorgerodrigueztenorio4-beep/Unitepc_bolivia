
Partial Class info_maquinas
    Inherits System.Web.UI.Page


    Protected Sub btn_registrar_Click(sender As Object, e As EventArgs) Handles btn_registrar.Click
        sql_ds_maquinas.Insert()
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Por Favor Intente nuevamente no se registro "", type: ""success"" ,timer:2000}, function(){window.location.href = ""info_maquinas.aspx"";});</script>")
        'Response.Redirect("~/info_maquinas.aspx")
    End Sub
End Class
