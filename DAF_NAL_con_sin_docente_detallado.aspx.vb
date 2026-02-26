Imports System.Data
Imports System.Data.SqlClient
Partial Class DAF_NAL_con_sin_docente_detallado
    Inherits System.Web.UI.Page

    Private Sub RR_HH_con_sin_docente_detallado_Load(sender As Object, e As EventArgs) Handles Me.Load
        gv_con_doc.DataBind()
        GridView1.DataBind()

        If gv_con_doc.Rows.Count > 0 Then
            lbl_condoc.Text = gv_con_doc.Rows.Count
            Button2.Visible = True

        Else
            lbl_condoc.Text = "0"
            Button2.Visible = False
        End If

        If GridView1.Rows.Count > 0 Then
            lbl_sin_doc.Text = GridView1.Rows.Count
            Button1.Visible = True

        Else
            lbl_sin_doc.Text = "0"
            Button1.Visible = False
        End If


        Dim vista As DataView = CType(sql_ds_anterior.Select(DataSourceSelectArguments.Empty), DataView)
        If vista IsNot Nothing AndAlso vista.Count > 0 Then
            lbl_anterior_ges.Text = "Total registros: " & vista(0)(0).ToString()
        Else
            lbl_anterior_ges.Text = "No se encontraron registros."
        End If

        Dim vista2 As DataView = CType(sql_ds_actual.Select(DataSourceSelectArguments.Empty), DataView)
        If vista2 IsNot Nothing AndAlso vista2.Count > 0 Then
            lbl_actual_ges.Text = "Total registros: " & vista2(0)(0).ToString()
        Else
            lbl_actual_ges.Text = "No se encontraron registros."
        End If


    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If gv_con_doc.Rows.Count > 0 Then
            Dim tw As New IO.StringWriter()
            Dim hw As New System.Web.UI.HtmlTextWriter(tw)
            Dim frm As HtmlForm = New HtmlForm()
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("content-disposition", "attachment;filename=" & "Horarios" & ".xls")
            Response.Charset = ""
            EnableViewState = False
            Controls.Add(frm)
            frm.Controls.Add(gv_con_doc) 'GridView1 nombre del GridView suyo
            frm.RenderControl(hw)
            Response.Write(tw.ToString())
            Response.End()
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If GridView1.Rows.Count > 0 Then
            Dim tw As New IO.StringWriter()
            Dim hw As New System.Web.UI.HtmlTextWriter(tw)
            Dim frm As HtmlForm = New HtmlForm()
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("content-disposition", "attachment;filename=" & "Horarios" & ".xls")
            Response.Charset = ""
            EnableViewState = False
            Controls.Add(frm)
            frm.Controls.Add(GridView1) 'GridView1 nombre del GridView suyo
            frm.RenderControl(hw)
            Response.Write(tw.ToString())
            Response.End()
        End If
    End Sub
End Class
