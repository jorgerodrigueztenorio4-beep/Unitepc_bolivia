
Partial Class fechas_nuevoformato
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        For i = 0 To GridView1.Rows.Count - 1
            'txt_fechareg.Text = DateTime.Parse(GridView1.Rows(i).Cells(22).Text).ToString("dd/MM/yyyy") + " 01:00:00"
            'txt_id_ing.Text = GridView1.Rows(i).Cells(0).Text
            'sql_fechas.Update()
            txt_fechareg.Text = GridView1.Rows(i).Cells(7).Text
            txt_id_ing.Text = GridView1.Rows(i).Cells(0).Text
            sql_fechas.Update()

        Next

    End Sub
End Class
