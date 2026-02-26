
Partial Class actualizacion_comun
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        For Each row As GridViewRow In GridView1.Rows
            'Dim hra_inicio, hra_fin, ci, grupo, sigla, grupoarmado As String

            txt_id_hor.Text = row.Cells(0).Text

            sql_ds_comun.Update()

            'If ci = ci And sigla = row.Cells(9).Text Then
            '    grupoarmado = grupo
            '    grupoarmado = grupoarmado + "-" + grupo
            '    txt_grupo.Text = grupoarmado
            'End If




        Next
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim fecha As String
        For i = 0 To gv_demas.Rows.Count - 1
            fecha = FormatDateTime(gv_demas.Rows(i).Cells(2).Text, DateFormat.ShortDate)
            txt_fecha.Text = fecha + " " + gv_demas.Rows(i).Cells(17).Text
            txt_id.Text = gv_demas.Rows(i).Cells(0).Text
            sql_ds_demas.Update()

        Next

    End Sub
End Class
