<%@ Page Language="VB" AutoEventWireup="false" CodeFile="planes_estudio_grabar.aspx.vb" Inherits="planes_estudio_grabar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="ddl_sede" runat="server" DataSourceID="sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
        <asp:SqlDataSource ID="sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
        <asp:DropDownList ID="ddl_carrera" runat="server" DataSourceID="carrera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>
        <asp:SqlDataSource ID="carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
        <asp:DropDownList ID="ddl_plan" runat="server" AutoPostBack="True">
            <asp:ListItem>slect</asp:ListItem>
            <asp:ListItem Value="N">Nuevo</asp:ListItem>
            <asp:ListItem Value="A">Antiguo</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="agregar a nueva sede" />
        <asp:GridView ID="gv_planes" runat="server" AutoGenerateColumns="False" DataKeyNames="id_plan" DataSourceID="sql_ds_planes">
            <Columns>
                <asp:BoundField DataField="id_plan" HeaderText="id_plan" InsertVisible="False" ReadOnly="True" SortExpression="id_plan" />
                <asp:BoundField DataField="codcar" HeaderText="codcar" SortExpression="codcar" />
                <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" />
                <asp:BoundField DataField="Hrs_teoricas" HeaderText="Hrs_teoricas" SortExpression="Hrs_teoricas" />
                <asp:BoundField DataField="Hrs_practicas" HeaderText="Hrs_practicas" SortExpression="Hrs_practicas" />
                <asp:BoundField DataField="Hrs_Total" HeaderText="Hrs_Total" SortExpression="Hrs_Total" />
                <asp:BoundField DataField="Creditos" HeaderText="Creditos" SortExpression="Creditos" />
                <asp:BoundField DataField="Sede_id" HeaderText="Sede_id" SortExpression="Sede_id" />
                <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sql_ds_planes" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_plan, codcar, SiglaP, Materia, Semestre, Hrs_teoricas, Hrs_practicas, Hrs_Total, Creditos, Sede_id, Sis_plan 
FROM planes_estudios 
WHERE (Sede_id = '1') AND (codcar = 'carvet') AND (Sis_plan = 'N') and Semestre ='4' and SiglaP like '%'+'VYZ-e'+'%'" InsertCommand="INSERT INTO planes_estudios(codcar, SiglaP, Materia, Semestre, Hrs_teoricas, Hrs_practicas, Hrs_Total, Creditos, Sede_id, Sis_plan) VALUES (@codcar, @siglap, @materia, @semestre, @hteo, @hprac, @hrstotal, @creditos, @sede, @plan )">
            <InsertParameters>
                <asp:ControlParameter ControlID="txt_cod_car" Name="codcar" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_sigla_p" Name="siglap" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_materia" Name="materia" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_semestre" Name="semestre" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_horasteo" Name="hteo" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_hrsprac" Name="hprac" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_hrastotal" Name="hrstotal" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_creditos" Name="creditos" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_sisplan" Name="plan" PropertyName="Text" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddl_sede" DefaultValue="1" Name="Sede_id" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="ddl_carrera" DefaultValue="carmed" Name="codcar" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddl_carrera" DefaultValue="n" Name="Sis_plan" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="txt_cod_car" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_sigla_p" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_materia" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_semestre" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_horasteo" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_hrsprac" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_hrastotal" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_creditos" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_sede" runat="server">5</asp:TextBox>
        <asp:TextBox ID="txt_sisplan" runat="server"></asp:TextBox>
    </div>
    </form>
</body>
</html>
