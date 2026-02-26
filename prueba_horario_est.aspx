<%@ Page Language="VB" AutoEventWireup="false" CodeFile="prueba_horario_est.aspx.vb" Inherits="prueba_horario_est" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txt_carrera" placeholder="Carrera" runat="server"></asp:TextBox>
            <asp:TextBox ID="txt_cod_est" placeholder ="Cod est" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Button" />
            <asp:Button ID="Button2" runat="server" Text="buscar" />
            <asp:GridView ID="gv_res" runat="server" Font-Names="Consolas" AllowSorting="True">
                <HeaderStyle BackColor="#009900" Font-Names="Consolas" />
            </asp:GridView>
            <asp:GridView ID="gv_est" runat="server">
            </asp:GridView>
            <asp:TextBox ID="txt_oferta" runat="server" Width="1703px"></asp:TextBox>
            <asp:TextBox ID="txt_horario" runat="server" Width="1703px"></asp:TextBox>

            <br />

            <asp:TextBox ID="txt_armado" runat="server" Width="1766px"></asp:TextBox>
            <asp:GridView ID="gv_horario" runat="server" DataSourceID="Sql_ds_horario" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                    <asp:BoundField DataField="horai" HeaderText="horai" SortExpression="horai" ReadOnly="True" />
                    <asp:BoundField DataField="horaf" HeaderText="horaf" SortExpression="horaf" ReadOnly="True" />
                    <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                    <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                    <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                    <asp:BoundField DataField="nom_aula_lab" HeaderText="nom_aula_lab" SortExpression="nom_aula_lab" />
                    <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                    <asp:BoundField DataField="Docente" HeaderText="Docente" ReadOnly="True" SortExpression="Docente" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select h.dia ,replace(h.hora_inicio,':00.0000000','')horai ,replace(h.hora_fin,':00.0000000','')horaf ,p.Materia ,p.SiglaP ,grupo,a.nom_aula_lab,h.tipo_clase ,(pe.nombres +' '+pe.primerApellido +' '+pe.segundoApellido ) as Docente   from tb_horario h
join tb_designacion d on d.id_horario = h.id_horario 
join planes_estudios p on d.id_materia = p.id_plan 
join tb_aula a on h.aula = a.id_nomal 
join tb_personal pe on h.ci_doc =pe.ci 
where h.gestion ='1-2024' and d.carrera =@car and a.gestion ='1-2024' and pe.gestion ='1-2024' and h.sede='1'">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txt_carrera" Name="car" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
