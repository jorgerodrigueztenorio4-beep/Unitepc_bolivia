
Partial Class ips
    Inherits System.Web.UI.Page


    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        txt_ip.Text = GridView1.SelectedRow.Cells(2).Text
    End Sub
End Class
