
Partial Class agregar_bloquer_asistencia
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        For filas = 0 To GridView1.Rows.Count - 1
            For filas2 = 0 To GridView2.Rows.Count - 1
                If GridView1.Rows(filas).Cells(0).Text = GridView2.Rows(filas2).Cells(0).Text Then
                    txt_bloque.Text = GridView1.Rows(filas).Cells(1).Text
                    txt_idhorario.Text = GridView1.Rows(filas).Cells(0).Text
                    sql_ds_horario_asisencia.Update()

                End If
            Next
        Next
    End Sub
End Class
