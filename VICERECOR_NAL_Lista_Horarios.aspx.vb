
Partial Class VICERECOR_NAL_Lista_Horarios
    Inherits System.Web.UI.Page


    Protected Sub gv_horarios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarios.SelectedIndexChanged
        txt_id_horairo.Text = gv_horarios.SelectedRow.Cells(2).Text
        gv_horarios.Visible = False
        ddl_carrera.Visible = False
        ddl_sede.Visible = False
        Button2.Visible = True
        txt_hora.Visible = True
        Button1.Visible = True
        gv_selec.DataBind()

        gv_selec.Visible = True
    End Sub

    Private Sub SEC_DIR_ACD_Lista_Horarios_Load(sender As Object, e As EventArgs) Handles Me.Load
        'If Session("idus") <> "" Then

        '    lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
        '    ' txt_cius.Text = Session("idus")



        'Else
        '    Response.Redirect("~/sesion.aspx")
        'End If
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
End Class
