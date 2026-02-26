
Partial Class actu_2022
    Inherits System.Web.UI.Page
    Dim WSEBSE As wsr2.ParaControlWebSoapClient = New wsr2.ParaControlWebSoapClient
    Private Sub actu_2022_Load(sender As Object, e As EventArgs) Handles Me.Load
        'Label1.Text = GridView1.Rows.Count.ToString
        'GridView1.DataBind()
        'Label1.DataBind()
        'gvProyeccion.DataBind()
        ' gvProyeccion.DataSource = WSEBSE.RRHHCantidadxCarreraProyeccion(ddl_sede.SelectedValue.ToString, DropDownList1.SelectedValue.ToString)
        'gvProyeccion.DataBind()

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        For i As Integer = 0 To gv_clases.Rows.Count - 1
            For j As Integer = 0 To gv_proytectotodo.Rows.Count - 1
                If (gv_clases.Rows(i).Cells(3).Text.Replace("&nbsp;", "").Trim().ToUpper() = gv_proytectotodo.Rows(j).Cells(1).Text) And
                    (gv_clases.Rows(i).Cells(4).Text.Replace("&nbsp;", "").Trim().ToUpper() = gv_proytectotodo.Rows(j).Cells(2).Text) And
                    (gv_clases.Rows(i).Cells(2).Text.Replace("&nbsp;", "").Trim().ToUpper() = gv_proytectotodo.Rows(j).Cells(4).Text) Then

                    If (gv_clases.Rows(i).Cells(5).Text = "Teorico") Then
                        txt_id_desing.Text = gv_clases.Rows(i).Cells(0).Text
                        txt_horasproyec.Text = gv_proytectotodo.Rows(j).Cells(5).Text
                        sql_ds_clases.Update()


                    ElseIf (gv_clases.Rows(i).Cells(5).Text = "Practico") Then

                        txt_id_desing.Text = gv_clases.Rows(i).Cells(0).Text
                        txt_horasproyec.Text = gv_proytectotodo.Rows(j).Cells(6).Text
                        sql_ds_clases.Update()
                    End If


                Else



                End If

            Next
        Next






    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        For i = 0 To gvProyeccion.Rows.Count - 1
            txt_semestre.Text = gvProyeccion.Rows(i).Cells(1).Text
            txt_sigla.Text = gvProyeccion.Rows(i).Cells(2).Text
            txt_gteo.Text = gvProyeccion.Rows(i).Cells(3).Text
            txt_gprac.Text = gvProyeccion.Rows(i).Cells(4).Text
            sql_ds_carrera.Insert()



        Next
        gv_db.DataBind()

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged

        gvProyeccion.DataSource = WSEBSE.RRHHCantidadxCarreraProyeccion(ddl_sede.SelectedValue, DropDownList1.SelectedValue)
        gvProyeccion.DataBind()
        gv_db.DataBind()
        'gvProyeccion.DataBind()

    End Sub
End Class
