
Partial Class DAF_NAL_datos_aula_gral
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        GridView1.AllowPaging = False ' Si tienes paginación, desactívala
        GridView1.DataBind()

        If GridView1.Rows.Count > 0 Then
            Response.Clear()
            Response.Buffer = True
            Response.Charset = ""
            Response.ContentType = "application/vnd.ms-excel"
            Response.AddHeader("content-disposition", "attachment;filename=Lista_aulas.xls")

            ' Quitar cualquier botón de comando si es necesario
            GridView1.HeaderStyle.BackColor = Drawing.Color.LightGray

            Dim sw As New IO.StringWriter()
            Dim hw As New HtmlTextWriter(sw)



            ' Crea un formulario temporal
            Dim frm As New HtmlForm()
            frm.Attributes("runat") = "server"
            frm.Controls.Add(GridView1)

            ' Agrega el form temporal a la página
            Me.Controls.Add(frm)

            ' Renderiza el control
            frm.RenderControl(hw)

            ' Escribe el contenido al Response
            Response.Output.Write(sw.ToString())
            Response.Flush()
            Response.End()
        End If
    End Sub

End Class
