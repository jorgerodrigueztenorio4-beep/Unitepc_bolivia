
Imports System.IO

Partial Class ADM_BLO_subir_aulas
    Inherits System.Web.UI.Page

    Private Sub DAF_LOCAL_subir_aulas_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            lbl_cargo.Text = Session("rol_nombre") + "--->" + Session("nombre_usuario")
            txt_idsde.Text = Session("sede")
            'If ddl_bloque.SelectedItem.Text = "JUAN PABLO II (A)" Or ddl_bloque.SelectedItem.Text = "JUAN PABLO II (B)" Or ddl_bloque.SelectedItem.Text = "JUAN PABLO II (C)" Or ddl_bloque.SelectedItem.Text = "COLONIAL" Or ddl_bloque.SelectedItem.Text = "Ivirgarzama" Or ddl_bloque.SelectedItem.Text = "VILLA ADELA II" Then
            '    btn_agregar.Visible = True

            'End If

            'If ddl_bloque.SelectedItem.Text = "FLORIDA NORTE" Then
            '    btn_agregar.Visible = False

            'End If
        Else
            Response.Redirect("~/sesion.aspx")
        End If




    End Sub

    Protected Sub btn_agregar_Click(sender As Object, e As EventArgs) Handles btn_agregar.Click
        ' If (FileUpload1.HasFile) Then
        ' Label1.Visible = False
        'Dim exob As String
        'exob = Path.GetExtension(Me.FileUpload1.FileName)
        'gv_ultimo.DataBind()
        'Dim reg As String
        'reg = Me.gv_ultimo.Rows(0).Cells(0).Text + 1


        '  Dim guardar As String
        'guardar = reg + exob
        'txt_img_guarda.Text = guardar
        ' Me.FileUpload1.SaveAs(Server.MapPath("~") & "\img_aulas\" & guardar)
        Me.sql_ds_ultimo.Insert()
        Response.Write("<script>alert(""Se Registro el Aula Exitosamente"");window.location.href = ""ADM_BLO_subir_aulas.aspx"";</script>")
        'Else
        ' Label1.Visible = True
        ' End If
    End Sub
End Class
