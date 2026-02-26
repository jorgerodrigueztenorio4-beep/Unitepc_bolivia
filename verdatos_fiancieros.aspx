<%@ Page Language="VB" AutoEventWireup="false" CodeFile="verdatos_fiancieros.aspx.vb" Inherits="verdatos_fiancieros" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Button" />
                      <asp:TextBox ID="txt_ci" runat="server"></asp:TextBox>
            <asp:GridView ID="gv_docente" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_docente">
                <Columns>
                    <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" />
                </Columns>
            </asp:GridView>
        
  
        
            <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT s.ci
  FROM tb_personal s
  WHERE NOT EXISTS (SELECT * FROM tb_datos_financieros a 
WHERE s.ci = a.ci ) and s.gestion ='2-2022'" InsertCommand="INSERT INTO tb_datos_financieros(ci, gestion) VALUES (@ci, '2-2022')">
                <InsertParameters>
                    <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
        
        </div>
    </form>
</body>
</html>
