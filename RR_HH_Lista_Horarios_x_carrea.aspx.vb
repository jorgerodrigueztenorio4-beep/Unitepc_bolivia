
Partial Class RR_HH_Lista_Horarios_x_carrea
    Inherits System.Web.UI.Page


    Protected Sub gv_horarios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarios.SelectedIndexChanged

        txt_id_horairo.Text = gv_horarios.SelectedRow.Cells(2).Text

        sql_horarios.Delete()
        sql_ds_selec.Delete()
        gv_horarios.DataBind()


    End Sub

    Private Sub SEC_DIR_ACD_Lista_Horarios_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")

        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_selec.DataBind()

        If gv_selec.Rows.Count >= 1 Then
            txt_id_desig.Text = gv_selec.Rows(0).Cells(0).Text
            sql_ds_selec.Update()
            gv_horarios.DataBind()
            gv_selec.Visible = False
            Button2.Visible = True

            Button1.Visible = False
            txt_hora.Visible = False
            ddl_sede.Visible = True
            ddl_carrera.Visible = True
            gv_horarios.Visible = True
            txt_hora.Text = ""
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        gv_horarios.DataBind()
        gv_selec.Visible = False
        Button2.Visible = False

        Button1.Visible = False
        txt_hora.Visible = False
        ddl_sede.Visible = True
        ddl_carrera.Visible = True
        gv_horarios.Visible = True
        txt_hora.Text = ""
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        'gv_horarios_v.DataBind()
        If gv_horarios.Rows.Count > 0 Then
            Dim tw As New IO.StringWriter()
            Dim hw As New System.Web.UI.HtmlTextWriter(tw)
            Dim frm As HtmlForm = New HtmlForm()
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("content-disposition", "attachment;filename=" & "Horarios" & ".xls")
            Response.Charset = ""
            EnableViewState = False
            Controls.Add(frm)
            frm.Controls.Add(gv_horarios) 'GridView1 nombre del GridView suyo
            frm.RenderControl(hw)
            Response.Write(tw.ToString())
            Response.End()
        End If
    End Sub

    ' Diccionario para guardar color por materia
    Private Shared ColoresMateria As New Dictionary(Of String, Drawing.Color)

    ' Paleta de colores suaves
    Private Shared ReadOnly Paleta() As Drawing.Color = {
    Drawing.Color.FromArgb(224, 242, 254),
    Drawing.Color.FromArgb(232, 245, 233),
    Drawing.Color.FromArgb(255, 243, 224),
    Drawing.Color.FromArgb(243, 229, 245),
    Drawing.Color.FromArgb(232, 234, 246)
}

    Private Shared colorIndex As Integer = 0

    Protected Sub gv_horarios_RowDataBound(sender As Object, e As GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim materia As String = DataBinder.Eval(e.Row.DataItem, "Materia").ToString()
            Dim sigla As String = DataBinder.Eval(e.Row.DataItem, "SiglaP").ToString()

            ' Clave única por materia
            Dim key As String = materia & "|" & sigla

            ' Asignar color si no existe
            If Not ColoresMateria.ContainsKey(key) Then
                ColoresMateria(key) = Paleta(colorIndex Mod Paleta.Length)
                colorIndex += 1
            End If

            ' Aplicar color a la fila
            e.Row.BackColor = ColoresMateria(key)

        End If

        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim tipoClase As String = DataBinder.Eval(e.Row.DataItem, "tipo_clase").ToString().ToLower()
            Dim claseTeorica As Object = DataBinder.Eval(e.Row.DataItem, "clase_teorica")

            ' Condición: práctica sin clase teórica
            If tipoClase = "practico" AndAlso
               (claseTeorica Is DBNull.Value OrElse String.IsNullOrWhiteSpace(claseTeorica.ToString())) Then

                Dim celdaTeorica As TableCell = e.Row.Cells(7)

                celdaTeorica.BackColor = Drawing.Color.FromArgb(255, 205, 210) ' rojo suave
                celdaTeorica.ForeColor = Drawing.Color.DarkRed
                celdaTeorica.Font.Bold = True
                celdaTeorica.Text = "⚠ SIN TEÓRICA"

            End If

        End If

    End Sub



End Class
