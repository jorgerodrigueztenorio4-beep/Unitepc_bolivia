
Partial Class ADM_actualizar
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_horarios_virtuales_Load(sender As Object, e As EventArgs) Handles Me.Load
        'If Session("idus") <> "" Then

        '    lbl_cargo.Text = Session("rol_nombre") + Session("nombrecar") + "--->" + Session("nombre_usuario")
        '    'txt_cius.Text = Session("idus")



        'Else
        '    Response.Redirect("~/sesion.aspx")
        'End If
    End Sub
    Protected Sub gv_horarios_v_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarios_v.SelectedIndexChanged
        'txt_id_horario.Text = gv_horarios_v.SelectedRow.Cells(1).Text
        'sql_ds_carrera.Delete()
        'sql_virtuales.Delete()
        'gv_horarios_v.DataBind()

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        For Each row As GridViewRow In gv_horarios_v.Rows

            txt_id_desig.Text = row.Cells(1).Text
            txt_horas.Text = row.Cells(8).Text
            sql_virtuales.Update()

        Next
    End Sub
End Class
