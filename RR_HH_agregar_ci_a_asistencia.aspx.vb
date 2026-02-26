
Partial Class RR_HH_agregar_ci_a_asistencia
    Inherits System.Web.UI.Page
    Dim WSEBSE As wsr2.ParaControlWebSoapClient = New wsr2.ParaControlWebSoapClient



    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        For filas As Integer = 0 To gv_lista.Rows.Count - 1
            For filash As Integer = 0 To GV_HORARIOS.Rows.Count - 1
                'SIGLA CARRERA,SEDE,SIGLA MAT , tipo de clase , grupo'
                If gv_lista.Rows(filas).Cells(19).Text = GV_HORARIOS.Rows(filash).Cells(13).Text Then '<---------  comparamos el dia
                    If gv_lista.Rows(filas).Cells(15).Text = GV_HORARIOS.Rows(filash).Cells(9).Text Then '<---------  comparamos e tipo de clase
                        If RTrim(gv_lista.Rows(filas).Cells(12).Text) = GV_HORARIOS.Rows(filash).Cells(8).Text Then '<---------  comparamos la silga de la mat
                            If gv_lista.Rows(filas).Cells(16).Text = GV_HORARIOS.Rows(filash).Cells(3).Text Then '<---------  comparamos hra ingreso
                                If gv_lista.Rows(filas).Cells(17).Text = GV_HORARIOS.Rows(filash).Cells(4).Text Then '<---------  comparamos hra salida
                                    'txt_siglah.Text = RTrim(gv_lista.Rows(filas).Cells(6).Text)
                                    'txt_siglamat.Text = RTrim(GV_HORARIOS.Rows(filash).Cells(8).Text)
                                    txt_id_horario.Text = gv_lista.Rows(filas).Cells(0).Text
                                    txt_ci.Text = GV_HORARIOS.Rows(filash).Cells(1).Text
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

    End Sub
End Class
