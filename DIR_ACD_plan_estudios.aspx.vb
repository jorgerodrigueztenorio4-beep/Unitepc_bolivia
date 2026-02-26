
Imports System.Data.SqlClient

Partial Class ADM_plan_estudios
    Inherits System.Web.UI.Page
    Dim ws1 As wsr2.ParaControlWebSoapClient = New wsr2.ParaControlWebSoapClient




    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        gv_plan.DataSource = ws1.PlanesDeEstudio("1", ddl_ant_nuevo.SelectedValue.ToString, ddl_carrera.SelectedValue.ToString)
        gv_plan.DataBind()

        'gv_plan.DataSource = ws1.PlanesDeEstudio("1", "N", "carmed")
        'gv_plan.DataBind()



        'gv_facul.DataSource = ws1.ListaDeFacultades("1")
        'gv_facul.DataBind()
        'gv_carrera.DataSource = ws1.ListaDeCarreras("1", "4")
        'gv_carrera.DataBind()





    End Sub



    'Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
    '    Dim conexion As New SqlConnection("Data Source=SRV-HORYVIS;Initial Catalog=unitepc_bolivia;Integrated Security=True")
    '    conexion.Open()

    '    For Each row As GridViewRow In gv_plan.Rows
    '        If row.RowType = DataControlRowType.DataRow Then
    '            Dim codcar As String = row.Cells(0).Text.Trim()
    '            Dim siglaP As String = row.Cells(1).Text.Trim()
    '            Dim materia As String = row.Cells(2).Text.Trim()
    '            Dim semestre As Integer = Convert.ToInt32(row.Cells(3).Text)
    '            Dim hrsTeoricas As Integer = Convert.ToInt32(row.Cells(4).Text)
    '            Dim hrsPracticas As Integer = Convert.ToInt32(row.Cells(5).Text)
    '            Dim hrsTotal As Integer = Convert.ToInt32(row.Cells(6).Text)
    '            Dim creditos As Integer = Convert.ToInt32(row.Cells(7).Text)

    '            Dim cmd As New SqlCommand("INSERT INTO planes_estudios (codcar, SiglaP, Materia, Semestre, Hrs_teoricas, Hrs_practicas, Hrs_Total, Creditos, Sede_id, Sis_plan) " &
    '                                  "VALUES (@codcar, @SiglaP, @Materia, @Semestre, @Hrs_teoricas, @Hrs_practicas, @Hrs_Total, @Creditos, @Sede_id, @Sis_plan)", conexion)

    '            cmd.Parameters.AddWithValue("@codcar", codcar)
    '            cmd.Parameters.AddWithValue("@SiglaP", siglaP)
    '            cmd.Parameters.AddWithValue("@Materia", materia)
    '            cmd.Parameters.AddWithValue("@Semestre", semestre)
    '            cmd.Parameters.AddWithValue("@Hrs_teoricas", hrsTeoricas)
    '            cmd.Parameters.AddWithValue("@Hrs_practicas", hrsPracticas)
    '            cmd.Parameters.AddWithValue("@Hrs_Total", hrsTotal)
    '            cmd.Parameters.AddWithValue("@Creditos", creditos)
    '            cmd.Parameters.AddWithValue("@Sede_id", 1)
    '            cmd.Parameters.AddWithValue("@Sis_plan", "N") ' Ajusta según necesites

    '            cmd.ExecuteNonQuery()
    '        End If
    '    Next

    '    conexion.Close()
    '    'lblMensaje.Text = "✅ Los datos fueron guardados correctamente en SQL Server."

    'End Sub
End Class
