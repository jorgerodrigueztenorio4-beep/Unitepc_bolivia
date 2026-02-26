<%@ Page Language="VB" AutoEventWireup="false" CodeFile="proyecciones_DAF.aspx.vb" Inherits="proyecciones_DAF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddl_carrera" runat="server" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
            <asp:DropDownList ID="ddl_sede" runat="server" DataSourceID="sql_ds_sedes" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="sql_ds_sedes" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
            <asp:DropDownList ID="ddl_gestion" runat="server" AutoPostBack="True">
                <asp:ListItem>Seleccione gestion</asp:ListItem>
                <asp:ListItem>2-2024</asp:ListItem>
                <asp:ListItem>1-2024</asp:ListItem>
                <asp:ListItem>2-2023</asp:ListItem>
                <asp:ListItem>1-2023</asp:ListItem>
                <asp:ListItem>2-2022</asp:ListItem>
                <asp:ListItem>1-2022</asp:ListItem>
                <asp:ListItem>2-2021</asp:ListItem>
                <asp:ListItem>1-2021</asp:ListItem>

            </asp:DropDownList>

            <br />
            <asp:GridView ID="gb_carga" runat="server" AutoGenerateColumns="False" DataSourceID="sql_carga" Font-Names="Consolas" Font-Size="9pt">
                <Columns>
                    <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                    <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                    <asp:BoundField DataField="tema_avance" HeaderText="tema_avance" SortExpression="tema_avance" />
                    <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                    <asp:BoundField DataField="cant_est" HeaderText="cant_est" SortExpression="cant_est" />
                    <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso" />
                    <asp:BoundField DataField="hr_salida" HeaderText="hr_salida" SortExpression="hr_salida" />
                    <asp:BoundField DataField="Horas_ejecutas" HeaderText="Horas_ejecutas" ReadOnly="True" SortExpression="Horas_ejecutas" />
                    <asp:BoundField DataField="Hras_programadas" HeaderText="Hras_programadas" ReadOnly="True" SortExpression="Hras_programadas" />
                    <asp:BoundField DataField="hra_inicio" HeaderText="hra_inicio" SortExpression="hra_inicio" />
                    <asp:BoundField DataField="hra_fin" HeaderText="hra_fin" SortExpression="hra_fin" />
                    <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sql_carga" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="  SELECT 
    ti.ci_doc,
    ti.Materia,
    ti.tema_avance,
    ti.carrera,
    cant_est,
    hr_ingreso,
    hr_salida,
    CONVERT(INTEGER, ROUND((((CONVERT(DECIMAL, DATEDIFF(SS, TI.hr_ingreso, TI.hr_salida)) / 60) / 45)), 0)) AS Horas_ejecutas,
    ISNULL(DATEDIFF(SS, ti.hra_inicio, ti.hra_fin) / 60 / 45, '0') AS Hras_programadas,
    ti.hra_inicio,
    ti.hra_fin,
    ti.observaciones
  FROM tb_ing_sal ti
  WHERE TI.carrera =@carrera   AND ti.sede = @sede and ti.gestion =@gestion ORDER BY  TI.hr_ingreso ;">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddl_gestion" Name="gestion" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        
    </form>
</body>
</html>
