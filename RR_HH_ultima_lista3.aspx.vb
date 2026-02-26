
Partial Class RR_HH_ultima_lista3
    Inherits System.Web.UI.Page
    Dim qtyTotal As Integer = 0
    Dim storid As String = 0
    Dim rowIndex As Integer = 1
    Private Sub gv_formulario_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv_formulario.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            storid = (DataBinder.Eval(e.Row.DataItem, "id").ToString())
            Dim tmpTotal As Integer = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "horas").ToString())
            qtyTotal += tmpTotal
        End If
    End Sub

    Private Sub gv_formulario_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_formulario.RowCreated
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
            HeaderCell.ColumnSpan = 18
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

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If gv_formulario.Rows.Count > 0 Then
            Dim tw As New IO.StringWriter()
            Dim hw As New System.Web.UI.HtmlTextWriter(tw)
            Dim frm As HtmlForm = New HtmlForm()
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("content-disposition", "attachment;filename=" & "Reporte" & ".xls")
            Response.Charset = ""
            EnableViewState = False
            Controls.Add(frm)
            frm.Controls.Add(gv_formulario) 'GridView1 nombre del GridView suyo
            frm.RenderControl(hw)
            Response.Write(tw.ToString())
            Response.End()
        End If

    End Sub

    Private Sub RR_HH_ultima_lista2_Load(sender As Object, e As EventArgs) Handles Me.Load
        gv_formulario.DataBind()

        If gv_formulario.Rows.Count > 1 Then
            Button1.Visible = True
        ElseIf gv_formulario.Rows.Count <= 0 Then
            Button1.Visible = False
        End If
    End Sub






    Protected Sub gv_formulario_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_formulario.SelectedIndexChanged

    End Sub
End Class
