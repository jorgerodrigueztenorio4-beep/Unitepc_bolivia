
Partial Class act_fijo_enceres
    Inherits System.Web.UI.Page
    Dim ws As wsr3.WebServiceSoapClient = New wsr3.WebServiceSoapClient
    Dim gv_funcionario As New GridView
    Private Sub act_fijo_enceres_Load(sender As Object, e As EventArgs) Handles Me.Load
        gv_funcionario.DataSource = ws.ListaAdministrativos()
        gv_funcionario.DataBind()
    End Sub



    Protected Sub txt_ci_TextChanged(sender As Object, e As EventArgs) Handles txt_ci.TextChanged
        If gv_funcionario.Rows.Count > 0 Then
            For i = 0 To gv_funcionario.Rows.Count - 1
                If txt_ci.Text = gv_funcionario.Rows(i).Cells(0).Text Then
                    lbl_funcionario.Text = gv_funcionario.Rows(i).Cells(1).Text + " " + gv_funcionario.Rows(i).Cells(2).Text + " " + gv_funcionario.Rows(i).Cells(3).Text
                End If
            Next

        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql_ds_enceres.Insert()
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Se Registro Exitosamente su Informacion"", type: ""success"" });</script>")
        gv_enceres.DataBind()

    End Sub
End Class
