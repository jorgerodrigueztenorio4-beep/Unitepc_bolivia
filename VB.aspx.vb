Imports System.Data
Imports System.Drawing
Imports System.Configuration
Imports System.Data.SqlClient

Partial Class VB
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Me.BindGrid()
            'GridView1.DataBind()

        End If
    End Sub

    'Private Sub BindGrid()
    '    Dim query As String = "SELECT OrderID,"
    '    query += "(SELECT ProductName FROM Products WHERE ProductID = details.ProductId) ProductName,"
    '    query += "(Quantity * UnitPrice) Price"
    '    query += " FROM [Order Details] details"
    '    query += " WHERE OrderID IN (10248, 10249, 10250)"
    '    query += " ORDER BY OrderID"
    '    Dim conString As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
    '    Using con As New SqlConnection(conString)
    '        Using cmd As New SqlCommand(query)
    '            Using sda As New SqlDataAdapter()
    '                cmd.Connection = con
    '                sda.SelectCommand = cmd
    '                Using dt As New DataTable()
    '                    sda.Fill(dt)
    '                    GridView1.DataSource = dt
    '                    GridView1.DataBind()
    '                End Using
    '            End Using
    '        End Using
    '    End Using
    'End Sub

    Private currentId As String = 0
    Private subTotal As Decimal = 0
    Private total As Decimal = 0
    Private subTotalRowIndex As Integer = 0
    Protected Sub OnRowCreated(sender As Object, e As GridViewRowEventArgs)

        subTotal = 0
        If GridView1.Rows.Count > 0 Then
            If e.Row.RowType = DataControlRowType.DataRow Then
                GridView1.DataBind()

                Dim dt As DataTable = TryCast(e.Row.DataItem, DataRowView).DataView.Table
                '            Dim orderId As String = dt.Rows(e.Row.RowIndex)("ci_doc")
                '            total += Convert.ToDecimal(dt.Rows(e.Row.RowIndex)("horas"))
                '            If orderId <> currentId Then
                '                If e.Row.RowIndex > 0 Then
                '                    For i As Integer = subTotalRowIndex To e.Row.RowIndex - 1
                '                        subTotal += Convert.ToDecimal(GridView1.Rows(i).Cells(18).Text)
                '                    Next
                '                    Me.AddTotalRow("Sub Total", subTotal.ToString("N2"))
                '                    subTotalRowIndex = e.Row.RowIndex
                '                End If
                '                currentId = orderId
                '            End If
            End If
        End If

    End Sub

    Private Sub AddTotalRow(labelText As String, value As String)
        Dim row As New GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Normal)
        row.BackColor = ColorTranslator.FromHtml("#007bff")
        'Empty Cell
        row.Cells.AddRange(New TableCell(2) {
            New TableCell(),
            New TableCell() With {
          .Text = labelText,
          .HorizontalAlign = HorizontalAlign.Right
        }, New TableCell() With {
          .Text = value,
          .HorizontalAlign = HorizontalAlign.Right
        }})

        GridView1.Controls(0).Controls.Add(row)
    End Sub
    Protected Sub OnDataBound(sender As Object, e As EventArgs)
        For i As Integer = subTotalRowIndex To GridView1.Rows.Count - 1
            subTotal += Convert.ToDecimal(GridView1.Rows(i).Cells(18).Text)
        Next
        Me.AddTotalRow("Sub Total", subTotal.ToString("N2"))
        Me.AddTotalRow("Total", total.ToString("N2"))
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        GridView1.DataBind()

    End Sub
End Class

