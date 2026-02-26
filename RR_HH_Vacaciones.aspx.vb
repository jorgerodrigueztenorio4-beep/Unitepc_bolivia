
Partial Class RRHH_Vacaciones
    Inherits System.Web.UI.Page
    Protected Sub FilterTextChanged(sender As Object, e As EventArgs)
        ' Obtener referencias a los TextBox
        Dim txtFilterCI As TextBox = TryCast(Gv_Vacaciones.HeaderRow.FindControl("txtFilterCI"), TextBox)
        Dim txtFilterFecha As TextBox = TryCast(Gv_Vacaciones.HeaderRow.FindControl("txtFilterFecha"), TextBox)

        ' Guardar valores en ViewState
        ViewState("FilterCI") = txtFilterCI.Text
        ViewState("FilterFecha") = txtFilterFecha.Text

        ' Crear expresión de filtro
        Dim filterExpression As String = ""

        If Not String.IsNullOrEmpty(txtFilterCI.Text) Then
            filterExpression &= "CI_Contratado LIKE '%" & txtFilterCI.Text & "%'"
        End If

        If Not String.IsNullOrEmpty(txtFilterFecha.Text) Then
            If filterExpression <> "" Then filterExpression &= " AND "
            filterExpression &= "CONVERT(varchar, FechaIngreso, 23) LIKE '%" & txtFilterFecha.Text & "%'"
        End If

        ' Aplicar filtro al SqlDataSource
        If filterExpression = "" Then
            ' Si no hay filtro, mostrar todos los registros
            SqlDsVacaciones.FilterExpression = Nothing
        Else
            SqlDsVacaciones.FilterExpression = filterExpression
        End If
    End Sub



    Protected Sub Gv_Vacaciones_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles Gv_Vacaciones.RowDataBound
        If e.Row.RowType = DataControlRowType.Header Then
            Dim txtFilterCI As TextBox = TryCast(e.Row.FindControl("txtFilterCI"), TextBox)
            Dim txtFilterFecha As TextBox = TryCast(e.Row.FindControl("txtFilterFecha"), TextBox)

            If txtFilterCI IsNot Nothing AndAlso ViewState("FilterCI") IsNot Nothing Then
                txtFilterCI.Text = ViewState("FilterCI").ToString()
            End If

            If txtFilterFecha IsNot Nothing AndAlso ViewState("FilterFecha") IsNot Nothing Then
                txtFilterFecha.Text = ViewState("FilterFecha").ToString()
            End If
        End If
    End Sub



    Protected Sub Gv_Vacaciones_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Gv_Vacaciones.SelectedIndexChanged
        txt_cicontrado.Text = Gv_Vacaciones.SelectedDataKey("CI_Contratado").ToString()
        GvVacacionesSol.DataBind()

        If GvVacacionesSol.Rows.Count > 0 Then

            lbldiasvacacion.Text = Gv_Vacaciones.SelectedRow.Cells(4).Text - GvVacacionesSol.Rows(0).Cells(1).Text
            lbl_gastados.Text = GvVacacionesSol.Rows(0).Cells(1).Text

        Else

            lbldiasvacacion.Text = "0"



        End If

    End Sub

    Protected Sub GvVacacionesSol_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GvVacacionesSol.SelectedIndexChanged
        GvVacacionesSol.DataBind()

    End Sub
End Class
