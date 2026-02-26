
Imports System.IO

Partial Class act_fijos_equipos
    Inherits System.Web.UI.Page

    Dim ws As wsr3.WebServiceSoapClient = New wsr3.WebServiceSoapClient
    Dim gv_funcionario As New GridView
    Protected Sub txt_ci_TextChanged(sender As Object, e As EventArgs) Handles txt_ci.TextChanged
        If gv_funcionario.Rows.Count > 0 Then
            For i = 0 To gv_funcionario.Rows.Count - 1
                If txt_ci.Text = gv_funcionario.Rows(i).Cells(0).Text Then
                    lbl_funcionario.Text = gv_funcionario.Rows(i).Cells(1).Text + " " + gv_funcionario.Rows(i).Cells(2).Text + " " + gv_funcionario.Rows(i).Cells(3).Text
                End If
            Next

        End If
    End Sub

    Private Sub act_fijos_equipos_Load(sender As Object, e As EventArgs) Handles Me.Load

        gv_funcionario.DataSource = ws.ListaAdministrativos()
        gv_funcionario.DataBind()

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim exob As String
        exob = Path.GetExtension(Me.FileUpload1.FileName)
        txt_img_guarda.Text = txt_ci.Text + "_" + txt_modelo.Text + "_" + txt_nro_serie.Text + exob
        'txt_img_guarda.Text = exob
        Me.FileUpload1.SaveAs(Server.MapPath("~") & "\equipos\" & txt_img_guarda.Text)
        sql_ds_bien.Insert()
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Se Registro Exitosamente su Informacion"", type: ""success"" });</script>")
        gv_bien.DataBind()

    End Sub
End Class
