
Partial Class ADM_datos_academicos
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        sql_ds_academico.Insert()


    End Sub
    Protected Sub CheckBox3_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox3.CheckedChanged
        If CheckBox3.Checked = True Then
            txt_lic.Text = "1"
        Else
            txt_lic.Text = "0"
        End If
    End Sub
    Protected Sub CheckBox1_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked = True Then
            txt_diplomado.Text = "1"
        Else
            txt_diplomado.Text = "0"
        End If
    End Sub

    Private Sub CheckBox2_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox2.CheckedChanged
        If CheckBox2.Checked = True Then
            txt_especialidad.Text = "1"
        Else
            txt_especialidad.Text = "0"
        End If
    End Sub

    Private Sub CheckBox5_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox5.CheckedChanged
        If CheckBox5.Checked = True Then
            txt_maestria.Text = "1"
        Else
            txt_maestria.Text = "0"
        End If
    End Sub

    Private Sub CheckBox6_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox6.CheckedChanged
        If CheckBox6.Checked = True Then
            txt_doctorado.Text = "1"
        Else
            txt_doctorado.Text = "0"
        End If
    End Sub
End Class
