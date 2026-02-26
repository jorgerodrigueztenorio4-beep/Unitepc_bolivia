
'Imports System.Data

'Partial Class DIR_CAR_ContratosDocente
'    Inherits System.Web.UI.Page
'    Dim WSEBSE As wsr2.ParaControlWebSoapClient = New wsr2.ParaControlWebSoapClient
'    Dim GV_HORARIOS As New GridView

'    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click



'        Dim ds As DataSet = WSEBSE.RRHHListaDeDocentes2023()

'        Dim dt As DataTable = ds.Tables(0)

'        Dim dv As New DataView(dt)

'        dv.RowFilter = "Sede = " & TextBox1.Text & " AND CodCarre = '" & TextBox2.Text & "'"

'        gv_contratos.DataSource = dv
'        gv_contratos.DataBind()

'        Dim totalFilas As Integer = gv_contratos.Rows.Count
'        Dim porcentaje As Double = 0


'        For filas As Integer = 0 To totalFilas - 1
'            ' Calculamos el porcentaje al inicio de cada fila del contrato
'            porcentaje = ((filas + 1) / totalFilas) * 100

'            For filash As Integer = 0 To GV_HORARIOS.Rows.Count - 1
'                ' Validaciones de celdas
'                If gv_contratos.Rows(filas).Cells(5).Text = GV_HORARIOS.Rows(filash).Cells(6).Text + "1" Then
'                    If gv_contratos.Rows(filas).Cells(8).Text = GV_HORARIOS.Rows(filash).Cells(12).Text Then
'                        If RTrim(gv_contratos.Rows(filas).Cells(6).Text) = GV_HORARIOS.Rows(filash).Cells(8).Text Then
'                            If gv_contratos.Rows(filas).Cells(9).Text = GV_HORARIOS.Rows(filash).Cells(9).Text Then
'                                If gv_contratos.Rows(filas).Cells(10).Text = GV_HORARIOS.Rows(filash).Cells(5).Text Then

'                                    ' Actualización de campos y base de datos
'                                    txt_siglah.Text = RTrim(gv_contratos.Rows(filas).Cells(9).Text)
'                                    txt_siglamat.Text = RTrim(GV_HORARIOS.Rows(filash).Cells(8).Text)
'                                    txt_ci.Text = gv_contratos.Rows(filas).Cells(0).Text
'                                    txt_id_horario.Text = GV_HORARIOS.Rows(filash).Cells(0).Text
'                                    sql_ds_existe.Update()

'                                End If
'                            End If
'                        End If
'                    End If
'                End If
'            Next ' Aquí termina el bucle de Horarios

'            ' LA NOTIFICACIÓN VA AQUÍ: Fuera del bucle interno y fuera de los If
'            If filas = totalFilas - 1 Then
'                lbl_notificacion.Text = "Datos Actualizados"
'            Else
'                lbl_notificacion.Text = "Procesando: " & Math.Round(porcentaje).ToString() & "%"
'            End If
'        Next



'        ' Al finalizar el bucle For...Next
'        lbl_notificacion.Text = "Datos Actualizados"

'        ' Esto obliga a la barra a llenarse al 100% cuando el servidor responde
'        Dim script As String = "clearInterval(window.miIntervalo); var b = document.getElementById('miBarra'); b.style.width='100%'; b.innerHTML='100%';"
'        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "terminar", script, True)



'    End Sub

'    Private Sub DIR_CAR_ContratosDocente_Load(sender As Object, e As EventArgs) Handles Me.Load
'        GV_HORARIOS.DataSource = SQL_DS_HORARIO
'        TextBox1.Text = Session("sede")
'        TextBox2.Text = Session("siglacar")
'        TextBox2.Text = TextBox2.Text + "1"
'        TextBox3.Text = Session("siglacar")
'        GV_HORARIOS.DataBind()

'    End Sub
'End Class
Imports System.Data

Partial Class DIR_CAR_ContratosDocente
    Inherits System.Web.UI.Page
    Dim WSEBSE As wsr2.ParaControlWebSoapClient = New wsr2.ParaControlWebSoapClient
    ' Sugerencia: Si GV_HORARIOS no está en el ASPX, asegúrate de que se llene correctamente
    Dim GV_HORARIOS As New GridView

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        ' Forzamos a que el GridView de horarios tenga los datos actualizados antes de empezar
        GV_HORARIOS.DataSource = SQL_DS_HORARIO
        GV_HORARIOS.DataBind()

        Dim ds As DataSet = WSEBSE.RRHHListaDeDocentes2023()
        Dim dt As DataTable = ds.Tables(0)
        Dim dv As New DataView(dt)

        'dv.RowFilter = "Sede = " & TextBox1.Text & " AND CodCarre = '" & TextBox2.Text & "'"
        dv.RowFilter = "Sede = '4' AND CodCarre = 'CARder'"

        gv_contratos.DataSource = dv
        gv_contratos.DataBind()

        Dim totalFilas As Integer = gv_contratos.Rows.Count

        ' Si no hay filas, terminamos de una vez
        If totalFilas = 0 Then
            lbl_notificacion.Text = "No se encontraron contratos."
            Exit Sub
        End If

        For filas As Integer = 0 To totalFilas - 1
            ' El porcentaje es para control interno, el JS se encarga de lo visual
            For filash As Integer = 0 To GV_HORARIOS.Rows.Count - 1
                ' Tus validaciones de celdas...
                If gv_contratos.Rows(filas).Cells(5).Text = GV_HORARIOS.Rows(filash).Cells(6).Text + "1" Then
                    If gv_contratos.Rows(filas).Cells(8).Text = GV_HORARIOS.Rows(filash).Cells(12).Text Then
                        If RTrim(gv_contratos.Rows(filas).Cells(6).Text) = GV_HORARIOS.Rows(filash).Cells(8).Text Then
                            If gv_contratos.Rows(filas).Cells(9).Text = GV_HORARIOS.Rows(filash).Cells(9).Text Then
                                If gv_contratos.Rows(filas).Cells(10).Text = GV_HORARIOS.Rows(filash).Cells(5).Text Then
                                    txt_siglah.Text = RTrim(gv_contratos.Rows(filas).Cells(9).Text)
                                    txt_siglamat.Text = RTrim(GV_HORARIOS.Rows(filash).Cells(8).Text)
                                    txt_ci.Text = gv_contratos.Rows(filas).Cells(0).Text
                                    txt_id_horario.Text = GV_HORARIOS.Rows(filash).Cells(0).Text
                                    sql_ds_existe.Update()
                                End If
                            End If
                        End If
                    End If
                End If
            Next
        Next

        ' --- EL SALTO FINAL ---
        lbl_notificacion.Text = "Datos Actualizados"

        ' Agregamos un cambio de color a verde (#28a745) para que se note el éxito
        Dim script As String = "clearInterval(window.miIntervalo); " &
                               "var b = document.getElementById('miBarra'); " &
                               "b.style.width='100%'; " &
                               "b.innerHTML='100% - Actualizado'; " &
                               "b.style.backgroundColor='#28a745';"

        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "terminar", script, True)
    End Sub

    Private Sub DIR_CAR_ContratosDocente_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Solo cargamos sesiones la primera vez
            TextBox1.Text = Session("sede")
            TextBox2.Text = Session("siglacar") & "1"
            TextBox3.Text = Session("siglacar")
        End If
    End Sub
End Class