
Partial Class SEC_DIR_ACD_eliminar_horario
    Inherits System.Web.UI.Page


    Protected Sub gv_horarios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarios.SelectedIndexChanged
        txt_id_horairo.Text = gv_horarios.SelectedRow.Cells(2).Text

        sql_horarios.Delete()
        sql_ds_selec.Delete()
        gv_horarios.DataBind()


        'gv_horarios.Visible = False
        'ddl_carrera.Visible = False
        'ddl_sede.Visible = False
        'Button2.Visible = True
        ''txt_hora.Visible = True
        'Button1.Visible = True
        'gv_selec.DataBind()

        'gv_selec.Visible = True
    End Sub

    Private Sub SEC_DIR_ACD_Lista_Horarios_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
            ' txt_cius.Text = Session("idus")



        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub




End Class
