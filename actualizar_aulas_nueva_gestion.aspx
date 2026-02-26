<%@ Page Language="VB" AutoEventWireup="false" CodeFile="actualizar_aulas_nueva_gestion.aspx.vb" Inherits="actualizar_aulas_nueva_gestion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Button" />
            <asp:GridView ID="gv_aulas" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_aulas">
                <Columns>
                    <asp:BoundField DataField="id_nomal" HeaderText="id_nomal" InsertVisible="False" ReadOnly="True" SortExpression="id_nomal" />
                    <asp:BoundField DataField="nom_aula_lab" HeaderText="nom_aula_lab" SortExpression="nom_aula_lab" />
                    <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
                    <asp:BoundField DataField="capacidad" HeaderText="capacidad" SortExpression="capacidad" />
                    <asp:BoundField DataField="dimenciones" HeaderText="dimenciones" SortExpression="dimenciones" />
                    <asp:BoundField DataField="Sede" HeaderText="Sede" SortExpression="Sede" />
                    <asp:BoundField DataField="ultima_actualizacion" HeaderText="ultima_actualizacion" SortExpression="ultima_actualizacion" />
                    <asp:BoundField DataField="foto" HeaderText="foto" SortExpression="foto" />
                    <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                    <asp:BoundField DataField="tipo_ambiente" HeaderText="tipo_ambiente" SortExpression="tipo_ambiente" />
                    <asp:BoundField DataField="ubicacion_piso" HeaderText="ubicacion_piso" SortExpression="ubicacion_piso" />
                    <asp:BoundField DataField="capacidad_bs" HeaderText="capacidad_bs" SortExpression="capacidad_bs" />
                    <asp:BoundField DataField="estado_aula" HeaderText="estado_aula" SortExpression="estado_aula" />
                    <asp:BoundField DataField="nro_pupitres" HeaderText="nro_pupitres" SortExpression="nro_pupitres" />
                    <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sql_ds_aulas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select * from tb_aula 
where gestion ='1-2024'
order by Sede" InsertCommand="INSERT INTO tb_aula(nom_aula_lab, bloque, capacidad, dimenciones, Sede, gestion, tipo_ambiente, ubicacion_piso, capacidad_bs, estado_aula, nro_pupitres) VALUES (@nomaula, @bloque, @capacidad, @dimensiones, @sede, @gestion, @tipo_ambiente, @ubicacion, @capacidadbs, @estadoaula, @nropupitres)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="nomaula" Name="nomaula" PropertyName="Text" />
                    <asp:ControlParameter ControlID="bloque" Name="bloque" PropertyName="Text" />
                    <asp:ControlParameter ControlID="capacidad" Name="capacidad" PropertyName="Text" />
                    <asp:ControlParameter ControlID="dimensiones" Name="dimensiones" PropertyName="Text" />
                    <asp:ControlParameter ControlID="sede" Name="sede" PropertyName="Text" />
                    <asp:ControlParameter ControlID="gestion" Name="gestion" PropertyName="Text" />
                    <asp:ControlParameter ControlID="tipoambiente" Name="tipo_ambiente" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ubicacion" Name="ubicacion" PropertyName="Text" />
                    <asp:ControlParameter ControlID="capacidadbs" Name="capacidadbs" PropertyName="Text" />
                    <asp:ControlParameter ControlID="estadoaula" Name="estadoaula" PropertyName="Text" />
                    <asp:ControlParameter ControlID="nropupitres" Name="nropupitres" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="nomaula" runat="server"></asp:TextBox>
            <asp:TextBox ID="bloque" runat="server"></asp:TextBox>
            <asp:TextBox ID="capacidad" runat="server"></asp:TextBox>
            <asp:TextBox ID="dimensiones" runat="server"></asp:TextBox>
            <asp:TextBox ID="sede" runat="server"></asp:TextBox>
            <asp:TextBox ID="gestion" runat="server">1-2024</asp:TextBox>
            <asp:TextBox ID="tipoambiente" runat="server"></asp:TextBox>
            <asp:TextBox ID="ubicacion" runat="server"></asp:TextBox>
            <asp:TextBox ID="capacidadbs" runat="server"></asp:TextBox>
            <asp:TextBox ID="estadoaula" runat="server"></asp:TextBox>
            <asp:TextBox ID="nropupitres" runat="server"></asp:TextBox>

        </div>
        
    </form>
</body>
</html>
