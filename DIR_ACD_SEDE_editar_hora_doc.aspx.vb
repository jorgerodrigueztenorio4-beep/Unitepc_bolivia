
Partial Class DIR_ACD_SEDE_editar_hora_doc
    Inherits System.Web.UI.Page


    Protected Sub gv_horarios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarios.SelectedIndexChanged
        txt_id_horairo.Text = gv_horarios.SelectedRow.Cells(2).Text

        'sql_horarios.Delete()
        'sql_ds_selec.Delete()
        'gv_horarios.DataBind()

        gv_selec.DataBind()
        gv_horarios.Visible = False
        gv_horarios2.Visible = True
        If gv_selec.Rows.Count > 0 Then
            Label1.Visible = True
            Label2.Visible = True
            Label3.Visible = True
            Label4.Visible = True
            Label5.Visible = True
            Label6.Visible = True
            Label7.Visible = True
            Label8.Visible = True
            Label9.Visible = True
            txt_dia.Visible = True
            txt_docente.Visible = True
            txt_fin.Visible = True
            txt_inicio.Visible = True
            ddl_carrera.Visible = True
            ddl_dia.Visible = True
            ddl_docente.Visible = True
            Button1.Visible = True
            Button2.Visible = True
            Button3.Visible = True
            Button4.Visible = True
            txt_inicio.Text = gv_selec.Rows(0).Cells(5).Text
            txt_fin.Text = gv_selec.Rows(0).Cells(6).Text
            txt_docente.Text = HttpUtility.HtmlDecode(gv_horarios.SelectedRow.Cells(3).Text)
            txt_dia.Text = gv_selec.Rows(0).Cells(9).Text
        End If
    End Sub

    Private Sub SEC_DIR_ACD_Lista_Horarios_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_cius.Text = Session("idus")
            txt_siglacar.Text = Session("siglacar")
            txt_sede.Text = Session("sede")


        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub





    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql_ds_carrera.Update()
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Se Actualizo la Hora de Inicio y Fin de l Clase Exitosamente"", type: ""success"" }, function(){window.location.href = ""DIR_ACD_SEDE_editar_hora_doc.aspx"";});</script>")
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        sql_docen.Update()
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Se Actualizo al Docente Exitosamente"", type: ""success"" }, function(){window.location.href = ""DIR_ACD_SEDE_editar_hora_doc.aspx"";});</script>")
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        sql_ds_selec.Update()
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Se Actualizo el Dia Exitosamente"", type: ""success"" }, function(){window.location.href = ""DIR_ACD_SEDE_editar_hora_doc.aspx"";});</script>")
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""No se Efectuo Ningun Cambio"", type: ""success"" }, function(){window.location.href = ""DIR_ACD_SEDE_editar_hora_doc.aspx"";});</script>")
    End Sub
End Class
