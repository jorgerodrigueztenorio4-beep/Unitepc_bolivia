
Partial Class sesion
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        GridView1.DataBind()


        If Me.GridView1.Rows.Count > 0 Then

            Me.txt_rol.Text = Me.GridView1.Rows(0).Cells(4).Text

            If Me.txt_rol.Text = "2" Then
                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("usuario") = Me.GridView1.Rows(0).Cells(2).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text


                Response.Redirect("~/DIR_CAR_horarios_virtuales.aspx")
            Else
                Me.Label1.Visible = True
            End If
            If Me.txt_rol.Text = "11" Then
                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("usuario") = Me.GridView1.Rows(0).Cells(2).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text


                Response.Redirect("~/DIR_CAR_agregar_datos_docente2.aspx")
            Else
                Me.Label1.Visible = True
            End If

            If Me.txt_rol.Text = "1" Then
                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text


                Response.Redirect("~/DOCENTE_completar_datos.aspx")
            Else
                Me.Label1.Visible = True
            End If

            If Me.txt_rol.Text = "3" Then
                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text


                Response.Redirect("~/DAF_LOCAL_subir_aulas.aspx")
            Else
                Me.Label1.Visible = True
            End If



            If Me.txt_rol.Text = "4" Then
                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text


                Response.Redirect("~/COORDINADOR_agregar_datos_docente.aspx")
            Else
                Me.Label1.Visible = True
            End If


            If Me.txt_rol.Text = "5" Then
                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text


                Response.Redirect("~/DAF_NAL_clases_activas.aspx")
            Else
                Me.Label1.Visible = True
            End If


            If Me.txt_rol.Text = "6" Then
                'Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                'Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                'Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                'Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                'Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                'Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text




                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("usuario") = Me.GridView1.Rows(0).Cells(2).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text


                Response.Redirect("~/DIR_ACD_horarios_virtuales.aspx")
            Else
                Me.Label1.Visible = True
            End If



            If Me.txt_rol.Text = "12" Then
                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text


                Response.Redirect("~/REC_horarios_virtuales.aspx")
            Else
                Me.Label1.Visible = True
            End If

            If Me.txt_rol.Text = "13" Then
                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text


                Response.Redirect("~/VICE_INST_horarios_virtuales.aspx")
            Else
                Me.Label1.Visible = True
            End If
            If Me.txt_rol.Text = "14" Then
                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text


                Response.Redirect("~/ENC_LAB_clases_activas.aspx")
            Else
                Me.Label1.Visible = True
            End If


            If Me.txt_rol.Text = "7" Then
                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text


                Response.Redirect("~/RR_HH_ultima_lista3.aspx")
            Else
                Me.Label1.Visible = True
            End If
            If Me.txt_rol.Text = "8" Then
                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text


                Response.Redirect("~/ADM_BLO_horario_x_dia.aspx")
            Else
                Me.Label1.Visible = True
            End If
            If Me.txt_rol.Text = "9" Then
                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text


                Response.Redirect("~/SEC_DIR_ACD_programar_horario.aspx")
            Else
                Me.Label1.Visible = True
            End If
            If Me.txt_rol.Text = "10" Then
                Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
                Session("nombre_usuario") = Me.GridView1.Rows(0).Cells(1).Text
                Session("siglacar") = Me.GridView1.Rows(0).Cells(5).Text
                Session("nombrecar") = Me.GridView1.Rows(0).Cells(6).Text
                Session("sede") = Me.GridView1.Rows(0).Cells(7).Text
                Session("rol_nombre") = Me.GridView1.Rows(0).Cells(8).Text
                Session("sede_nombre") = Me.GridView1.Rows(0).Cells(9).Text

                Response.Redirect("~/DIR_ACD_SEDE_programar_horario.aspx")
            Else
                Me.Label1.Visible = True
            End If
        End If



        '    If Me.txt_rol.Text = "2" Then
        '        Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
        '        '    ' Response.Redirect("~/dmed_recep_doc.aspx")
        '        Response.Redirect("~/jefatura_nal_contabilidad_recepcionar_doc.aspx")
        '    Else
        '        Me.Label1.Visible = True
        '    End If
        '    If Me.txt_rol.Text = "7" Then
        '        Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
        '        '    ' Response.Redirect("~/dmed_recep_doc.aspx")
        '        Response.Redirect("~/ventanilla_unica_recepcion.aspx")
        '    Else
        '        Me.Label1.Visible = True
        '    End If
        '    If Me.txt_rol.Text = "9" Then
        '        Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
        '        '    ' Response.Redirect("~/dmed_recep_doc.aspx")
        '        Response.Redirect("~/Reportes_rrhh.aspx")
        '    Else
        '        Me.Label1.Visible = True
        '    End If
        '    If Me.txt_rol.Text = "26" Then
        '        Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
        '        '    ' Response.Redirect("~/dmed_recep_doc.aspx")
        '        Response.Redirect("~/agregar_horario_p.aspx")
        '    Else
        '        Me.Label1.Visible = True
        '    End If
        '    If Me.txt_rol.Text = "27" Then
        '        Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
        '        '    ' Response.Redirect("~/dmed_recep_doc.aspx")
        '        Response.Redirect("~/agregar_aula.aspx")
        '    Else
        '        Me.Label1.Visible = True
        '    End If

        '    If Me.txt_rol.Text = "17" Then
        '        Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
        '        '    ' Response.Redirect("~/dmed_recep_doc.aspx")
        '        Response.Redirect("~/agregar_aula.aspx")
        '    Else
        '        Me.Label1.Visible = True
        '    End If
        '    If Me.txt_rol.Text = "12" Then
        '        Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
        '        '    ' Response.Redirect("~/dmed_recep_doc.aspx")
        '        Response.Redirect("~/agregar_aula.aspx")
        '    Else
        '        Me.Label1.Visible = True
        '    End If
        '    If Me.txt_rol.Text = "1009" Then
        '        Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
        '        '    ' Response.Redirect("~/dmed_recep_doc.aspx")
        '        Response.Redirect("~/agregar_aula.aspx")
        '    Else
        '        Me.Label1.Visible = True
        '    End If
        '    If Me.txt_rol.Text = "1010" Then
        '        Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
        '        '    ' Response.Redirect("~/dmed_recep_doc.aspx")
        '        Response.Redirect("~/agregar_aula.aspx")
        '    Else
        '        Me.Label1.Visible = True
        '    End If
        '    If Me.txt_rol.Text = "1011" Then
        '        Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
        '        '    ' Response.Redirect("~/dmed_recep_doc.aspx")
        '        Response.Redirect("~/agregar_aula.aspx")
        '    Else
        '        Me.Label1.Visible = True
        '    End If

        '    If Me.txt_rol.Text = "1012" Then
        '        Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
        '        '    ' Response.Redirect("~/dmed_recep_doc.aspx")
        '        Response.Redirect("~/agregar_aula.aspx")
        '    Else
        '        Me.Label1.Visible = True
        '    End If

        '    If Me.txt_rol.Text = "1013" Then
        '        Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
        '        '    ' Response.Redirect("~/dmed_recep_doc.aspx")
        '        Response.Redirect("~/agregar_aula.aspx")
        '    Else
        '        Me.Label1.Visible = True
        '    End If

        '    If Me.txt_rol.Text = "19" Then
        '        Session("idus") = Me.GridView1.Rows(0).Cells(0).Text
        '        '    ' Response.Redirect("~/dmed_recep_doc.aspx")
        '        Response.Redirect("~/dir_academica_reportes_asistencia.aspx")
        '    Else
        '        Me.Label1.Visible = True
        '    End If


    End Sub
End Class
