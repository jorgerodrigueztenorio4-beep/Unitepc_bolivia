
Partial Class agregar_teoricos_a_practicos
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        For i = 0 To GridView2.Rows.Count - 1
            For j = 0 To GridView1.Rows.Count - 1
                Dim a As Integer = 0
                If GridView2.Rows(i).Cells(1).Text = GridView1.Rows(j).Cells(4).Text And GridView2.Rows(i).Cells(3).Text.Trim = GridView1.Rows(j).Cells(1).Text.Trim And GridView2.Rows(i).Cells(4).Text.Trim.Contains(GridView1.Rows(j).Cells(3).Text.Trim) Then
                    txt_gteo.Text = GridView1.Rows(j).Cells(2).Text
                    txt_id_horario.Text = GridView2.Rows(i).Cells(0).Text
                    'txt_gteo.Text = a + 1
                    sql_clases.Update()
                End If
            Next
        Next
    End Sub
End Class
