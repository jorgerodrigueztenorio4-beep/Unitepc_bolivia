
Partial Class RR_HH_materias_con_sin_doc
    Inherits System.Web.UI.Page

    Private Sub RR_HH_materias_con_sin_doc_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            'lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_sede.Text = Session("sede")
            'txt_siglacar.Text = Session("siglacar")
            ''txt_ciusuario.Text = Session("idus")
            ''txt_id_sede.Text = Session("sede")

        Else
            Response.Redirect("~/sesion.aspx")
        End If



        Dim total As Integer
        Dim conmat, sinmat, restcon, restsin As Double
        gv_condoc_car.DataBind()
        gv_sindoc_car.DataBind()
        gv_total_car.DataBind()


        If gv_total_car.Rows.Count > 0 And gv_sindoc_car.Rows.Count > 0 And gv_condoc_car.Rows.Count > 0 Then
            total = gv_total_car.Rows(0).Cells(0).Text
            conmat = gv_condoc_car.Rows(0).Cells(0).Text
            sinmat = gv_sindoc_car.Rows(0).Cells(0).Text
            restcon = (100 * conmat) / total
            restsin = (100 * sinmat) / total
            lbl_conmat.Text = restcon
            lbl_sinmat.Text = restsin
        End If

    End Sub
End Class
