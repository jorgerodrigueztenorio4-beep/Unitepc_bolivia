<%--<%@ Page Language="VB" AutoEventWireup="false" CodeFile="sesion.aspx.vb" Inherits="sesion" %>

<!doctype html>
<script runat="server">


</script>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

    <title>Unitepc Sesion</title>
    <style type="text/css">

        html,
        body {
            height: 100%;
               }
        .image-fondo {
    /*background-image: url("dist/img/fondo.jpg");*/
      background-size: cover;
  /*background-size: 25rem;
  background-repeat: no-repeat;
  background-position: center center;
  background-attachment: fixed;*/
            }
.cabecera{
  color: #fff;
  height: 200px;
  line-height: 200px;
  text-align: center;
  vertical-align: middle;
  text-shadow: #111 0px 0px 10px;
}

.global-container {
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f5f5f5;
}

form {
	padding-top: 10px;
	font-size: 14px;
	margin-top: 30px;
}

.card-title {
	font-weight: 300;
}

.btn {
	font-size: 14px;
	margin-top: 20px;
}

.login-form {
	width: 330px;
	margin: 20px;
    background-color: #fbf7f7e8;
}

.sign-up {
	text-align: center;
	padding: 20px 0 0;
}

.alert {
	margin-bottom: -30px;
	font-size: 13px;
	margin-top: 20px;
}

    </style>
  </head>
  <body >
    <div class="global-container image-fondo">
	<div class="card login-form">
		<div class="card-body">
			<h3 class="card-title text-center fw-bold">Iniciar Sesion</h3>
            <h6 class="card-title text-center fw-bold">UNITEPC SISEDIS</h6>
             <div class="text-center">
  <img src="../dist/img/uni.jpg" class="rounded border border-warning" alt="" width="260">
</div>
			<div class="card-text">
				<!--
			<div class="alert alert-danger alert-dismissible fade show" role="alert">Incorrect username or password.</div> -->
				<form runat="server">
					<!-- to error: add class "has-danger" -->
					<div class="form-group">
						<label for="exampleInputEmail1">Usuario</label>
                        <asp:TextBox ID="txt_usuario" placeholder="Ingrese Su Usuario" required CssClass="form-control form-control-sm mt-3" runat="server"></asp:TextBox>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Contraseña</label>
						<a href="#" style="float:right;font-size:12px;"></a>
                        <asp:TextBox ID="txt_contraseña" placeholder="Ingrese Su Contraseña" required runat="server" CssClass="form-control form-control-sm mt-3" TextMode="Password"></asp:TextBox>
					</div>
                    <asp:Button ID="Button1" runat="server" Text="Iniciar Sesion" CssClass="form-control btn btn-primary btn-block"  />
                   
				
				    <asp:Label ID="Label1" runat="server" Text="El usuario o la contraseña no es correcto" ForeColor="Red" Font-Italic="True" Font-Size="10pt" Font-Underline="True" Visible="False"></asp:Label>

				<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_sesion" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
            <Columns>
                <asp:BoundField DataField="ci_usuario" HeaderText="ci_usuario" SortExpression="ci_usuario" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" ReadOnly="True" SortExpression="nombre" />
                <asp:BoundField DataField="nombre_usuario" HeaderText="nombre_usuario" SortExpression="nombre_usuario" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                <asp:BoundField DataField="rol" HeaderText="rol" SortExpression="rol" />
                <asp:BoundField DataField="sigla_carrera" HeaderText="sigla_carrera" SortExpression="sigla_carrera" />
                <asp:BoundField DataField="nombre_carrera" HeaderText="nombre_carrera" SortExpression="nombre_carrera" />
                <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
                <asp:BoundField DataField="rol1" HeaderText="rol1" SortExpression="rol1" />
                <asp:BoundField DataField="NombreSede" HeaderText="NombreSede" SortExpression="NombreSede" />
            </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
                    
                    <asp:SqlDataSource ID="sql_ds_sesion" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select ci_usuario ,(tp.nombres+' '+tp.primerApellido + ' '+tp.segundoApellido ) as nombre,nombre_usuario ,tu.password ,tu.rol ,sigla_carrera ,nombre_carrera  , sede ,tr.rol ,s.NombreSede 
 from tb_usuarios tu
inner join tb_personal tp on  tu.ci_usuario = tp.ci 
inner join tb_roles tr on tu.rol = tr.id_rol 
join tb_sedes s on tu.sede = s.idSede  
where nombre_usuario=@usuario and password=@contra">
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_usuario" Name="usuario" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_contraseña" Name="contra" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
				    <asp:TextBox ID="txt_rol" runat="server" Visible="False"></asp:TextBox>
				</form>
			</div>
		</div>
	</div>
        
        
</div>
  </body>
</html>
--%>
<%@ Page Language="VB" AutoEventWireup="false" CodeFile="sesion.aspx.vb" Inherits="sesion" %>

<!doctype html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap 5.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- FontAwesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />

    <title>UNITEPC | Inicio de Sesión</title>

    <style>
        body {
            background: linear-gradient(135deg, #002147, #0d6efd);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Segoe UI', sans-serif;
        }

        .login-card {
            width: 400px;
            border: none;
            border-radius: 14px;
            box-shadow: 0px 20px 40px rgba(0,0,0,0.25);
        }

        .login-header {
            text-align: center;
            padding: 30px 20px 10px;
        }

        .login-header img {
            width: 110px;
        }

        .login-title {
            font-weight: 600;
            color: #002147;
            margin-top: 10px;
        }

        .login-subtitle {
            font-size: 14px;
            color: #6c757d;
        }

        .login-body {
            padding: 30px;
        }

        .form-control {
            height: 45px;
            border-radius: 10px;
        }

        .btn-login {
            height: 45px;
            border-radius: 10px;
            font-weight: 600;
        }

        .footer-text {
            font-size: 12px;
            text-align: center;
            margin-top: 20px;
            color: #6c757d;
        }

        /* Ocultar GridView visualmente */
        .hidden-grid {
            display: none;
        }
    </style>
</head>

<body>

<form runat="server">

    <div class="card login-card">

        <div class="login-header">
            <img src="../dist/img/uni.jpg" alt="UNITEPC">
            <div class="login-title">Sistema RRHH</div>
            <div class="login-subtitle">Acceso Institucional</div>
        </div>

        <div class="login-body">

            <!-- Usuario -->
            <div class="mb-3">
                <label class="form-label fw-semibold">Usuario</label>
                <div class="input-group">
                    <span class="input-group-text bg-light">
                        <i class="fa fa-user text-primary"></i>
                    </span>
                    <asp:TextBox ID="txt_usuario"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Ingrese su usuario"
                        required>
                    </asp:TextBox>
                </div>
            </div>

            <!-- Contraseña -->
            <div class="mb-3">
                <label class="form-label fw-semibold">Contraseña</label>
                <div class="input-group">
                    <span class="input-group-text bg-light">
                        <i class="fa fa-lock text-primary"></i>
                    </span>
                    <asp:TextBox ID="txt_contraseña"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password"
                        placeholder="Ingrese su contraseña"
                        required>
                    </asp:TextBox>
                </div>
            </div>

            <!-- Botón -->
            <div class="d-grid">
                <asp:Button ID="Button1"
                    runat="server"
                    Text="Iniciar Sesión"
                    CssClass="btn btn-primary btn-login" />
            </div>

            <!-- Mensaje Error -->
            <asp:Label ID="Label1"
                runat="server"
                CssClass="text-danger text-center d-block mt-3 fw-semibold"
                Visible="False">
                Usuario o contraseña incorrectos
            </asp:Label>

            <div class="footer-text">
                © <%: DateTime.Now.Year %> UNITEPC
            </div>

        </div>
    </div>

    <!-- ================= COMPONENTES ORIGINALES (OCULTOS) ================= -->

    <div class="hidden-grid">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="sql_ds_sesion">
            <Columns>
                <asp:BoundField DataField="ci_usuario" />
                <asp:BoundField DataField="nombre" />
                <asp:BoundField DataField="nombre_usuario" />
                <asp:BoundField DataField="password" />
                <asp:BoundField DataField="rol" />
                <asp:BoundField DataField="sigla_carrera" />
                <asp:BoundField DataField="nombre_carrera" />
                <asp:BoundField DataField="sede" />
                <asp:BoundField DataField="rol1" />
                <asp:BoundField DataField="NombreSede" />
            </Columns>
        </asp:GridView>
    </div>
    <asp:TextBox ID="txt_rol" runat="server" Visible="false"></asp:TextBox>
    <asp:SqlDataSource ID="sql_ds_sesion" runat="server"
        ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>"
        SelectCommand="select ci_usuario ,(tp.nombres+' '+tp.primerApellido + ' '+tp.segundoApellido ) as nombre,nombre_usuario ,tu.password ,tu.rol ,sigla_carrera ,nombre_carrera  , sede ,tr.rol ,s.NombreSede 
        from tb_usuarios tu
        inner join tb_personal tp on  tu.ci_usuario = tp.ci 
        inner join tb_roles tr on tu.rol = tr.id_rol 
        join tb_sedes s on tu.sede = s.idSede  
        where nombre_usuario=@usuario and password=@contra">
        <SelectParameters>
            <asp:ControlParameter ControlID="txt_usuario" Name="usuario" PropertyName="Text" />
            <asp:ControlParameter ControlID="txt_contraseña" Name="contra" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>

</form>

</body>
</html>