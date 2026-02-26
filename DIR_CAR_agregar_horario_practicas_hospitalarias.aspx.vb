
Partial Class DIR_CAR_agregar_horario_practicas_hospitalarias
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_agregar_horario_practicas_hospitalarias_Load(sender As Object, e As EventArgs) Handles Me.Load


        If Session("idus") <> "" Then
            txt_sede.Text = Session("sede")
            txt_sigla_carrera.Text = Session("siglacar")
        Else
            Response.Redirect("~/sesion.aspx")
        End If

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        sql_ds_materia.Insert()
        gv_materias.DataBind()

    End Sub
End Class
