
Partial Class DIR_CAR_horarios
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_horarios_virtuales_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            txt_username.Text = Session("usuario")
            txt_sede.Text = Session("sede")
            txt_sigla_car.Text = Session("siglacar")
            lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
            txt_sede.Text = Session("sede")


        Else
            Response.Redirect("~/sesion.aspx")
        End If


    End Sub

    Protected Sub gv_horarios_v_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarios_v.SelectedIndexChanged
        txt_idhora.Text = gv_horarios_v.SelectedRow.Cells(1).Text

        sql_ds_carrera.Delete()
        sql_virtuales.Delete()


        gv_horarios_v.DataBind()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.gv_horarios_v.DataBind()
        If gv_horarios_v.Rows.Count > 0 Then
            Button1.Visible = True
        Else
            Button1.Visible = False
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_horarios_v.DataBind()
        If gv_horarios_v.Rows.Count > 0 Then
            Dim tw As New IO.StringWriter()
            Dim hw As New System.Web.UI.HtmlTextWriter(tw)
            Dim frm As HtmlForm = New HtmlForm()
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("content-disposition", "attachment;filename=" & "Horarios" & ".xls")
            Response.Charset = ""
            EnableViewState = False
            Controls.Add(frm)
            frm.Controls.Add(gv_horarios_v) 'GridView1 nombre del GridView suyo
            frm.RenderControl(hw)
            Response.Write(tw.ToString())
            Response.End()
        End If
    End Sub
End Class
