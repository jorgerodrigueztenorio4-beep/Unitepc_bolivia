
Partial Class ADM_BLO_Horarios_dia
    Inherits System.Web.UI.Page

    Private Sub DIR_CAR_Horarios_dia_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("idus") <> "" Then

            'lbl_cargo.Text = Session("rol_nombre") + " de " + Session("nombrecar") + "--->" + Session("nombre_usuario")
            ''txt_cius.Text = Session("idus")
            'txt_sede.text = Session("sede")
            'txt_sigla_car.Text = Session("siglacar")
            ' lbl_cargo.Text = Session("rol_nombre") + " : " + Session("nombre_usuario")
            txt_sede.Text = Session("sede")


        Else
            Response.Redirect("~/sesion.aspx")
        End If
    End Sub
    Protected Sub gv_horario_RowDataBound(sender As Object, e As GridViewRowEventArgs)

        If e.Row.RowType = DataControlRowType.DataRow Then

            ProcesarCelda(e.Row, 1) ' Lunes
            ProcesarCelda(e.Row, 2) ' Martes
            ProcesarCelda(e.Row, 3) ' Miercoles
            ProcesarCelda(e.Row, 4) ' Jueves
            ProcesarCelda(e.Row, 5) ' Viernes
            ProcesarCelda(e.Row, 6) ' Viernes

        End If

    End Sub


    Private Sub ProcesarCelda(row As GridViewRow, columnIndex As Integer)

        If row.Cells.Count <= columnIndex Then Exit Sub

        Dim lbl As Label = TryCast(row.Cells(columnIndex).Controls(1), Label)

        If lbl Is Nothing Then Exit Sub

        If lbl.Text.Contains("Carrera:") Then

            Dim partes() As String = lbl.Text.Split(New String() {"Carrera:"}, StringSplitOptions.None)

            If partes.Length > 1 Then

                Dim carrera As String = partes(1).Trim()

                Dim colorHex As String = ObtenerColorCarrera(carrera)

                Dim badge As String = "<span style='background-color:" & colorHex & "; " &
                      "color:#333; font-size:9pt; padding:2px 12px; " &
                      "border-radius:20px; font-weight:600; display:inline-block;'>" &
                      carrera & "</span>"

                lbl.Text = partes(0) & badge

            End If

        End If

    End Sub


    Private Function ObtenerColorCarrera(codCar As String) As String

        Select Case codCar.ToUpper()

            Case "AUXILIAR DE ENFERMERIA"
                Return "#A8DADC"   ' Verde agua pastel

            Case "BIOQUIMICA Y FARMACIA"
                Return "#BDE0FE"   ' Azul cielo pastel

            Case "T.S. ENFERMERÍA"
                Return "#CDB4DB"   ' Lila pastel

            Case "LIC.ENFERMERIA"
                Return "#FFC8DD"   ' Rosa pastel

            Case "FISIOTERAPIA Y KINESIOLOGIA"
                Return "#D8F3DC"   ' Verde menta

            Case "T.S. FISIOTERAPIA"
                Return "#FFD6A5"   ' Durazno pastel

            Case "FONOAUDIOLOGIA"
                Return "#B5EAEA"   ' Turquesa pastel

            Case "MEDICINA"
                Return "#FFADAD"   ' Rojo suave pastel

            Case "NUTRICION Y DIETETICA"
                Return "#FDFFB6"   ' Amarillo crema

            Case "ODONTOLOGIA"
                Return "#A0C4FF"   ' Azul suave

            Case "PROTESIS DENTAL"
                Return "#E4C1F9"   ' Lavanda pastel

            Case "T.S. FONOAUDIOLOGÍA"
                Return "#CAF0F8"   ' Celeste muy claro

            Case "ANALISIS DE SISTEMAS"
                Return "#90DBF4"   ' Azul tecnológico pastel

            Case "INGENIERIA ELECTRONICA"
                Return "#B9FBC0"   ' Verde claro moderno

            Case "INGENIERIA BIOMEDICA"
                Return "#FFCBCB"   ' Rosa claro

            Case "INGENIERIA COMERCIAL"
                Return "#C7F9CC"   ' Verde corporativo pastel

            Case "MECANICA AUTOMOTRIZ (TS)"
                Return "#FDE2E4"   ' Rosa grisáceo suave

            Case "INGENIERIA DE SISTEMAS"
                Return "#A9DEF9"   ' Azul institucional pastel

            Case "INGENIERIA DE SONIDO"
                Return "#E0BBE4"   ' Lila moderno

            Case "DERECHO"
                Return "#E6E6FA"   ' Lavanda formal

            Case "ADMINISTRACIÓN DE EMPRESAS"
                Return "#D0F4DE"   ' Verde administrativo

            Case "ARTE Y ESCULTURA"
                Return "#F1C0E8"   ' Rosa artístico

            Case "COMPLEMENTARIA ADMINISTRACION DE EMPRESAS"
                Return "#CDEAC0"

            Case "COMPLEMENTARIA CONTADURIA PUBLICA"
                Return "#F9C5D1"

            Case "COMPLEMENTARIA INGENIERIA COMERCIAL"
                Return "#B8E0D2"

            Case "CONTADURIA PUBLICA"
                Return "#D4F1F4"

            Case "COMUNICACION SOCIAL"
                Return "#FAD2E1"

            Case "ECONOMÍA"
                Return "#FFF1B6"

            Case "MEDICINA VETERINARIA"
                Return "#C1FFD7"

            Case "MEDICINA VETERINARIA Y ZOOTECNIA"
                Return "#D0E6A5"

            Case "ADMINISTRACION DE EMPRESAS A DISTANCIA"
                Return "#E3F6F5"

            Case "CIENCIAS DE LA EDUCACION A DISTANCIA"
                Return "#F7D6E0"

            Case "COTADURIA PUBLICA A DISTANCIA"
                Return "#E2ECE9"

            Case "COMUNICACION SOCIAL A DISTANCIA"
                Return "#F6DFEB"

            Case "DERECHO A DISTANCIA"
                Return "#EAE4F2"

            Case "ECONOMIA A DISTANCIA"
                Return "#FDFCDC"

            Case "INGENIERIA COMERCIAL A DISTANCIA"
                Return "#C7CEEA"

            Case "INGENIERIA DE SISTEMAS A DISTANCIA"
                Return "#A0E7E5"

            Case "PEDAGOGIA PARA MAESTROS NORMALISTAS A DISTANCIA"
                Return "#FDE2E4"

            Case "LICENCIATURA EN CINEMATOGRAFÍA"
                Return "#D5AAFF"

            Case Else
                Return "#E0E0E0"

        End Select

        'Select Case codCar.ToUpper()

        '        Case "CARAEF"
        '            Return "#A7C7E7"

        '        Case "CARBYF"
        '            Return "#B5EAD7"

        '        Case "CARENF"
        '            Return "#FFDAC1"

        '        Case "CARENL"
        '            Return "#E2F0CB"

        '        Case "CARFIS"
        '            Return "#FFB7B2"

        '        Case "CARFIT"
        '            Return "#C7CEEA"

        '        Case "CARFON"
        '            Return "#F6DFEB"

        '        Case "CARMED"
        '            Return "#D5AAFF"

        '        Case "CARNYD"
        '            Return "#FFF5BA"

        '        Case "CARODO"
        '            Return "#CDE7BE"

        '        Case "CARPRO"
        '            Return "#F9C5D1"

        '        Case "CARTFO"
        '            Return "#D0F4DE"

        '        Case "CARASI"
        '            Return "#E4C1F9"

        '        Case "CARELE"
        '            Return "#BDE0FE"

        '        Case "CARIBI"
        '            Return "#FFC8DD"

        '        Case "CARICO"
        '            Return "#C1FFD7"

        '        Case "CARMEA"
        '            Return "#FDE2E4"

        '        Case "CARSIS"
        '            Return "#A0E7E5"

        '        Case "CARSON"
        '            Return "#FBE7C6"

        '        Case "CARDER"
        '            Return "#E6E6FA"

        '        Case "CARADM"
        '            Return "#D8F3DC"

        '        Case "CARAYE"
        '            Return "#FFD6A5"

        '        Case "CARCAD"
        '            Return "#B9FBC0"

        '        Case "CARCCP"
        '            Return "#E0BBE4"

        '        Case "CARCIC"
        '            Return "#CDEAC0"

        '        Case "CARCPU"
        '            Return "#B5EAEA"

        '        Case "CARCSO"
        '            Return "#FAD2E1"

        '        Case "CARECO"
        '            Return "#F1C0E8"

        '        Case "CARVEA"
        '            Return "#D0E6A5"

        '        Case "CARVET"
        '            Return "#FFCBCB"

        '        Case "CARADT"
        '            Return "#C3FBD8"

        '        Case "CARCET"
        '            Return "#FEE1E8"

        '        Case "CARCPT"
        '            Return "#E4F9F5"

        '        Case "CARCST"
        '            Return "#F6D6AD"

        '        Case "CARDET"
        '            Return "#E2ECE9"

        '        Case "CARECT"
        '            Return "#E3F6F5"

        '        Case "CARICT"
        '            Return "#F7D6E0"

        '        Case "CARIST"
        '            Return "#D4F1F4"

        '        Case "CARPDT"
        '            Return "#FCE1E4"

        '        Case "CARCNE"
        '            Return "#C9E4CA"

        '        Case Else
        '            Return "#E0E0E0"

        '    End Select

    End Function
End Class
