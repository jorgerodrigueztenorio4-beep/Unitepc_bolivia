<%@ Page Language="C#" AutoEventWireup="true" CodeFile="actualizar datos.aspx.cs" Inherits="actualizar_datos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
            <asp:TextBox ID="txt_ci" runat="server"></asp:TextBox>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="9pt">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                    <asp:BoundField DataField="primerApellido" HeaderText="primerApellido" SortExpression="primerApellido" />
                    <asp:BoundField DataField="segundoApellido" HeaderText="segundoApellido" SortExpression="segundoApellido" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" />
                    <asp:BoundField DataField="extension" HeaderText="extension" SortExpression="extension" />
                    <asp:BoundField DataField="fechaNacimiento" HeaderText="fechaNacimiento" SortExpression="fechaNacimiento" />
                    <asp:BoundField DataField="estadoCivil" HeaderText="estadoCivil" SortExpression="estadoCivil" />
                    <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" />
                    <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                    <asp:BoundField DataField="celular" HeaderText="celular" SortExpression="celular" />
                    <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero" />
                    <asp:BoundField DataField="nacionalidad" HeaderText="nacionalidad" SortExpression="nacionalidad" />
                    <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" />
                    <asp:BoundField DataField="fecha_actualizacion" HeaderText="fecha_actualizacion" SortExpression="fecha_actualizacion" />
                    <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_personal] WHERE ([gestion] = '2-2022')" UpdateCommand="update tb_personal
set nacionalidad =(select nacionalidad  from tb_personal where gestion ='1-2022' and ci=@ci)
where ci=@ci and nacionalidad is null and gestion ='2-2022'">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
