
Imports System.Drawing

Partial Class DIR_CAR_ratificar_docentes
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_ratificar_docentes_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            'lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
            'txt_sede.Text = Session("sede")
            txt_sigla_carrera.Text = Session("siglacar")
            txt_ciusuario.Text = Session("usuario")

            txt_id_sede.Text = Session("sede")

        Else
            Response.Redirect("~/sesion.aspx")
        End If
        gv_ratificados.DataBind()
        gv_docentes_actual.DataBind()
        For filas As Integer = 0 To gv_docentes_actual.Rows.Count - 1
            For filash As Integer = 0 To gv_ratificados.Rows.Count - 1
                If gv_docentes_actual.Rows(filas).Cells(1).Text = gv_ratificados.Rows(filash).Cells(0).Text Then
                    gv_docentes_actual.Rows(filas).BackColor = Color.FromName("#f8f0b1")



                End If
            Next
        Next
    End Sub

    Protected Sub gv_docentes_actual_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_docentes_actual.SelectedIndexChanged
        txt_ci_doc.Text = gv_docentes_actual.SelectedRow.Cells(1).Text
        sql_ds_ratificados.Insert()
        gv_ratificados.DataBind()
        gv_docentes_actual.DataBind()
        For filas As Integer = 0 To gv_docentes_actual.Rows.Count - 1
            For filash As Integer = 0 To gv_ratificados.Rows.Count - 1
                If gv_docentes_actual.Rows(filas).Cells(1).Text = gv_ratificados.Rows(filash).Cells(0).Text Then
                    gv_docentes_actual.Rows(filas).BackColor = Color.FromName("#f8f0b1")




                End If
            Next
        Next
    End Sub
End Class
