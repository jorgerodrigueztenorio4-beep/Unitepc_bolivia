
Partial Class DIR_ACD_SEDE_programar_horario
    Inherits System.Web.UI.Page

    Private Sub DIR_ACD_SEDE_agregar_docente_nuevo_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " ---> " + Session("sede_nombre") + " ---> " + Session("nombre_usuario")
            txt_sede.Text = Session("sede")
            txt_ci_us.Text = Session("idus")


        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
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

        gv_clases.DataBind()
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC Horarios"", text:""Horario Registrado designe una Materia por Favor"", type: ""success"" });</script>")
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        gv_clases.DataBind()

        txt_id_horarioselec.Text = gv_clases.Rows(0).Cells(1).Text

        If gv_clases.Rows(0).Cells(3).Text = "Teorico" Then
            txt_horas.Text = GridView1.Rows(0).Cells(5).Text
        ElseIf gv_clases.Rows(0).Cells(3).Text = "Practico" Then

            txt_horas.Text = GridView1.Rows(0).Cells(6).Text
        End If
        sql_ds_designacion.Insert()
        sql_ds_designacion.Update()
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC Horarios"", text:""Horario y Materia Designado proceda a Designar al Docente"", type: ""success"" }, function(){window.location.href = ""DIR_ACD_SEDE_programar_horario.aspx"";});</script>")
    End Sub
    Protected Sub ddl_grupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_grupo.SelectedIndexChanged
        txt_grupos.Text = txt_grupos.Text + ddl_grupo.SelectedValue.ToString
    End Sub

    Protected Sub ddl_grupol_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_grupol.SelectedIndexChanged
        txt_grupos.Text = txt_grupos.Text + ddl_grupol.SelectedValue.ToString
    End Sub


    Protected Sub ddl_min_ini_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_min_ini.SelectedIndexChanged
        txt_hora_ini.Text = ddl_hr_ini.SelectedValue.ToString + ":" + ddl_min_ini.SelectedValue.ToString

        gv_prog.DataBind()

        If gv_prog.Rows.Count >= 1 Then
            Button1.Visible = False
            Button2.Visible = False
        Else
            Button1.Visible = True
            Button2.Visible = True
        End If
    End Sub

    Protected Sub ddl_min_fin_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_min_fin.SelectedIndexChanged
        txt_hrafin.Text = ddl_hra_fin.SelectedValue.ToString + ":" + ddl_min_fin.SelectedValue.ToString
        gv_prog.DataBind()

        If gv_prog.Rows.Count >= 1 Then
            Button1.Visible = False
            Button2.Visible = False
        Else
            Button1.Visible = True
            Button2.Visible = True
        End If



    End Sub

    Protected Sub ddl_tipo_clase_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_tipo_clase.SelectedIndexChanged
        If ddl_tipo_clase.SelectedValue = "Practico" Then
            'ddl_bloque.Visible = False
            'ddl_aula.Visible = False
            'txt_link_clase.Visible = True
            ddl_grupol.Visible = True
            ddl_grupo.Visible = False
        ElseIf ddl_tipo_clase.SelectedValue = "Teorico" Then
            ddl_grupo.Visible = True
            ddl_grupol.Visible = False
        End If
    End Sub
End Class
