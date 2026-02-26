
Partial Class busca_fantasma
    Inherits System.Web.UI.Page
    Dim WSEBSE As wsr.ParaControlWebSoapClient = New wsr.ParaControlWebSoapClient

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_lista.DataSource = WSEBSE.RRHHListaDeDocentes2023()

        gv_lista.DataBind()
        For filas As Integer = 0 To gv_lista.Rows.Count - 1
            txt_ci.Text = gv_lista.Rows(filas).Cells(0).Text
            txt_nombre.Text = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(1).Text)
            txt_ppa.Text = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(2).Text)
            txt_sap.Text = HttpUtility.HtmlDecode(gv_lista.Rows(filas).Cells(3).Text)
            gv_existe.DataBind()

            If gv_existe.Rows.Count > 0 Then


            ElseIf gv_existe.Rows.Count <= 0 Then
                sql_ds_existe.Insert()
            End If
        Next
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        gv_lista.DataSource = WSEBSE.RRHHListaDeDocentes2023()

        gv_lista.DataBind()
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click







        Dim res As Integer
        res = 0
        Dim boolExiste As Boolean
        Dim comp1, comp2 As String

        For filas As Integer = 0 To gv_lista.Rows.Count - 1

            For filash As Integer = 0 To GV_HORARIOS.Rows.Count - 1
                boolExiste = False

                comp1 = gv_lista.Rows(filas).Cells(5).Text + gv_lista.Rows(filas).Cells(8).Text + gv_lista.Rows(filas).Cells(6).Text + gv_lista.Rows(filas).Cells(9).Text + gv_lista.Rows(filas).Cells(10).Text
                comp2 = GV_HORARIOS.Rows(filash).Cells(6).Text + "1" + GV_HORARIOS.Rows(filash).Cells(12).Text + GV_HORARIOS.Rows(filash).Cells(8).Text + GV_HORARIOS.Rows(filash).Cells(9).Text + GV_HORARIOS.Rows(filash).Cells(5).Text
                If comp1 = comp2 Then
                    boolExiste = True

                    '        Else
                    '            res = res + 1

                    Exit For
                End If


            Next
            If boolExiste = False Then
                res = res + 1
                txt_suma.Text = res
                boolExiste = False
                ListBox1.Items.Add(gv_lista.Rows(filas).Cells(0).Text + "---" + gv_lista.Rows(filas).Cells(5).Text + gv_lista.Rows(filas).Cells(8).Text + gv_lista.Rows(filas).Cells(6).Text + gv_lista.Rows(filas).Cells(9).Text + gv_lista.Rows(filas).Cells(10).Text)
            End If
        Next
    End Sub

    Protected Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        gv_fecvha.DataBind()
        Dim restringido As Date = "21/09/2023"
        If txt_fechabus.Text >= restringido Then
            txt_suma.Text = "Permitido"
        Else
            txt_suma.Text = "No Permitido"
        End If

    End Sub
End Class
