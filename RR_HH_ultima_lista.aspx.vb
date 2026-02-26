
Partial Class RR_HH_ultima_lista
    Inherits System.Web.UI.Page
    Dim qtyTotal As Integer = 0
    Dim storid As Integer = 0
    Dim rowIndex As Integer = 1
    Private Sub gv_formulario_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv_formulario.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "ci_doc").ToString())
            Dim tmpTotal As Integer = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "horas").ToString())
            qtyTotal += tmpTotal
        End If
    End Sub

    Private Sub gv_formulario_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_formulario.RowCreated
        Dim newRow As Boolean = False
        If (storid > 0) AndAlso (DataBinder.Eval(e.Row.DataItem, "ci_doc") IsNot Nothing) Then
            If storid <> Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "ci_doc").ToString()) Then
                newRow = True
            End If
        End If
        If (storid > 0) AndAlso (DataBinder.Eval(e.Row.DataItem, "ci_doc") Is Nothing) Then
            newRow = True
            rowIndex = 0
        End If
        If newRow Then
            Dim GridView1 As GridView = DirectCast(sender, GridView)
            Dim NewTotalRow As New GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert)
            NewTotalRow.Font.Bold = True
            NewTotalRow.BackColor = System.Drawing.Color.Gray
            NewTotalRow.ForeColor = System.Drawing.Color.White
            Dim HeaderCell As New TableCell()
            HeaderCell.Text = "Sub Total:"
            HeaderCell.HorizontalAlign = HorizontalAlign.Left
            HeaderCell.ColumnSpan = 20
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
