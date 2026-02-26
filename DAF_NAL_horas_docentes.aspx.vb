
Partial Class DAF_NAL_horas_docentes
    Inherits System.Web.UI.Page
    Dim qtyTotal As Integer = 0
    Dim storid As String = 0
    Dim rowIndex As Integer = 1

    Protected Sub gv_docentes_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_docentes.SelectedIndexChanged

    End Sub

    Private Sub gv_docentes_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv_docentes.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            storid = (DataBinder.Eval(e.Row.DataItem, "id").ToString())
            Dim tmpTotal As Integer = Convert.ToInt32((DataBinder.Eval(e.Row.DataItem, "Minutos").ToString()) / 45)
            qtyTotal += tmpTotal
        End If
    End Sub

    Private Sub gv_docentes_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_docentes.RowCreated
        Dim newRow As Boolean = False
        If (storid > 0) AndAlso (DataBinder.Eval(e.Row.DataItem, "id") IsNot Nothing) Then
            If storid <> (DataBinder.Eval(e.Row.DataItem, "id").ToString()) Then
                newRow = True
            End If
        End If

        If (storid > 0) AndAlso (DataBinder.Eval(e.Row.DataItem, "id") Is Nothing) Then
            newRow = True
            rowIndex = 0
        End If
        If newRow Then
            Dim GridView1 As GridView = DirectCast(sender, GridView)
            Dim NewTotalRow As New GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert)
            NewTotalRow.Font.Bold = True
            NewTotalRow.BackColor = System.Drawing.Color.FromName("#a67aff")
            NewTotalRow.ForeColor = System.Drawing.Color.White
            Dim HeaderCell As New TableCell()
            HeaderCell.Text = "Sub Total:"
            HeaderCell.HorizontalAlign = HorizontalAlign.Left
            HeaderCell.ColumnSpan = 8
            NewTotalRow.Cells.Add(HeaderCell)
            HeaderCell = New TableCell()
            HeaderCell.HorizontalAlign = HorizontalAlign.Right
            HeaderCell.Text = qtyTotal.ToString()
            NewTotalRow.Cells.Add(HeaderCell)
            GridView1.Controls(0).Controls.AddAt(e.Row.RowIndex + rowIndex, NewTotalRow)
            rowIndex += 1
            qtyTotal = 0
        End If
    End Sub
End Class
