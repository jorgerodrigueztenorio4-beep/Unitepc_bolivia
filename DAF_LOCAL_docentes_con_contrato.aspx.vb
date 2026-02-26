
Partial Class DAF_LOCAL_docentes_con_contrato
    Inherits System.Web.UI.Page
    Dim total, condoc, sindoc, respcondoc, respsindoc As Integer

    Private Sub DAF_NAL_docentes_con_contrato_Load(sender As Object, e As EventArgs) Handles Me.Load



        If Session("idus") <> "" Then

            'lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
            txt_idsde.Text = Session("sede")



        Else
            Response.Redirect("~/sesion.aspx")
        End If


        gv_docentes_c_c.DataBind()

        If gv_docentes_c_c.Rows.Count > 0 Then
            total = gv_docentes_c_c.Rows(0).Cells(0).Text
            lbl_cantc.Text = gv_docentes_c_c.Rows(0).Cells(0).Text

        End If
        gv_con_docente.DataBind()
        If gv_con_docente.Rows.Count > 0 Then
            respcondoc = (gv_con_docente.Rows(0).Cells(0).Text * 100) / total
            lbl_con_mat.Text = gv_con_docente.Rows(0).Cells(0).Text
            lbl_coonpor.Text = CStr(respcondoc)


        End If

        gv_sin_docente.DataBind()
        If gv_sin_docente.Rows.Count > 0 Then

            respsindoc = (gv_sin_docente.Rows(0).Cells(0).Text * 100) / total
            lbl_sin_mat.Text = gv_sin_docente.Rows(0).Cells(0).Text
            lbl_sinpor.Text = CStr(respsindoc)
        End If




    End Sub
End Class
