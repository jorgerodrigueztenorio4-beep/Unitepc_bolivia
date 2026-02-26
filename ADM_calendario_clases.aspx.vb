
Partial Class ADM_calendario_clases
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim Total As Double = 0


        For i = 0 To GridView1.Rows.Count - 1
            Total = Total + Convert.ToDouble(GridView1.Rows(i).Cells(5).Text)

        Next
        txt_horas_designada.Text = Total

    End Sub
End Class
