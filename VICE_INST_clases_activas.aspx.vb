
Partial Class VICE_INST_clases_activas
    Inherits System.Web.UI.Page

    Private Sub ADM_BLO_clases_activas_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
            txt_idsde.Text = Session("sede")



        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub

    Protected Sub gv_clases_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv_clases.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' Obtiene el valor de la columna "estado"
            Dim estado As String = e.Row.Cells(5).Text ' La columna "estado" es la sexta columna (index 5)

            ' Asigna colores según el valor del estado
            Select Case estado.Trim()
                Case "Clases en Curso"
                    e.Row.Cells(5).BackColor = System.Drawing.ColorTranslator.FromHtml("#deffe5") ' Verde claro
                Case "Clase Terminada"
                    e.Row.Cells(5).BackColor = System.Drawing.ColorTranslator.FromHtml("#f8d7da") ' Rojo bajito
                Case "A la espera de Iniciar la clase"
                    e.Row.Cells(5).BackColor = System.Drawing.ColorTranslator.FromHtml("#feffde")  ' Amarillo claro
            End Select
        End If
    End Sub

    Protected Sub tmrRefresh_Tick(ByVal sender As Object, ByVal e As EventArgs)
        gv_clases.DataBind() ' Recarga los datos del GridView
    End Sub

End Class
