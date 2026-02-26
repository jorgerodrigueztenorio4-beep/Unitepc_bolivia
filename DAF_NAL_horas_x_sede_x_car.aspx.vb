
Imports System.Data

Partial Class DAF_NAL_horas_x_sede_x_car
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim ds As New DataSet
        Dim dt As New DataTable("tablaingsal")

        dt.Columns.Add("Docente") '(0)
        dt.Columns.Add("ci") '(1)
        dt.Columns.Add("horas") '(2)

        'dt.Columns.Add("ci") '(0)
        'dt.Columns.Add("horas") '(1)
        'dt.Columns.Add("Docente") '(2)

        ds.Tables.Add(dt)
        gv_dcentes.DataBind()
        gv_ingsal.DataBind()

        For fila As Integer = 0 To gv_dcentes.Rows.Count - 1
            Dim cont As Integer = 0
            Dim cont2 As Integer = 0
            For filas As Integer = 0 To gv_ingsal.Rows.Count - 1

                Dim dr As DataRow = dt.NewRow

                If gv_dcentes.Rows(fila).Cells(1).Text = gv_ingsal.Rows(filas).Cells(0).Text Then
                    cont = 1

                    dr(1) = gv_dcentes.Rows(fila).Cells(1).Text
                    dr(2) = gv_ingsal.Rows(filas).Cells(1).Text
                    dr(0) = HttpUtility.HtmlDecode(gv_dcentes.Rows(fila).Cells(0).Text)

                    dt.Rows.Add(dr)

                Else


                End If
                If filas = gv_ingsal.Rows.Count - 1 Then
                    cont2 = 1

                End If
                If cont = 0 And cont2 = 1 Then
                    cont = 0
                    cont2 = 0

                    dr(1) = gv_dcentes.Rows(fila).Cells(1).Text
                    dr(2) = "0"
                    dr(0) = HttpUtility.HtmlDecode(gv_dcentes.Rows(fila).Cells(0).Text)
                    dt.Rows.Add(dr)
                End If



            Next

            'If cont = 0 Then
            '    dr(0) = gv_dcentes.Rows(fila).Cells(1).Text
            '    dr(1) = "0"
            '    dt.Rows.Add(dr)
            'End If
        Next

        gv_total.DataSource = ds
        gv_total.DataBind()

        If gv_dcentes.Rows.Count > 0 Then
            lbl_totdoc.Text = gv_dcentes.Rows.Count.ToString

        End If
        For sinmarcar As Integer = 0 To gv_total.Rows.Count - 1

            Dim sinm, conm As Integer
            If gv_total.Rows(sinmarcar).Cells(2).Text = 0 Then
                gv_total.Rows(sinmarcar).BackColor = Drawing.Color.FromName("#f79da6")
                gv_total.Rows(sinmarcar).ForeColor = Drawing.Color.FromName("#FFFFFF")

                sinm = sinm + 1
            Else
                conm = conm + 1
                gv_total.Rows(sinmarcar).BackColor = Drawing.Color.FromName("#f5e9c8")
                'gv_total.Rows(sinmarcar).ForeColor = Drawing.Color.FromName("#FFFFFF")
            End If
            lbl_sinm.Text = sinm
            lblmarca.Text = conm
        Next



    End Sub
End Class
