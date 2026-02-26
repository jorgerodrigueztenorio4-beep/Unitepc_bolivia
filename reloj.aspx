<%@ Page Language="VB" AutoEventWireup="false" CodeFile="reloj.aspx.vb" Inherits="reloj" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"> 
    <Triggers>
        <asp:AsyncPostBackTrigger  ControlID="Timer1" EventName="Tick" />
    </Triggers>
    <ContentTemplate> 
       <asp:GridView runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_reloh" ID="gvreloj">
     <Columns>
         <asp:BoundField DataField="Fecha" HeaderText="Fecha" ReadOnly="True" SortExpression="Fecha" />
         <asp:BoundField DataField="Hora" HeaderText="Hora" ReadOnly="True" SortExpression="Hora" />
     </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sql_ds_reloh" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT CONVERT (char(10), getdate(), 103) as Fecha,convert(char(8), GETDATE(), 108)as Hora "></asp:SqlDataSource>
    
    </ContentTemplate> 
</asp:UpdatePanel> 
            <asp:Timer ID="Timer1" runat="server" Interval="500"></asp:Timer>


        </div>
    </form>
</body>
</html>
