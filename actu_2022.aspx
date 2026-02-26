<%@ Page Language="VB" AutoEventWireup="false" CodeFile="actu_2022.aspx.vb" Inherits="actu_2022" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="dist/css/adminlte.css" rel="stylesheet" />
    <link href="dist/css/adminlte.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button1" runat="server" Text="actualizar" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <asp:GridView ID="GridView1" CssClass ="table-hover " runat="server" AutoGenerateColumns="False" DataKeyNames="id_ing_sal" DataSourceID="sql_ds_horas" Font-Names="Consolas" Font-Size="9pt">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="id_ing_sal" HeaderText="id_ing_sal" ReadOnly="True" SortExpression="id_ing_sal" InsertVisible="False" />
            <asp:BoundField DataField="fechaingreso" HeaderText="fechaingreso" ReadOnly="True" SortExpression="fechaingreso" />
            <asp:BoundField DataField="fecha_real" HeaderText="fecha_real" SortExpression="fecha_real" ReadOnly="True" />
            <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" />
            <asp:BoundField DataField="DOCENTE" HeaderText="DOCENTE" SortExpression="DOCENTE" ReadOnly="True" />
            <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
            <asp:BoundField DataField="revisar" HeaderText="revisar" ReadOnly="True" SortExpression="revisar" />
        </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sql_ds_horas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" DeleteCommand="DELETE FROM tb_ing_sal WHERE (id_ing_sal = @id_ing_sal)" SelectCommand="select i.id_ing_sal  ,(CONVERT (varchar(30),i.hr_ingreso  ,103)) as fechaingreso, (CONVERT (varchar(30),i.hora_registro ,103)) as fecha_real ,i.observaciones,(p.nombres+ ' '+p.primerApellido +' '+P.segundoApellido ) AS DOCENTE,I.carrera  ,iif((CONVERT (varchar(30),i.hr_ingreso  ,103))&lt;&gt; (CONVERT (varchar(30),i.hora_registro ,103)),'Distinto','') as revisar
from tb_ing_sal i
join tb_personal p on i.ci_doc = p.ci 
where carrera ='carmed' and sede ='1' and i.gestion ='2-2024' and p.gestion ='2-2024' 
order by hora_registro">
            <DeleteParameters>
                <asp:Parameter Name="id_ing_sal" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
