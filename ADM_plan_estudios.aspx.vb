
Partial Class ADM_plan_estudios
    Inherits System.Web.UI.Page
    Dim ws1 As ws1.ParaControlWebSoapClient = New ws1.ParaControlWebSoapClient

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_plan.DataSource = ws1.PlanesDeEstudio("1", "A", "CARMED")
        gv_plan.DataBind()

    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        'gv_sedes.DataSource = ws1.PlanesDeEstudio(1, ddl_ant_nuevo.SelectedValue.ToString, ddl_carrera.SelectedValue.ToString)
        'gv_sedes.DataSource = ws1.ListaDeDocentes(1, "A")
        gv_sedes.DataSource = ws1.ListaDeSedes()

        gv_sedes.DataBind()

    End Sub
    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Dim vmaximo As Integer = 0
        Dim vminimo As Integer = 0

        For Each row As GridViewRow In GridView1.Rows

            Dim valor As Integer = CStr(row.Cells(0).Text)
            If valor > VMaximo Then
                VMaximo = valor
            End If
            If valor < VMinimo Then
                VMinimo = valor
            End If

        Next
        txt_resultado.Text = vmaximo
        Dim tamaño As Integer
        Dim cociente As Integer
        tamaño = GridView1.Rows.Count



        If (vmaximo Mod tamaño) = 0 Then
            cociente = Trim(Math.Floor(vmaximo / tamaño))

            For i = 1 To tamaño Step 1
                txt_repartir.Text = CStr(cociente) + "-" + txt_repartir.Text

            Next


        Else



        End If



    End Sub
End Class
