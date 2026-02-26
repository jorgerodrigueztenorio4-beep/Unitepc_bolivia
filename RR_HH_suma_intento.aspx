<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_suma_intento.aspx.vb" Inherits="RR_HH_suma_intento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_contador">
                <Columns>
                    <asp:BoundField DataField="intentos" HeaderText="intentos" ReadOnly="True" SortExpression="intentos" />
                    <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                    <asp:BoundField DataField="primerApellido" HeaderText="primerApellido" SortExpression="primerApellido" />
                    <asp:BoundField DataField="segundoApellido" HeaderText="segundoApellido" SortExpression="segundoApellido" />
                    <asp:BoundField DataField="nro_ci" HeaderText="nro_ci" SortExpression="nro_ci" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sql_ds_contador" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select count (i.nro_ci ) as intentos ,p.nombres ,p.primerApellido ,p.segundoApellido ,i.nro_ci from tb_intento_marcado i 
join tb_personal p on i.nro_ci = p.ci 
where p.gestion ='2-2023'
group by p.nombres ,p.primerApellido ,p.segundoApellido,i.nro_ci 
order by intentos desc"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
