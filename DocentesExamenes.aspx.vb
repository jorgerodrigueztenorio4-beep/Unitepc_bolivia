
Partial Class DocentesExamenes
    Inherits System.Web.UI.Page


    Private Sub DocentesExamenes_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Dim row As GridViewRow = GridView1.SelectedRow

        Dim materia As String = Server.HtmlDecode(row.Cells(2).Text)
        Dim grupo As String = Server.HtmlDecode(row.Cells(3).Text)
        Dim tipoClase As String = Server.HtmlDecode(row.Cells(4).Text)

        lblMensaje.Text = "Realizara el banco de preguntas para la materia de " + materia + " del grupo " + grupo + " con el tipo de clase " + tipoClase + "."
        alertMensaje.Style("display") = "block"
    End Sub

End Class
