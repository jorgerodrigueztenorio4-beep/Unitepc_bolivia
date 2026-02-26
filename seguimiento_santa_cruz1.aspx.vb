
Partial Class seguimiento_santa_cruz
    Inherits System.Web.UI.Page

    Private Sub seguimiento_cobija_Load(sender As Object, e As EventArgs) Handles Me.Load
        GridView1.DataBind()
        GridView2.DataBind()

        If GridView2.Rows.Count > 0 Then
            ' Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Ud. tiene marcado su ingreso y no su salida');window.location.href = ""seguimiento_cobija.aspx"";</script>")
            GridView2.Visible = True
            Button3.Visible = True
            Label1.Visible = True
            txt_observacines.Visible = True
            txt_tema_avance.Visible = True
            ddl_cantest.Visible = True

            Label2.Text = "Presione el Boton 'Registrar Salida' para Concluir y Registrar su Salida de Clases'"
            Label2.Visible = True

        ElseIf GridView2.Rows.Count <= 0 Then
            GridView1.DataBind()
            If GridView1.Rows.Count > 0 Then
                Button1.Visible = True
                Label2.Text = "Presione el Boton 'Registrar Ingreso' para marcar su Entrada '"
                Label2.Visible = True
                Label3.Visible = True


            End If
        End If






    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_horaingresaantes.DataBind()
        gv_horario2.DataBind()

        If gv_horaingresaantes.Rows(0).Cells(0).Text < GridView1.Rows(0).Cells(5).Text Then
            'MsgBox("es menor pnganle la misma hora del horario")
            txt_armadofecha.Text = gv_horaingresaantes.Rows(0).Cells(1).Text + " " + GridView1.Rows(0).Cells(5).Text
            txt_ci.Text = gv_horario2.Rows(0).Cells(11).Text
            txt_materia.Text = gv_horario2.Rows(0).Cells(10).Text
            txt_crrera.Text = gv_horario2.Rows(0).Cells(5).Text
            txt_idhor.Text = gv_horario2.Rows(0).Cells(0).Text
            txt_id_aula.Text = gv_horario2.Rows(0).Cells(4).Text
            txt_bloque.Text = gv_horario2.Rows(0).Cells(3).Text
            txt_siglamat.Text = gv_horario2.Rows(0).Cells(9).Text

            Dim IPAdd As String = String.Empty
            IPAdd = Request.ServerVariables("HTTP_X_FORWARDED_FOR")

            If String.IsNullOrEmpty(IPAdd) Then
                IPAdd = Request.ServerVariables("REMOTE_ADDR")
                txt_ip.Text = IPAdd
            End If


            sql_ing_sal0.Insert()
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Se registro Exitosamente su Ingreso!!!');window.location.href = ""seguimiento_santa_cruz.aspx"";</script>")




        ElseIf gv_horaingresaantes.Rows(0).Cells(0).Text > GridView1.Rows(0).Cells(5).Text Then
            'MsgBox("es menor pnganle la misma hora de ingreso normal")
            txt_ci.Text = gv_horario2.Rows(0).Cells(11).Text
            txt_materia.Text = gv_horario2.Rows(0).Cells(10).Text
            txt_crrera.Text = gv_horario2.Rows(0).Cells(5).Text
            txt_idhor.Text = gv_horario2.Rows(0).Cells(0).Text
            txt_id_aula.Text = gv_horario2.Rows(0).Cells(4).Text
            txt_bloque.Text = gv_horario2.Rows(0).Cells(3).Text
            txt_siglamat.Text = gv_horario2.Rows(0).Cells(9).Text
            sql_ing_sal.Insert()
            Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Se registro Exitosamente su Ingreso!!!');window.location.href = ""seguimiento_santa_cruz.aspx"";</script>")


        End If


    End Sub
    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click

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

                Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Se registro Exitosamente su Salida muchas Gracias!!!');window.location.href = ""seguimiento_santa_cruz.aspx"";</script>")
            End If

        ElseIf gv_respuesta.Rows.Count <= 0 Then
            If ddl_cantest.SelectedValue.ToString = "Cantidad de Estudiantes" Then
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Seleccione la Cantidad de Estudiantes que asistieron a clases');</script>")
            ElseIf ddl_cantest.SelectedValue.ToString <> "Cantidad de Estudiantes" Then
                txt_id_hor.Text = GridView2.Rows(0).Cells(0).Text
                sql_salida.Update()



                Page.ClientScript.RegisterStartupScript(Me.GetType(), "Scripts", "<script>alert('Se registro Exitosamente su Salida muchas Gracias!!!');window.location.href = ""seguimiento_santa_cruz.aspx"";</script>")
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
        gv_horaingresaantes.DataBind()
        gv_horario2.DataBind()
        gv_horario2.DataBind()
    End Sub
End Class
