
Partial Class ADM_agregar_datos_contrato
    Inherits System.Web.UI.Page

    Protected Sub Unnamed2_Click(sender As Object, e As EventArgs) Handles btn_agregar.Click
        txt_tipocon.Text = RadioButtonList1.SelectedValue.ToString
    End Sub

End Class
