
Partial Class DIR_CAR_horarios_virtuales
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_horarios_virtuales_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_cius.Text = Session("idus")
            txt_sede.text = Session("sede")
            txt_sigla_car.Text = Session("siglacar")
            lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
            txt_sede.Text = Session("sede")


        Else
            Response.Redirect("~/sesion.aspx")
        End If


    End Sub



    'Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
    '    Me.gv_horarios_v.DataBind()
    '    If gv_horarios_v.Rows.Count > 0 Then
    '        Button1.Visible = True
    '    Else
    '        Button1.Visible = False
    '    End If
    'End Sub

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

    Protected Sub gv_horarios_v_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gv_horarios_v.RowCommand

        Dim index As Integer = Convert.ToInt32(e.CommandArgument)
        Dim idHorario As String = gv_horarios_v.DataKeys(index).Value.ToString()

        txt_idhora.Text = idHorario
        lblIdHorario.Text = idHorario

        Select Case e.CommandName

            Case "modal"
                Dim script As String = "setTimeout(function(){ openModal(); }, 100);"
                ScriptManager.RegisterStartupScript(Me, Me.GetType(), "PopModal", script, True)

            Case "eliminar"
                ' EliminarHorario(idHorario)
                gv_horarios_v.DataBind()

        End Select

    End Sub


    Private Sub EliminarHorario(idHorario As String)
        'txt_idhora.Text = idHorario
        'sql_virtuales.Delete()
    End Sub
    Protected Sub ddl_Gestion_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_Gestion.SelectedIndexChanged
        gv_horarios_v.DataBind()

        If gv_horarios_v.Rows.Count > 0 Then
            lbl_contador.Text = gv_horarios_v.Rows.Count.ToString

        End If
    End Sub


End Class
