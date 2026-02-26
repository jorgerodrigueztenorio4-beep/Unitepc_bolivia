Imports System.Data

Partial Class horarios_oferta_v2
    Inherits System.Web.UI.Page
    Dim sw As ws.WebServiceSoapClient = New ws.WebServiceSoapClient

    Private Shared ReadOnly Colores As Drawing.Color() = {
        Drawing.Color.FromArgb(224, 242, 254),
        Drawing.Color.FromArgb(232, 245, 233),
        Drawing.Color.FromArgb(255, 243, 224),
        Drawing.Color.FromArgb(243, 229, 245),
        Drawing.Color.FromArgb(255, 235, 238),
        Drawing.Color.FromArgb(232, 234, 246),
        Drawing.Color.FromArgb(240, 244, 195),
        Drawing.Color.FromArgb(236, 239, 241)
    }

    Protected Sub gv_horario_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv_horario.RowDataBound

        If e.Row.RowType = DataControlRowType.DataRow Then

            For i As Integer = 1 To e.Row.Cells.Count - 1

                Dim raw As String = HttpUtility.HtmlDecode(e.Row.Cells(i).Text)

                If String.IsNullOrWhiteSpace(raw) OrElse raw = "&nbsp;" Then
                    Continue For
                End If

                ' Convertir saltos de línea a <br/>
                raw = raw.Replace(vbCrLf, "<br/>").Replace(vbLf, "<br/>")

                ' 👉 CLAVE ÚNICA DE MATERIA (primera línea)
                Dim claveMateria As String =
            raw.Split(New String() {"<br/>"}, StringSplitOptions.None)(0).Trim()

                ' 👉 MISMA materia = MISMO color
                Dim index As Integer =
            Math.Abs(claveMateria.GetHashCode()) Mod Colores.Length

                With e.Row.Cells(i)
                    .Text = raw
                    .BackColor = Colores(index)
                    .ForeColor = Drawing.Color.Black
                    .Font.Bold = False
                    .VerticalAlign = VerticalAlign.Top
                End With

            Next
        End If

    End Sub

    Private Sub horarios_oferta_v2_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim sedeId As Integer
        If txt_codigo.Text <> "" Then
            ddl_sede.Visible = True
            If ddl_sede.SelectedValue <> 0 Then


                If Integer.TryParse(ddl_sede.SelectedValue, sedeId) Then
                    'gv_estudiantes.DataSource = sw.ListaEstudiantes(sedeId)
                    'gv_estudiantes.DataBind()
                    Session("CodEstudiante") = txt_codigo.Text

                    If Session("CodEstudiante") IsNot Nothing Then

                        Dim ds As DataSet = sw.ListaEstudiantes(sedeId)

                        If ds IsNot Nothing AndAlso ds.Tables.Count > 0 Then

                            Dim dt As DataTable = ds.Tables(0)

                            Dim dv As New DataView(dt)
                            dv.RowFilter = "CodEstudiante = " & Session("CodEstudiante").ToString()

                            gv_estudiantes.DataSource = dv
                            gv_estudiantes.DataBind()
                            If gv_estudiantes.Rows.Count > 0 Then
                                txt_carrera.Text = gv_estudiantes.Rows(0).Cells(8).Text
                                ddl_semestre.Visible = True
                            End If

                        End If
                    Else
                        ' Opcional: manejar error o mensaje
                    End If
                Else
                    ' Manejo de error opcional
                End If

            Else
                txt_carrera.Focus()

            End If
        End If







    End Sub
End Class
