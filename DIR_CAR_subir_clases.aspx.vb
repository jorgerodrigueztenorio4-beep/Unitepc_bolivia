Imports System.IO
Partial Class DIR_CAR_subir_clases
    Inherits System.Web.UI.Page


    Protected Sub gv_datos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_datos.SelectedIndexChanged
        Button1.Visible = True
        txt_id_ingsal.Text = gv_datos.SelectedRow.Cells(1).Text
        txt_fecha_marcado.Text = DateValue(gv_datos.SelectedRow.Cells(12).Text)
        txt_ci.Text = gv_datos.SelectedRow.Cells(2).Text
        txt_observacion.Text = gv_datos.SelectedRow.Cells(14).Text
        gv_respaldo.DataBind()

        If gv_respaldo.Rows.Count > 0 Then
            Button2.Visible = True
        Else
            Button2.Visible = False
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim restringido As Date
        For i = 0 To GV_HABILITAR.Rows.Count - 1
            restringido = GV_HABILITAR.Rows(i).Cells(2).Text
            If txt_sede.Text = GV_HABILITAR.Rows(i).Cells(0).Text And txt_sigla_car.Text = GV_HABILITAR.Rows(i).Cells(1).Text And txt_fecha.Text >= restringido Then
                Dim exob As String
                exob = Path.GetExtension(Me.FileUpload1.FileName)
                txt_img_guarda.Text = txt_id_ingsal.Text + exob
                Me.FileUpload1.SaveAs(Server.MapPath("~") & "\respaldos\" & txt_img_guarda.Text)
                sql_ds_clases.Insert()
                gv_respaldo.DataBind()
                If gv_respaldo.Rows.Count > 0 Then
                    Button2.Visible = True
                Else
                    Button2.Visible = False
                End If
            ElseIf txt_sede.Text = GV_HABILITAR.Rows(i).Cells(0).Text And txt_sigla_car.Text = GV_HABILITAR.Rows(i).Cells(1).Text And txt_fecha.Text < restringido Then
                ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Ya no puede Subir su Respaldo de esta Fecha"", type: ""warning"" });</script>")
            End If
        Next




        'Dim restringido As Date = "18/09/2023"
        'If txt_fecha.Text >= restringido Then
        '    Dim exob As String
        '    exob = Path.GetExtension(Me.FileUpload1.FileName)
        '    txt_img_guarda.Text = txt_id_ingsal.Text + exob
        '    Me.FileUpload1.SaveAs(Server.MapPath("~") & "\respaldos\" & txt_img_guarda.Text)
        '    sql_ds_clases.Insert()
        '    gv_respaldo.DataBind()
        '    If gv_respaldo.Rows.Count > 0 Then
        '        Button2.Visible = True
        '    Else
        '        Button2.Visible = False
        '    End If
        'Else
        '    ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Ya no puede Subir su Respaldo de esta Fecha"", type: ""warning"" });</script>")
        'End If







    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        txt_hraingreso.Text = txt_fecha_marcado.Text + " " + ddl_horain.SelectedValue.ToString + ":" + ddl_minutosin.SelectedValue.ToString
        txt_hrasalida.Text = txt_fecha_marcado.Text + " " + ddl_horasal.SelectedValue.ToString + ":" + ddl_minsal.SelectedValue.ToString
        Dim fechacreacion, fechaingreso As Date
        fechacreacion = txt_hrasalida.Text
        fechaingreso = txt_hraingreso.Text

        lblsalida.Text = fechacreacion
        lblingreso.Text = fechaingreso
        'lblsalida.Text = Format(fechacreacion, "M-dd-yyyy HH:mm:ss")

        'Dim fechaValida As DateTime
        'If DateTime.TryParse(txt_hrasalida.Text, fechaValida) Then
        '    ' La fecha es válida, puedes continuar
        '    'sql_ds_respaldos.Update()
        '    ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""Error"", text:""La fecha ingresada ES válida"", type: ""error"" });</script>")
        'Else
        '    ' La fecha no es válida, muestra un mensaje de error o maneja la excepción
        '    ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""Error"", text:""La fecha ingresada no es válida"", type: ""error"" });</script>")
        'End If
        If txt_observacion.Text = "No Asistio a Clases" Then
            sql_ds_clases.Update()

            gv_datos.DataBind()
            Button2.Visible = False
            Button1.Visible = False
            txt_id_ingsal.Text = ""
            gv_respaldo.DataBind()
            ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Respaldo Agregado Exitosamente"", type: ""success"" });</script>")
        ElseIf txt_observacion.Text = "No se Marco la Salida" Or txt_observacion.Text = "No Marco la Salida" Then
            sql_fechas.Update()

            gv_datos.DataBind()
            Button2.Visible = False
            Button1.Visible = False
            txt_id_ingsal.Text = ""
            gv_respaldo.DataBind()
            ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Respaldo Agregado Exitosamente"", type: ""success"" });</script>")
        End If





    End Sub

    Private Sub DIR_CAR_subir_clases_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_cius.Text = Session("idus")
            'txt_sede.text = Session("sede")
            txt_sigla_car.Text = Session("siglacar")
            lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
            txt_sede.Text = Session("sede")


        Else
            Response.Redirect("~/sesion.aspx")
        End If

        GV_HABILITAR.DataBind()


        gv_respaldo.DataBind()

        If gv_respaldo.Rows.Count > 0 Then
            Button2.Visible = True
        Else
            Button2.Visible = False
        End If
    End Sub
End Class
