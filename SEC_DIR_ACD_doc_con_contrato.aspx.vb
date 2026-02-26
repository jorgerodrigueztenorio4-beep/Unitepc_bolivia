
Partial Class SEC_DIR_ACD_doc_con_contrato
    Inherits System.Web.UI.Page
    Dim wc As ws1.ParaControlWebSoapClient = New ws1.ParaControlWebSoapClient

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_contrato.DataSource = wc.PlanesDeEstudio(1, "N", "CARMED")
        gv_contrato.DataBind()

    End Sub
End Class
