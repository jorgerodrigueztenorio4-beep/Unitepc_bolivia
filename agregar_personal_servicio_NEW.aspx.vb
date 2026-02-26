
Imports System.Data

Partial Class agregar_personal_servicio_NEW
    Inherits System.Web.UI.Page
    Dim WSEBSE As wsr2.ParaControlWebSoapClient = New wsr2.ParaControlWebSoapClient

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click


        Dim ds As DataSet = WSEBSE.RRHHListaDeDocentes2023()

        Dim dt As DataTable = ds.Tables(0)

        Dim dv As New DataView(dt)

        dv.RowFilter = "Sede = '1' AND CodCarre = 'CARmed1'"

        gv_lista.DataSource = dv
        gv_lista.DataBind()


    End Sub
End Class
