
Imports System.Data

Partial Class DAF_NAL_aprovechamiento_aulas_gral
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim gv_aulas, gv_detalle, gv_mañana, gv_tarde, gv_noche, gv_dia As New GridView
        gv_aulas.DataSource = sql_ds_aulas
        gv_dia.DataSource = sql_ds_dias
        gv_dia.DataBind()

        gv_aulas.DataBind()
        Dim ds As New DataSet
        Dim dt As New DataTable("tb_detalle")
        dt.Columns.Add("Sede") ' 0
        dt.Columns.Add("Bloque") '1
        dt.Columns.Add("Aula") '2
        dt.Columns.Add("Dia") '3
        dt.Columns.Add("Aprovechamiento Gral.") '4
        dt.Columns.Add("Aprovechamiento Mañana") '5
        dt.Columns.Add("Aprovechamiento Tarde") '6
        dt.Columns.Add("Aprovechamiento Noche") '7
        ds.Tables.Add(dt)
        For i = 0 To gv_aulas.Rows.Count - 1

            txt_id_aula.Text = gv_aulas.Rows(i).Cells(0).Text

            gv_noche.DataSource = sql_noche
            gv_detalle.DataSource = sql_detalle
            gv_mañana.DataSource = sql_manana
            gv_tarde.DataSource = sql_tarde
            gv_detalle.DataBind()
            gv_tarde.DataBind()
            gv_mañana.DataBind()
            gv_noche.DataBind()
            For d = 0 To gv_dia.Rows.Count - 1
                Dim dr As DataRow = dt.NewRow
                dr(0) = ddl_sede.SelectedItem.Text
                dr(1) = gv_aulas.Rows(i).Cells(4).Text
                dr(2) = HttpUtility.HtmlDecode(gv_aulas.Rows(i).Cells(1).Text)
                For j = 0 To gv_detalle.Rows.Count - 1
                    If gv_dia.Rows(d).Cells(1).Text = gv_detalle.Rows(j).Cells(1).Text Then
                        dr(3) = gv_detalle.Rows(j).Cells(1).Text
                        dr(4) = gv_detalle.Rows(j).Cells(3).Text + " % "
                    End If
                    'dr(5) = gv_mañana.Rows(k).Cells(3).Text + " % "
                    ' dr(6) = gv_tarde.Rows(j).Cells(3).Text + " % "
                Next
                gv_mañana.DataBind()
                For k = 0 To gv_mañana.Rows.Count - 1
                    If gv_dia.Rows(d).Cells(1).Text = gv_mañana.Rows(k).Cells(1).Text Then
                        dr(5) = gv_mañana.Rows(k).Cells(3).Text + " % "
                    Else
                        'dr(5) = "Turno Libre"
                    End If

                Next
                For l = 0 To gv_tarde.Rows.Count - 1
                    If gv_dia.Rows(d).Cells(1).Text = gv_tarde.Rows(l).Cells(1).Text Then
                        dr(6) = gv_tarde.Rows(l).Cells(3).Text + " % "
                    Else
                        'dr(6) = "Turno Libre"
                    End If
                Next
                For m = 0 To gv_noche.Rows.Count - 1
                    If gv_dia.Rows(d).Cells(1).Text = gv_noche.Rows(m).Cells(1).Text Then
                        dr(7) = gv_noche.Rows(m).Cells(3).Text + " % "
                    Else
                        'dr(6) = "Turno Libre"
                    End If
                Next
                dt.Rows.Add(dr)
            Next



        Next
            gv_resultados.DataSource = dt
        gv_resultados.DataBind()
        For t = 0 To gv_resultados.Rows.Count - 1
            If gv_resultados.Rows(t).Cells(6).Text = "&nbsp;" Then
                gv_resultados.Rows(t).Cells(6).Text = "Sin Clases en Este Turno"

            End If
            If gv_resultados.Rows(t).Cells(5).Text = "&nbsp;" Then
                gv_resultados.Rows(t).Cells(5).Text = "Sin Clases en Este Turno"

            End If
            If gv_resultados.Rows(t).Cells(7).Text = "&nbsp;" Then
                gv_resultados.Rows(t).Cells(7).Text = "Sin Clases en Este Turno"

            End If
        Next
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim tw As New IO.StringWriter()
        Dim hw As New System.Web.UI.HtmlTextWriter(tw)
        Dim frm As HtmlForm = New HtmlForm()
        Response.ContentType = "application/vnd.ms-excel"
        Response.AddHeader("content-disposition", "attachment;filename=" & "Aprovechamiento Aulas " + ddl_sede.SelectedItem.Text & ".xls")
        Response.Charset = ""
        EnableViewState = False
        Controls.Add(frm)
        frm.Controls.Add(gv_resultados) 'GridView1 nombre del GridView suyo
        frm.RenderControl(hw)
        Response.Write(tw.ToString())
        Response.End()
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click

        Dim gv_aulas, gv_detalle, gv_mañana, gv_tarde, gv_noche As New GridView
        gv_aulas.DataSource = sql_ds_aulas


        gv_aulas.DataBind()
        Dim ds As New DataSet
        Dim dt As New DataTable("tb_detalle")
        dt.Columns.Add("Sede") ' 0
        dt.Columns.Add("Bloque") '1
        dt.Columns.Add("Aula") '2
        dt.Columns.Add("Dia") '3
        dt.Columns.Add("Aprovechamiento Gral.") '4

        ds.Tables.Add(dt)
        For i = 0 To gv_aulas.Rows.Count - 1
            txt_id_aula.Text = gv_aulas.Rows(i).Cells(0).Text
            gv_detalle.DataSource = sql_detalle
            'gv_mañana.DataSource = sql_manana
            'gv_tarde.DataSource = sql_tarde
            'gv_noche.DataSource = sql_noche
            gv_detalle.DataBind()
            'gv_mañana.DataBind()
            'gv_tarde.DataBind()
            'gv_noche.DataBind()

            For j = 0 To gv_detalle.Rows.Count - 1

                Dim dr As DataRow = dt.NewRow
                dr(0) = ddl_sede.SelectedItem.Text
                dr(1) = gv_aulas.Rows(i).Cells(4).Text
                dr(2) = HttpUtility.HtmlDecode(gv_aulas.Rows(i).Cells(1).Text)
                dr(3) = gv_detalle.Rows(j).Cells(1).Text
                dr(4) = gv_detalle.Rows(j).Cells(3).Text + " % "

            Next


        Next
        gv_resultados.DataSource = dt
        gv_resultados.DataBind()

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
