
Partial Class agregar_personal_servicio
    Inherits System.Web.UI.Page
    Dim WSEBSE As wsr2.ParaControlWebSoapClient = New wsr2.ParaControlWebSoapClient
    'Dim gv_lista As New GridView

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_lista.DataSource = WSEBSE.RRHHListaDeDocentes2023()

        gv_lista.DataBind()
        For filas As Integer = 0 To gv_lista.Rows.Count - 1
            txt_ci.Text = gv_lista.Rows(filas).Cells(0).Text
            txt_nombre.Text = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(1).Text)
            txt_ppa.Text = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(2).Text)
            txt_sap.Text = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(3).Text)
            gv_existe.DataBind()

            If gv_existe.Rows.Count > 0 Then


            ElseIf gv_existe.Rows.Count <= 0 Then
                sql_ds_existe.Insert()
            End If


            If gv_lista.Rows.Count > 0 Then
                Button3.Visible = True
            Else
                Button2.Visible = False
            End If

        Next
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        gv_lista.DataSource = WSEBSE.RRHHListaDeDocentes2023()

        gv_lista.DataBind()
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        For filas As Integer = 0 To gv_lista.Rows.Count - 1
            For filash As Integer = 0 To GV_HORARIOS.Rows.Count - 1
                'SIGLA CARRERA,SEDE,SIGLA MAT , tipo de clase , grupo'
                If gv_lista.Rows(filas).Cells(5).Text = GV_HORARIOS.Rows(filash).Cells(6).Text + "1" Then
                    If gv_lista.Rows(filas).Cells(8).Text = GV_HORARIOS.Rows(filash).Cells(12).Text Then
                        If RTrim(gv_lista.Rows(filas).Cells(6).Text) = GV_HORARIOS.Rows(filash).Cells(8).Text Then
                            If gv_lista.Rows(filas).Cells(9).Text = GV_HORARIOS.Rows(filash).Cells(9).Text Then
                                If gv_lista.Rows(filas).Cells(10).Text = GV_HORARIOS.Rows(filash).Cells(5).Text Then
                                    txt_siglah.Text = RTrim(gv_lista.Rows(filas).Cells(6).Text)
                                    txt_siglamat.Text = RTrim(GV_HORARIOS.Rows(filash).Cells(8).Text)
                                    txt_ci.Text = gv_lista.Rows(filas).Cells(0).Text
                                    txt_id_horario.Text = GV_HORARIOS.Rows(filash).Cells(0).Text
                                    sql_ds_existe.Update()
                                End If
                            End If
                        End If
                    End If
                End If
                'If gv_lista.Rows(filas).Cells(5).Text = GV_HORARIOS.Rows(filash).Cells(6).Text + "1" And gv_lista.Rows(filas).Cells(8).Text = GV_HORARIOS.Rows(filash).Cells(12).Text And gv_lista.Rows(filas).Cells(6).Text = GV_HORARIOS.Rows(filash).Cells(8).Text And gv_lista.Rows(filas).Cells(9).Text = GV_HORARIOS.Rows(filash).Cells(9).Text And gv_lista.Rows(filas).Cells(10).Text = GV_HORARIOS.Rows(filash).Cells(5).Text Then
                '    txt_ci.Text = gv_lista.Rows(filas).Cells(0).Text
                '    txt_id_horario.Text = GV_HORARIOS.Rows(filash).Cells(0).Text
                '    sql_ds_existe.Update()



                'End If
            Next

        Next
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'If Session("idus") <> "" Then

        '    'lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
        '    'txt_sede.Text = Session("sede")
        '    'txt_siglacar.Text = Session("siglacar")
        '    ''txt_ciusuario.Text = Session("idus")
        '    ''txt_id_sede.Text = Session("sede")

        'Else
        '    Response.Redirect("~/sesion.aspx")
        'End If
        ''gv_lista.DataBind()


    End Sub
End Class
