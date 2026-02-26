
Partial Class SEC_DIR_ACD_cargas_horarias
    Inherits System.Web.UI.Page


    Protected Sub gv_carga_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_carga.SelectedIndexChanged
        txt_cidoc.Text = gv_carga.SelectedRow.Cells(1).Text
        gv_detalle.DataBind()

    End Sub
End Class
