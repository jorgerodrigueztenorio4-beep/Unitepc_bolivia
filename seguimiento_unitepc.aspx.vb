Imports System.Net


Partial Class seguimiento_unitepc
    Inherits System.Web.UI.Page
    Dim gv_horaingresaantes As New GridView
    Dim ipmarca As String = String.Empty
    Private Sub seguimiento_cobija_Load(sender As Object, e As EventArgs) Handles Me.Load
        Timer1.Enabled = True
        GridView1.DataBind()
        GridView2.DataBind()

        ipmarca = Request.ServerVariables("HTTP_X_FORWARDED_FOR")
        ipmarca = Request.ServerVariables("REMOTE_ADDR")

        lbl_ip.Text = "Registro realizaco desde la IP : " + ipmarca
        'End If
        If GridView2.Rows.Count > 0 Then

            GridView2.Visible = True
            Button3.Visible = True
            Label1.Visible = True
            txt_observacines.Visible = True
            txt_tema_avance.Visible = True
            ddl_cantest.Visible = True
        ElseIf GridView2.Rows.Count <= 0 Then
            GridView1.DataBind()
            If GridView1.Rows.Count > 0 Then
                Button1.Visible = True
                Label3.Visible = True
            End If
            gv_horario.DataBind()

        End If
        If gv_horario.Rows.Count > 0 Then
            lbl_avisos.Text = "Si no se Visualiza el boton de ""Registrar Ingreso"" o su materia no esta en el horario correcto, por favor dirigirse a la oficina del Director de Carrera"
            lbl_avisos.Visible = True

        End If
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_horaingresaantes.DataSource = sql_horaingreso
        gv_horaingresaantes.DataBind()

        gv_horario2.DataBind()

        If gv_horaingresaantes.Rows(0).Cells(0).Text < GridView1.Rows(0).Cells(16).Text Then
            txt_armadofecha.Text = gv_horaingresaantes.Rows(0).Cells(1).Text + " " + GridView1.Rows(0).Cells(16).Text
            txt_idhor.Text = GridView1.Rows(0).Cells(0).Text
            If String.IsNullOrEmpty(ipmarca) Then
                ipmarca = Request.ServerVariables("REMOTE_ADDR")
                txt_ip.Text = ipmarca
            End If
            sql_ing_sal0.Update()
            ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Se registro Exitosamente su Ingreso!!! "", type: ""success"" ,timer:3000}, function(){window.location.href = ""seguimiento_unitepc.aspx"";});</script>")
        ElseIf gv_horaingresaantes.Rows(0).Cells(0).Text > GridView1.Rows(0).Cells(5).Text Then
            txt_idhor.Text = GridView1.Rows(0).Cells(0).Text
            sql_ing_sal.Update()
            ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Se registro Exitosamente su Ingreso!!! "", type: ""success"" ,timer:3000}, function(){window.location.href = ""seguimiento_unitepc.aspx"";});</script>")


        End If


    End Sub
    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        'registra la hora q intentoi salir
        ' sql_ds_horario2.Insert()

        'finaliza la hora q intent salir
        Dim gv_respuesta As New GridView
        gv_respuesta.DataSource = sql_ds_respuesta
        txt_id_ingsal.Text = GridView2.Rows(0).Cells(0).Text

        txt_id_horario.Text = GridView2.Rows(0).Cells(10).Text
        gv_respuesta.DataBind()

        If gv_respuesta.Rows.Count > 0 Then


            If ddl_cantest.SelectedValue.ToString = "Cantidad de Estudiantes" Then
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Seleccione la Cantidad de Estudiantes que asistieron a clases');</script>")

            ElseIf ddl_cantest.SelectedValue.ToString <> "Cantidad de Estudiantes" Then
                txt_id_hor.Text = GridView2.Rows(0).Cells(0).Text

                txt_armadofecha.Text = gv_respuesta.Rows(0).Cells(3).Text + " " + gv_respuesta.Rows(0).Cells(1).Text
                sql_salida0.Update()


                ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Se registro Exitosamente su Ingreso!!! "", type: ""success"" ,timer:3000}, function(){window.location.href = ""seguimiento_unitepc.aspx"";});</script>")
            End If

        ElseIf gv_respuesta.Rows.Count <= 0 Then
            If ddl_cantest.SelectedValue.ToString = "Cantidad de Estudiantes" Then
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Seleccione la Cantidad de Estudiantes que asistieron a clases');</script>")
            ElseIf ddl_cantest.SelectedValue.ToString <> "Cantidad de Estudiantes" Then
                txt_id_hor.Text = GridView2.Rows(0).Cells(0).Text
                sql_salida.Update()




                ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Se registro Exitosamente su Salida Gracias!!! "", type: ""success"" ,timer:3000}, function(){window.location.href = ""seguimiento_unitepc.aspx"";});</script>")
            End If

        End If







        'If ddl_cantest.SelectedValue.ToString = "Cantidad de Estudiantes" Then
        '    Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Seleccione la Cantidad de Estudiantes que asistieron a clases');</script>")
        'ElseIf ddl_cantest.SelectedValue.ToString <> "Cantidad de Estudiantes" Then
        '    txt_id_hor.Text = GridView2.Rows(0).Cells(0).Text
        '    sql_salida.Update()



        '    Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Se registro Exitosamente su Salida muchas Gracias!!!');window.location.href = ""seguimiento_cochabamba.aspx"";</script>")
        'End If
    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click

        gv_horaingresaantes.DataSource = sql_horaingreso

        gv_horaingresaantes.DataBind()
        gv_horario2.DataBind()
        GridView1.DataBind()
        If GridView1.Rows.Count > 0 Or GridView2.Rows.Count > 0 Then





            Dim ipmarca As String = String.Empty
            ipmarca = Request.ServerVariables("HTTP_X_FORWARDED_FOR")

            If String.IsNullOrEmpty(ipmarca) Then
                ipmarca = Request.ServerVariables("REMOTE_ADDR")
                txt_ip.Text = ipmarca
                lbl_ip.Text = ipmarca
            End If
        ElseIf GridView1.Rows.Count <= 0 And GridView2.Rows.Count <= 0 Then
            'intento de marcado'
            sql_horaingreso.Insert()
            'habilitar desp del 19 de octubre
            ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""SEGUIMIENTO DOCENTE UNITEPC"", text:""No se encontro clases asignadas a esta hora para su persona, por favor revise su horario en la opcion (Horario del Docente) ubicado en el menu, lado izquierdo de la pantalla "", type: ""warning"" ,timer:15000}, function(){window.location.href = ""seguimiento_unitepc.aspx"";});</script>")
            'ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""SEGUIMIENTO DOCENTE UNITEPC"", text:""Por coordinacion, sus clases del 13 al 18 de octubre seran respaldadas me manera directa "", type: ""warning"" ,timer:15000}, function(){window.location.href = ""seguimiento_unitepc.aspx"";});</script>")
        End If

    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        gvreloj.DataBind()

    End Sub


End Class
