
Imports System.Data

Partial Class RRHH_Ratificaciones_gral
    Inherits System.Web.UI.Page
    Dim WSEBSE As wsr.ParaControlWebSoapClient = New wsr.ParaControlWebSoapClient
    Dim qtyTotal As Integer = 0
    Dim storid As Integer = 0
    Dim rowIndex As Integer = 1
    Private Sub RRHH_Ratificaciones_gral_Load(sender As Object, e As EventArgs) Handles Me.Load
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



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim gv_contratos As New GridView

        gv_contratos.DataSource = WSEBSE.RRHHListaDeDocentes2023()
        gv_contratos.DataBind()

        Dim gv_ratificados As New GridView
        gv_ratificados.DataSource = sql_ds_ratificados
        gv_ratificados.DataBind()

        Dim gv_planest As New GridView
        gv_planest.DataSource = sql_plan
        gv_planest.DataBind()




        Dim ds As New DataSet
        Dim dt As New DataTable("tb_contrato")
        dt.Columns.Add("carnet") '0
        dt.Columns.Add("nombre") '1
        dt.Columns.Add("papellido") '2
        dt.Columns.Add("sapellido") '3
        dt.Columns.Add("siglacar") '4
        dt.Columns.Add("siglamat") '5
        dt.Columns.Add("sede") '6
        dt.Columns.Add("clase_tipo") '7
        dt.Columns.Add("grupos") '8
        dt.Columns.Add("horas") '9

        ds.Tables.Add(dt)

        For filac As Integer = 0 To gv_contratos.Rows.Count - 1

            For filap As Integer = 0 To gv_ratificados.Rows.Count - 1
                If gv_contratos.Rows(filac).Cells(0).Text = gv_ratificados.Rows(filap).Cells(0).Text Then
                    Dim dr As DataRow = dt.NewRow

                    dr(0) = gv_contratos.Rows(filac).Cells(0).Text

                    dr(1) = gv_contratos.Rows(filac).Cells(1).Text

                    dr(2) = HttpUtility.HtmlDecode(gv_contratos.Rows(filac).Cells(2).Text)

                    dr(3) = HttpUtility.HtmlDecode(gv_contratos.Rows(filac).Cells(3).Text)

                    dr(4) = gv_contratos.Rows(filac).Cells(5).Text

                    dr(5) = gv_contratos.Rows(filac).Cells(6).Text

                    dr(6) = gv_contratos.Rows(filac).Cells(8).Text
                    dr(7) = gv_contratos.Rows(filac).Cells(9).Text
                    dr(8) = gv_contratos.Rows(filac).Cells(10).Text
                    dr(9) = gv_contratos.Rows(filac).Cells(11).Text
                    dt.Rows.Add(dr)
                End If








            Next
        Next

        Dim gv_planconsolidado As New GridView


        gv_planconsolidado.DataSource = ds
        gv_planconsolidado.DataBind()



        'DESDE AQUI MTERIAS

        Dim ds1 As New DataSet
        Dim dt1 As New DataTable("tb_TOTAL")
        dt1.Columns.Add("carnet") '0
        dt1.Columns.Add("nombreS") '1
        dt1.Columns.Add("SIGLACAR") '2
        dt1.Columns.Add("SIGLAMATERIA") '3
        dt1.Columns.Add("MATERIA") '4
        dt1.Columns.Add("TIPOCLASE") '5
        dt1.Columns.Add("HORAS") '6
        dt1.Columns.Add("GRUPO") '7
        'dt.Columns.Add("grupos") '8

        ds1.Tables.Add(dt1)

        For filaPC As Integer = 0 To gv_planconsolidado.Rows.Count - 1
            Dim dr1 As DataRow = dt1.NewRow
            dr1(0) = gv_planconsolidado.Rows(filaPC).Cells(0).Text
            dr1(1) = HttpUtility.HtmlDecode(gv_planconsolidado.Rows(filaPC).Cells(1).Text) + " " + HttpUtility.HtmlDecode(gv_planconsolidado.Rows(filaPC).Cells(2).Text) + " " + HttpUtility.HtmlDecode(gv_planconsolidado.Rows(filaPC).Cells(3).Text)
            dr1(2) = gv_planconsolidado.Rows(filaPC).Cells(4).Text
            dr1(3) = gv_planconsolidado.Rows(filaPC).Cells(5).Text


            For filaPE As Integer = 0 To gv_planest.Rows.Count - 1

                If gv_planconsolidado.Rows(filaPC).Cells(6).Text = gv_planest.Rows(filaPE).Cells(9).Text And gv_planconsolidado.Rows(filaPC).Cells(5).Text = Trim(gv_planest.Rows(filaPE).Cells(2).Text) Then
                    dr1(4) = gv_planest.Rows(filaPE).Cells(3).Text
                    dr1(5) = gv_planconsolidado.Rows(filaPC).Cells(7).Text
                    dr1(6) = gv_planconsolidado.Rows(filaPC).Cells(9).Text
                    'If gv_planconsolidado.Rows(filaPC).Cells(7).Text = "T" Then

                    'End If

                    'If gv_planconsolidado.Rows(filaPC).Cells(7).Text = "P" Then
                    '    dr1(6) = gv_planest.Rows(filaPE).Cells(6).Text
                    'End If

                    dr1(7) = gv_planconsolidado.Rows(filaPC).Cells(8).Text


                End If








            Next
            dt1.Rows.Add(dr1)
        Next
        gv_final.DataSource = ds1
        gv_final.DataBind()


    End Sub

    Private Sub gv_final_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv_final.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "carnet").ToString())
            Dim tmpTotal As Integer = (Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "HORAS").ToString()))

            qtyTotal += tmpTotal


        End If
    End Sub

    Private Sub gv_final_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_final.RowCreated
        Dim newRow As Boolean = False
        If (storid > 0) AndAlso (DataBinder.Eval(e.Row.DataItem, "carnet") IsNot Nothing) Then
            If storid <> Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "carnet").ToString()) Then
                newRow = True
            End If
        End If
        If (storid > 0) AndAlso (DataBinder.Eval(e.Row.DataItem, "carnet") Is Nothing) Then
            newRow = True
            rowIndex = 0
        End If
        If newRow Then
            Dim GridView1 As GridView = DirectCast(sender, GridView)
            Dim NewTotalRow As New GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert)
            NewTotalRow.Font.Bold = True
            NewTotalRow.BackColor = System.Drawing.Color.FromName("#cac831")
            NewTotalRow.ForeColor = System.Drawing.Color.Black
            Dim HeaderCell As New TableCell()
            HeaderCell.Text = "Horas Semestrales :"
            HeaderCell.HorizontalAlign = HorizontalAlign.Left
            HeaderCell.ColumnSpan = 6
            NewTotalRow.Cells.Add(HeaderCell)
            HeaderCell = New TableCell()
            HeaderCell.HorizontalAlign = HorizontalAlign.Right
            HeaderCell.Text = qtyTotal.ToString()
            NewTotalRow.Cells.Add(HeaderCell)
            GridView1.Controls(0).Controls.AddAt(e.Row.RowIndex + rowIndex, NewTotalRow)
            rowIndex += 1
            qtyTotal = 0
        End If
    End Sub
End Class
