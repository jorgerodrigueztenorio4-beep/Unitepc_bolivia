
Partial Class DIR_CAR_programar_horario
    Inherits System.Web.UI.Page
    '  Dim ws1 As ws1.ParaControlWebSoapClient = New ws1.ParaControlWebSoapClient
    Private Sub DIR_CAR_programar_horario_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            txt_sede.Text = Session("sede")
            txt_sigla_carrera.Text = Session("siglacar")
            txt_ciusuario.Text = Session("idus")
            txt_id_sede.Text = Session("sede")

        Else
            Response.Redirect("~/sesion.aspx")
        End If

    End Sub
    Protected Sub ddl_ant_nuevo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_ant_nuevo.SelectedIndexChanged
        'ddl_materias.DataSource = ws1.ListaDeMateriasXCarrera(1, ddl_ant_nuevo.SelectedValue, Session("siglacar"))
        'ddl_materias.DataValueField = "SIGLAP"
        'ddl_materias.DataTextField = "MATERIA"
        'ddl_materias.DataBind()
    End Sub
    Protected Sub ddl_tipo_clase_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_tipo_clase.SelectedIndexChanged
        If ddl_tipo_clase.SelectedValue = "Virtual" Then
            ddl_bloque.Visible = False
            ddl_aula.Visible = False
            txt_link_clase.Visible = True
        ElseIf ddl_tipo_clase.SelectedValue = "Presencial" Then
            ddl_bloque.Visible = True
            ddl_aula.Visible = True
            txt_link_clase.Visible = True

        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        'gv_fecha.DataBind()
        'txt_dia.Text = HttpUtility.HtmlDecode(gv_fecha.Rows(0).Cells(5).Text)
        txt_hora_ini.Text = ddl_hr_ini.SelectedValue.ToString + ":" + ddl_min_ini.SelectedValue.ToString
        txt_hrafin.Text = ddl_hra_fin.SelectedValue.ToString + ":" + ddl_min_fin.SelectedValue.ToString

        If ddl_hr_ini.SelectedValue.ToString = "Seleccione la Hora de Inicio" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Seleccione una Hora de Inicio');</script>")
        End If
        If ddl_min_ini.SelectedValue.ToString = "Seleccione Minutos de Inicio" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Seleccione una Minutos de Inicio');</script>")
        End If
        If ddl_hra_fin.SelectedValue.ToString = "Seleccione la Hora de Fin" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Seleccione una Hora de Fin');</script>")
        End If
        If ddl_min_fin.SelectedValue.ToString = "Seleccione Minutos de Fin" Then
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Seleccione una Minutos de Fin');</script>")
        End If
        sql_ds_horario.Insert()


        Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('El horario fue Registrado Con Exito');</script>")

    End Sub
    Protected Sub ddl_materias_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_materias.SelectedIndexChanged

    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        gv_horarioscreados.DataBind()

        If gv_horarioscreados.Rows(0).Cells(2).Text = "Virtual" Then
            txt_horas.Text = GridView1.Rows(0).Cells(5).Text
        ElseIf gv_horarioscreados.Rows(0).Cells(2).Text = "Presencial" Then
            txt_horas.Text = GridView1.Rows(0).Cells(6).Text
        End If






        sql_ds_designacion.Insert()
        sql_ds_clases_prog.Update()
        'Response.Redirect("~/DIR_CAR_programar_horario.aspx")
        Response.Write("<script>alert(""Se Registro los Datos Exitosamente"");window.location.href = ""DIR_CAR_programar_horario.aspx"";</script>")

    End Sub
    Protected Sub gv_horarioscreados_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarioscreados.SelectedIndexChanged
        txt_id_horarioselec.Text = gv_horarioscreados.SelectedRow.Cells(1).Text
        gv_horarioscreados.DataBind()

    End Sub
    Protected Sub ddl_grupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_grupo.SelectedIndexChanged
        txt_grupos.Text = txt_grupos.Text + ddl_grupo.SelectedValue.ToString
    End Sub

    Protected Sub ddl_grupol_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_grupol.SelectedIndexChanged
        txt_grupos.Text = txt_grupos.Text + ddl_grupol.SelectedValue.ToString
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click

        sql_ds_clases_prog.DataBind()
        ddl_clases_prog.DataBind()

    End Sub
End Class
