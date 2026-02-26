
Partial Class DIR_ACD_SEDE_cuadrar_carrera
    Inherits System.Web.UI.Page
    Dim total As Integer
    Dim total2 As Integer
    Private Sub gv_docente_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv_docente.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            total = total + DataBinder.Eval(e.Row.DataItem, "Hras_academica")
            total2 = total2 + DataBinder.Eval(e.Row.DataItem, "horas")
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(5).Text = total.ToString
            e.Row.Cells(5).Font.Bold = True
            e.Row.Cells(5).Font.Size = 15
            e.Row.Cells(8).Text = total2.ToString
            e.Row.Cells(8).Font.Bold = True
            e.Row.Cells(8).Font.Size = 15
        End If

    End Sub

    Private Sub DIR_ACD_Horas_x_docente_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " ---> " + Session("sede_nombre") + " ---> " + Session("nombre_usuario")
            txt_sede.Text = Session("sede")
            'txt_ci_us.Text = Session("idus")


        Else
            Response.Redirect("~/sesion.aspx")
        End If


        gv_docente.DataBind()

        For i = 0 To CInt(gv_docente.Rows.Count) - 1
            If gv_docente.Rows(i).Cells(5).Text <> gv_docente.Rows(i).Cells(8).Text Then
                gv_docente.Rows(i).Cells(5).BackColor = Drawing.ColorTranslator.FromHtml("#ffb1b0")
                gv_docente.Rows(i).Cells(8).BackColor = Drawing.ColorTranslator.FromHtml("#ffb1b0")
                gv_docente.Rows(i).Cells(11).BackColor = Drawing.ColorTranslator.FromHtml("#ffe3b0")
            End If
        Next
    End Sub
End Class
