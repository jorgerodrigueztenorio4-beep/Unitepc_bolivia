
Partial Class RR_HH_agregar_personal
    Inherits System.Web.UI.Page

    Private Sub RR_HH_agregar_personal_Load(sender As Object, e As EventArgs) Handles Me.Load
        gv_docente.DataBind()

        If gv_docente.Rows.Count > 0 Then
            lbl_notificaciones.Visible = True
            Button1.Visible = False
            ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""El Nro. de C.I. que intenta registrar ya esta registrado"", type: ""warning"" ,timer:3000}, function(){window.location.href = ""RR_HH_agregar_personal.aspx"";});</script>")
        ElseIf gv_docente.Rows.Count < 0 Then
            gv_docente.DataBind()

            lbl_notificaciones.Visible = False
            Button1.Visible = True

        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql_ds_docnete.Insert()
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Nuevo Personal Registrado Existosamente"", type: ""success"" ,timer:3000}, function(){window.location.href = ""RR_HH_agregar_personal.aspx"";});</script>")
    End Sub
End Class
