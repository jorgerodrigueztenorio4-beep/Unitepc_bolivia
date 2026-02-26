
Imports System.Data

Partial Class consumir_servicios
    Inherits System.Web.UI.Page
    Dim sw As ws.WebServiceSoapClient = New ws.WebServiceSoapClient
    Dim ws2 As wsr.ParaControlWebSoapClient = New wsr.ParaControlWebSoapClient

    Private Sub consumir_servicios_Load(sender As Object, e As EventArgs) Handles Me.Load
        'gv_estudiantes.DataSource = sw.ListaEstudiantes(1)
        'gv_estudiantes.DataBind()
        'Session("CodEstudiante") = 1104524

        'If Session("CodEstudiante") IsNot Nothing Then

        '    Dim ds As DataSet = sw.ListaEstudiantes(1)

        '    If ds IsNot Nothing AndAlso ds.Tables.Count > 0 Then

        '        Dim dt As DataTable = ds.Tables(0)

        '        Dim dv As New DataView(dt)
        '        dv.RowFilter = "CodEstudiante = " & Session("CodEstudiante").ToString()

        '        gv_estudiantes.DataSource = dv
        '        gv_estudiantes.DataBind()

        '    End If
        'Else
        '    ' Opcional: manejar error o mensaje
        'End If
        ''desde aqui es el otro servicio para byuscar al estu

        gv_datosmas.DataSource = ws2.BuscaEstudiante(1, "1104524")
        gv_datosmas.DataBind()

    End Sub
End Class
