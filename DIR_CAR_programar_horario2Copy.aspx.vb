
Partial Class DIR_CAR_programar_horario2Copy
    Inherits System.Web.UI.Page
    '  Dim ws1 As ws1.ParaControlWebSoapClient = New ws1.ParaControlWebSoapClient
    Private Sub DIR_CAR_programar_horario_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
            txt_sede.Text = Session("sede")
            txt_sigla_carrera.Text = Session("siglacar")
            txt_ciusuario.Text = Session("usuario")

            txt_id_sede.Text = Session("sede")
            If txt_id_sede.Text = "12" Then
                Button1.Visible = True
                Button2.Visible = True

            End If
            If txt_id_sede.Text = "3" Then
                Button1.Visible = True
                Button2.Visible = True

            End If


        Else
            Response.Redirect("~/sesion.aspx")
        End If
        If Page.IsPostBack Then
            gv_prog.DataBind()

        Else


        End If
        'ACRTIVAR PARA BLOQUEAR POR SEDE
        'If (txt_id_sede.Text = "1" Or txt_id_sede.Text = "3" Or txt_id_sede.Text = "4" And txt_id_sede.Text = "5" Or txt_id_sede.Text = "6" Or txt_id_sede.Text = "8" Or txt_id_sede.Text = "9" Or txt_id_sede.Text = "1200") Then
        '    Button1.Visible = False
        '    Button2.Visible = False

        'End If
        Dim GV_HABILITADOS As New GridView
        GV_HABILITADOS.DataSource = SQL_DS_HABILITAR_HORARIO
        GV_HABILITADOS.DataBind()



        Dim habilitado As String
        habilitado = "HABILITADO"
        If (txt_id_sede.Text = GV_HABILITADOS.Rows(0).Cells(3).Text) Then
            If txt_sigla_carrera.Text = GV_HABILITADOS.Rows(0).Cells(1).Text And habilitado = GV_HABILITADOS.Rows(0).Cells(2).Text Then
                Button1.Visible = True
                Button2.Visible = True
            Else
                Button1.Visible = False
                Button2.Visible = False
            End If
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

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_inicio.DataBind()
        gv_fin.DataBind()

        If gv_inicio.Rows.Count > "0" Or gv_fin.Rows.Count > "0" Then
            ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC Horarios"", text:""No se Puede registrar el Horario existe Choques"", type: ""warning"" });</script>")
        ElseIf gv_inicio.Rows.Count <= "0" And gv_fin.Rows.Count <= "0" Then


            If ddl_dia.SelectedValue.ToString = "0" Then
                ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC Horarios"", text:""Seleccione un Dia de la Semana"", type: ""warning"" });</script>")
            ElseIf ddl_dia.SelectedValue.ToString <> "0" Then

                If ddl_tipo_clase.SelectedValue.ToString = "0" Then
                    ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC Horarios"", text:""Seleccione el Tipo de Clase"", type: ""warning"" });</script>")
                ElseIf ddl_tipo_clase.SelectedValue.ToString <> "0" Then
                    sql_ds_horario.Insert()
                    gv_clases.DataBind()
                    ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC Horarios"", text:""Horario Registrado Exitosamente"", type: ""success"" });</script>")


                End If

            End If

        End If

        'If ddl_hr_ini.SelectedValue.ToString = "Seleccione la Hora de Inicio" Then
        '    Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Seleccione una Hora de Inicio');</script>")
        'End If
        'If ddl_min_ini.SelectedValue.ToString = "Seleccione Minutos de Inicio" Then
        '    Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Seleccione una Minutos de Inicio');</script>")
        'End If
        'If ddl_hra_fin.SelectedValue.ToString = "Seleccione la Hora de Fin" Then
        '    Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Seleccione una Hora de Fin');</script>")
        'End If
        'If ddl_min_fin.SelectedValue.ToString = "Seleccione Minutos de Fin" Then
        '    Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Seleccione una Minutos de Fin');</script>")
        'End If
        'sql_ds_horario.Insert()
        'gv_clases.DataBind()


        gv_prog.DataBind()





    End Sub
    Protected Sub ddl_materias_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_materias.SelectedIndexChanged

    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        'gv_horarioscreados.DataBind()
        gv_clases.DataBind()

        txt_id_horarioselec.Text = gv_clases.Rows(0).Cells(1).Text

        If gv_clases.Rows(0).Cells(3).Text = "Teorico" Then
            txt_horas.Text = GridView1.Rows(0).Cells(5).Text

        ElseIf gv_clases.Rows(0).Cells(3).Text = "Practico" Then

            txt_horas.Text = GridView1.Rows(0).Cells(6).Text
        End If
        If txt_horas.Text = "0" Then
            ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC Horarios"", text:""El tipo de clase que selecciono en el horario tiene carga horaria ( 0 ) por favor revisar"", type: ""warning"" });</script>")
        ElseIf txt_horas.Text <> "0" Then
            sql_ds_designacion.Insert()
            sql_ds_designacion.Update()
            'Response.Redirect("~/DIR_CAR_programar_horario.aspx")
            'Response.Write("<script>alert(""Se Registro los Datos Exitosamente"");window.location.href = ""DIR_CAR_programar_horario2.aspx"";</script>")
            ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Designacion registrado Exitosamente"", type: ""success"",timer:3000}, function(){window.location.href = ""DIR_CAR_programar_horario2.aspx"";});</script>")
        End If


    End Sub
    'Protected Sub gv_horarioscreados_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarioscreados.SelectedIndexChanged
    '    txt_id_horarioselec.Text = gv_horarioscreados.SelectedRow.Cells(1).Text
    '    gv_horarioscreados.DataBind()

    'End Sub
    Protected Sub ddl_grupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_grupo.SelectedIndexChanged
        txt_grupos.Text = txt_grupos.Text + ddl_grupo.SelectedValue.ToString
    End Sub

    Protected Sub ddl_grupol_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_grupol.SelectedIndexChanged
        txt_grupos.Text = txt_grupos.Text + ddl_grupol.SelectedValue.ToString
    End Sub

    'Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click

    '    ' sql_ds_clases_prog.DataBind()
    '    ddl_clases_prog.DataBind()

    'End Sub





    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim hora As Date
        hora = ddl_hr_ini.SelectedValue.ToString
        hora = hora.AddMinutes(90)
        txt_hrafin.Text = hora.ToString("HH:mm")
        gv_inicio.DataBind()
        gv_fin.DataBind()

    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Dim hora As Date
        hora = ddl_hr_ini.SelectedValue.ToString
        hora = hora.AddMinutes(135)
        txt_hrafin.Text = hora.ToString("HH:mm")
        gv_inicio.DataBind()
        gv_fin.DataBind()
    End Sub



    Protected Sub ddl_hr_ini_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_hr_ini.SelectedIndexChanged
        txt_hora_ini.Text = ddl_hr_ini.SelectedValue.ToString
        txt_hrafin.Text = ""

        gv_prog.DataBind()
    End Sub
    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Dim hora As Date
        hora = ddl_hr_ini.SelectedValue.ToString
        hora = hora.AddMinutes(45)
        txt_hrafin.Text = hora.ToString("HH:mm")
        gv_inicio.DataBind()
        gv_fin.DataBind()
    End Sub
    Protected Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Dim hora As Date
        hora = ddl_hr_ini.SelectedValue.ToString
        hora = hora.AddMinutes(180)
        txt_hrafin.Text = hora.ToString("HH:mm")
        gv_inicio.DataBind()
        gv_fin.DataBind()
    End Sub
End Class
