
Partial Class RR_HH_editar_eliminar_respaldos
    Inherits System.Web.UI.Page


    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        txt_id_ingsal.Text = GridView1.SelectedRow.Cells(1).Text
        gv_respaldos.DataBind()
        If gv_respaldos.Rows.Count > 0 Then
            txt_doc.text = gv_respaldos.Rows(0).Cells(1).Text
            sql_ds_horas.Delete()
            'sql_ds_respaldos.Delete()

            'Dim ArchivoBorrar As String


            ' ArchivoBorrar = Server.MapPath("~") & "\respaldos\" & txt_doc.Text






            'If System.IO.File.Exists(ArchivoBorrar) = True Then

            '    System.IO.File.Delete(ArchivoBorrar)

            'End If
            ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Se borro el Respaldo Seleccionado"", type: ""success"" });</script>")

            GridView1.DataBind()





        End If


    End Sub
End Class
