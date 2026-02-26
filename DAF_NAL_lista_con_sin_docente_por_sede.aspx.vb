
Partial Class DAF_NAL_lista_con_sin_docente_por_sede
    Inherits System.Web.UI.Page


    Protected Sub btn_registrar_Click(sender As Object, e As EventArgs) Handles btn_registrar.Click
        If gv_lista.Rows.Count > 0 Then
            Dim name As String = ddl_sede.SelectedItem.Text + "_" + ddl_sede.SelectedItem.Text

            Dim tw As New IO.StringWriter()
            Dim hw As New System.Web.UI.HtmlTextWriter(tw)
            Dim frm As HtmlForm = New HtmlForm()
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("content-disposition", "attachment;filename=" & name & ".xls")
            Response.Charset = ""
            EnableViewState = False
            Controls.Add(frm)
            frm.Controls.Add(gv_lista) 'GridView1 nombre del GridView suyo
            frm.RenderControl(hw)
            Response.Write(tw.ToString())
            Response.End()
        Else
            ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Seleccione una sede para emitir la lista"", type: ""warning"" });</script>")
        End If
    End Sub
End Class
