
Partial Class ADM_agregar_datos_financieros
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        txt_banco.text = bancos.Value



        sql_ds_financiero.Insert()

    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
