
Imports System.Data

Partial Class DIR_CAR_eliminar_horario
    Inherits System.Web.UI.Page


    Protected Sub gv_horarios_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gv_horarios.SelectedIndexChanged
        txt_id_horairo.Text = gv_horarios.SelectedRow.Cells(2).Text
        txt_objeto.Text = gv_horarios.SelectedRow.Cells(1).Text + "" + gv_horarios.SelectedRow.Cells(2).Text + "" + gv_horarios.SelectedRow.Cells(3).Text + "" + gv_horarios.SelectedRow.Cells(5).Text + "" + gv_horarios.SelectedRow.Cells(6).Text + "" + gv_horarios.SelectedRow.Cells(7).Text + "GRUPO : " + gv_horarios.SelectedRow.Cells(10).Text
        sql_ds_carrera.Insert()

        sql_horarios.Delete()
        sql_ds_selec.Delete()
        gv_horarios.DataBind()


        'gv_horarios.Visible = False
        'ddl_carrera.Visible = False
        'ddl_sede.Visible = False
        'Button2.Visible = True
        ''txt_hora.Visible = True
        'Button1.Visible = True
        'gv_selec.DataBind()

        'gv_selec.Visible = True
    End Sub

    Private Sub SEC_DIR_ACD_Lista_Horarios_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            ' lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
            ' txt_cius.Text = Session("idus")

            lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            'txt_cius.Text = Session("idus")
            txt_sede.Text = Session("sede")
            txt_sigla_car.Text = Session("siglacar")
            lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
            txt_sede.Text = Session("sede")


        Else
            Response.Redirect("~/sesion.aspx")
        End If


        'Dim GV_HABILITADOS As New GridView
        'GV_HABILITADOS.DataSource = SQL_DS_HABILITAR_HORARIO
        'GV_HABILITADOS.DataBind()



        'Dim habilitado As String
        'habilitado = "HABILITADO"
        'If (txt_id_sede.Text = GV_HABILITADOS.Rows(0).Cells(3).Text) Then
        '    If txt_sigla_carrera.Text.Trim() = GV_HABILITADOS.Rows(0).Cells(1).Text.Trim() And habilitado = GV_HABILITADOS.Rows(0).Cells(2).Text.Trim() Then
        '        gv_horarios.Columns(0).Visible = True
        '    Else
        '        gv_horarios.Columns(0).Visible = False
        '    End If
        'End If



        If Not IsPostBack Then

            Dim dv As DataView =
                CType(SQL_DS_HABILITAR_HORARIO.Select(DataSourceSelectArguments.Empty), DataView)

            Dim puedeEliminar As Boolean = False

            If dv IsNot Nothing AndAlso dv.Count > 0 Then
                puedeEliminar =
                    txt_sede.Text.Trim() = dv(0)("sede").ToString().Trim() AndAlso
                    txt_sigla_car.Text.Trim() = dv(0)("carrera").ToString().Trim() AndAlso
                    dv(0)("habilitacion").ToString().Trim().ToUpper() = "HABILITADO"
            End If

            ' 🔴 SOLO esto, nada de DataBind
            gv_horarios.Columns(0).Visible = puedeEliminar

        End If



    End Sub

    Private Sub gv_horarios_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv_horarios.RowDataBound
        'If e.Row.RowType = DataControlRowType.DataRow Then

        '    ' El botón Select es el primer control de la primera celda
        '    Dim btnEliminar As Button = CType(e.Row.Cells(0).Controls(0), Button)

        '    btnEliminar.OnClientClick = "return confirm('¿Está seguro de eliminar este horario?');"

        'End If
    End Sub
End Class
