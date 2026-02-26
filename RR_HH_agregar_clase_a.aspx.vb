
Partial Class RR_HH_agregar_clase_a
    Inherits System.Web.UI.Page


    Protected Sub txt_fecha_TextChanged(sender As Object, e As EventArgs) Handles txt_fecha.TextChanged
        'Label1.Text = Weekday(txt_fecha.Text)

        Dim Variable As Integer
        Dim Nombre As String

        Variable = Weekday(txt_fecha.Text)

        '' --------1)Dom, 2)Lunes.........

        Select Case Variable
            Case 1
                Nombre = "Domingo"
            Case 2
                Nombre = "Lunes"
            Case 3
                Nombre = "Martes"

            Case 4
                Nombre = "Miercoles"

            Case 5
                Nombre = "Jueves"

            Case 6
                Nombre = "Viernes"

            Case 7
                Nombre = "Sabado"

        End Select
        Label1.Text = Nombre.ToString


    End Sub

    Protected Sub gv_clases_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_clases.SelectedIndexChanged
        Dim f As String
        f = txt_fecha.Text
        txt_fecha_hora.Text = Format(CDate(f), "dd/MM/yyyy") + " 01:00:00"
        txt_idhr.Text = gv_clases.SelectedRow.Cells(1).Text
        sql_ds_clase.Insert()
        ClientScript.RegisterStartupScript(Me.GetType(), "mensaje", "<script>swal({title:""UNITEPC"", text:""Clase Agregada Exitosamente"", type: ""success"" });</script>")

    End Sub

    Private Sub DIR_CAR_agregar_clase_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            'lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_sede.Text = Session("sede")
            'txt_siglacar.Text = Session("siglacar")
            ''txt_ciusuario.Text = Session("idus")
            ''txt_id_sede.Text = Session("sede")

        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
End Class
