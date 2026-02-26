
Partial Class DIR_CAR_eliminar_horario
    Inherits System.Web.UI.Page


    Protected Sub gv_horarios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarios.SelectedIndexChanged
        txt_id_horairo.Text = gv_horarios.SelectedRow.Cells(2).Text
        txt_objeto.Text = gv_horarios.SelectedRow.Cells(1).Text + "" + gv_horarios.SelectedRow.Cells(2).Text + "" + gv_horarios.SelectedRow.Cells(3).Text + "" + gv_horarios.SelectedRow.Cells(5).Text + "" + gv_horarios.SelectedRow.Cells(6).Text + "" + gv_horarios.SelectedRow.Cells(7).Text
        sql_ds_carrera.Insert()

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

            ' lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
            ' txt_cius.Text = Session("idus")

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

    Private Sub gv_horarios_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv_horarios.RowDataBound
        'If e.Row.RowType = DataControlRowType.DataRow Then

        '    ' El botón Select es el primer control de la primera celda
        '    Dim btnEliminar As Button = CType(e.Row.Cells(0).Controls(0), Button)

        '    btnEliminar.OnClientClick = "return confirm('¿Está seguro de eliminar este horario?');"

        'End If
    End Sub
End Class
