
Partial Class DIR_ACD_eliminar_horario
    Inherits System.Web.UI.Page


    Protected Sub gv_horarios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarios.SelectedIndexChanged
        txt_id_horairo.Text = gv_horarios.SelectedRow.Cells(2).Text
        txt_objeto.Text = "Direccion Academica: " + gv_horarios.SelectedRow.Cells(3).Text + "- " + gv_horarios.SelectedRow.Cells(4).Text + "- " + gv_horarios.SelectedRow.Cells(5).Text + "- " + gv_horarios.SelectedRow.Cells(6).Text + "- " + gv_horarios.SelectedRow.Cells(7).Text + "- " + gv_horarios.SelectedRow.Cells(8).Text + "- " + gv_horarios.SelectedRow.Cells(9).Text + "- " + gv_horarios.SelectedRow.Cells(10).Text + "- " + gv_horarios.SelectedRow.Cells(11).Text
        sql_horarios.Delete()
        sql_ds_selec.Delete()
        sql_ds_eliminacion.Insert()

        gv_horarios.DataBind()



    End Sub

    Private Sub SEC_DIR_ACD_Lista_Horarios_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
            ' txt_cius.Text = Session("idus")
            ' txt_sede.text = Session("sede")
            'txt_sigla_car.Text = Session("siglacar")
            'lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
            txt_ci_delete.Text = Session("nombre_usuario")
            'txt_sede.Text = Session("sede")


        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub




End Class
