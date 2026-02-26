
Imports System.Data
Imports System.Drawing

Partial Class contratos_horarios

    Inherits System.Web.UI.Page
    Dim WSEBSE As wsr2.ParaControlWebSoapClient = New wsr2.ParaControlWebSoapClient

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_lista.DataSource = WSEBSE.RRHHListaDeDocentes2023()

        gv_lista.DataBind()
        For filas As Integer = 0 To gv_lista.Rows.Count - 1
            txt_ci.Text = gv_lista.Rows(filas).Cells(0).Text
            txt_nombre.Text = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(1).Text)
            txt_ppa.Text = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(2).Text)
            txt_sap.Text = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(3).Text)
            gv_existe.DataBind()

        Next
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

        For filas As Integer = 0 To gv_lista.Rows.Count - 1
            For filash As Integer = 0 To GV_HORARIOS.Rows.Count - 1
                If gv_lista.Rows(filas).Cells(5).Text = GV_HORARIOS.Rows(filash).Cells(6).Text + "1" _
                    And gv_lista.Rows(filas).Cells(8).Text = GV_HORARIOS.Rows(filash).Cells(10).Text _
                    And RTrim(gv_lista.Rows(filas).Cells(6).Text) = GV_HORARIOS.Rows(filash).Cells(8).Text _
                    And gv_lista.Rows(filas).Cells(9).Text = GV_HORARIOS.Rows(filash).Cells(9).Text _
                    And gv_lista.Rows(filas).Cells(10).Text = GV_HORARIOS.Rows(filash).Cells(5).Text Then
                    gv_lista.Rows(filas).BackColor = Color.LightGreen
                End If
                If gv_lista.Rows(filas).BackColor <> Color.LightGreen Then
                    gv_lista.Rows(filas).BackColor = Color.Red
                End If


            Next
        Next
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click

        If gv_lista.Rows.Count > 0 Then
            Dim tw As New IO.StringWriter()
            Dim hw As New System.Web.UI.HtmlTextWriter(tw)
            Dim frm As HtmlForm = New HtmlForm()
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("content-disposition", "attachment;filename=" & "Horarios" & ".xls")
            Response.Charset = ""
            EnableViewState = False
            Controls.Add(frm)
            frm.Controls.Add(gv_lista) 'GridView1 nombre del GridView suyo
            frm.RenderControl(hw)
            Response.Write(tw.ToString())
            Response.End()
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then
        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub

    Private Sub gv_lista_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv_lista.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' Suponiendo que la columna a modificar es la segunda (índice 1)
            Dim cell As TableCell = e.Row.Cells(8)

            ' Modificar el contenido de la celda
            If cell.Text = "1" Then
                cell.Text = "Cochabamba"
                cell.BackColor = System.Drawing.Color.Yellow
            End If
            If cell.Text = "3" Then
                cell.Text = "Cobija"
                cell.BackColor = System.Drawing.Color.Yellow
            End If
            If cell.Text = "4" Then
                cell.Text = "La Paz"
                cell.BackColor = System.Drawing.Color.Yellow
            End If
            If cell.Text = "5" Then
                cell.Text = "Ivirgarzama"
                cell.BackColor = System.Drawing.Color.Yellow
            End If
            If cell.Text = "6" Then
                cell.Text = "Puerto Quijarro"
                cell.BackColor = System.Drawing.Color.Yellow
            End If
            If cell.Text = "7" Then
                cell.Text = "Santa Cruz"
                cell.BackColor = System.Drawing.Color.Yellow
            End If
            If cell.Text = "9" Then
                cell.Text = "El Alto"
                cell.BackColor = System.Drawing.Color.Yellow
            End If
            If cell.Text = "12" Then
                cell.Text = "Guayaramirin"
                cell.BackColor = System.Drawing.Color.Yellow
            End If
        End If
    End Sub
End Class
