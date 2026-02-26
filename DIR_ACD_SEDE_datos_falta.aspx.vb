
Partial Class DIR_ACD_SEDE_datos_falta
    Inherits System.Web.UI.Page

    Private Sub DIR_ACD_SEDE_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " ---> " + Session("sede_nombre") + " ---> " + Session("nombre_usuario")
            txt_sede.Text = Session("sede")
            'txt_ci_us.Text = Session("idus")


        Else
            Response.Redirect("~/sesion.aspx")
        End If






        gv_datos.DataBind()

        For i = 0 To CInt(gv_datos.Rows.Count) - 1
            If gv_datos.Rows(i).Cells(10).Text = "&nbsp;" Then
                gv_datos.Rows(i).Cells(10).BackColor = Drawing.ColorTranslator.FromHtml("#ffb1b0")
                'gv_datos.Rows(i).Cells(8).BackColor = Drawing.ColorTranslator.FromHtml("#ffb1b0")
                'gv_datos.Rows(i).Cells(11).BackColor = Drawing.ColorTranslator.FromHtml("#ffe3b0")
            End If
            If gv_datos.Rows(i).Cells(12).Text = "&nbsp;" Or gv_datos.Rows(i).Cells(12).Text = "0" Then
                gv_datos.Rows(i).Cells(12).BackColor = Drawing.ColorTranslator.FromHtml("#ffe3b0")
            End If
            If gv_datos.Rows(i).Cells(13).Text = "&nbsp;" Or gv_datos.Rows(i).Cells(13).Text = "0" Then
                gv_datos.Rows(i).Cells(13).BackColor = Drawing.ColorTranslator.FromHtml("#a4ff97")
            End If
            If gv_datos.Rows(i).Cells(16).Text = "&nbsp;" Or gv_datos.Rows(i).Cells(16).Text = "sinmail@gmail.com" Or gv_datos.Rows(i).Cells(16).Text = "NULL" Then
                gv_datos.Rows(i).Cells(16).BackColor = Drawing.ColorTranslator.FromHtml("#cd97ff")
            End If
        Next
    End Sub

    Protected Sub gv_datos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_datos.SelectedIndexChanged
        txt_vacio.Text = gv_datos.SelectedRow.Cells(16).Text
    End Sub
End Class
