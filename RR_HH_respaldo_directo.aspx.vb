Imports System.IO
Partial Class RR_HH_respaldo_directo
    Inherits System.Web.UI.Page


    Protected Sub gv_datos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_datos.SelectedIndexChanged

        txt_id_ingsal.Text = gv_datos.SelectedRow.Cells(1).Text
        txt_fecha_marcado.Text = DateValue(gv_datos.SelectedRow.Cells(12).Text)
        txt_ci.Text = gv_datos.SelectedRow.Cells(2).Text
        txt_observacion.Text = gv_datos.SelectedRow.Cells(14).Text
        txt_hraingreso.Text = DateValue(gv_datos.SelectedRow.Cells(12).Text) + " " + gv_datos.SelectedRow.Cells(9).Text
        txt_hrasalida.Text = DateValue(gv_datos.SelectedRow.Cells(12).Text) + " " + gv_datos.SelectedRow.Cells(10).Text
        sql_ds_clases.Update()
        gv_datos.DataBind()




    End Sub





    Private Sub DIR_CAR_subir_clases_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Session("idus") <> "" Then

            'lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_sede.Text = Session("sede")
            'txt_siglacar.Text = Session("siglacar")
            ''txt_ciusuario.Text = Session("idus")
            ''txt_id_sede.Text = Session("sede")

        Else
            Response.Redirect("~/sesion.aspx")
        End If

    End Sub
End Class
