<%@ Page Language="VB" AutoEventWireup="false" CodeFile="fechas_nuevoformato.aspx.vb" Inherits="fechas_nuevoformato" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Actualizar" />
            <asp:TextBox ID="txt_fecha_ini" runat="server"></asp:TextBox>
            <asp:TextBox ID="txt_fechafin" runat="server"></asp:TextBox>
            <asp:TextBox ID="txt_id_ing" runat="server"></asp:TextBox>
            <asp:TextBox ID="txt_fechareg" runat="server"></asp:TextBox>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sql_fechas">
                <Columns>
                    <asp:BoundField DataField="id_ing_sal" HeaderText="id_ing_sal" InsertVisible="False" ReadOnly="True" SortExpression="id_ing_sal" />
                    <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                    <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso" />
                    <asp:BoundField DataField="hora" HeaderText="hora" SortExpression="hora" ReadOnly="True" />
                    <asp:BoundField DataField="hr_salida" HeaderText="hr_salida" SortExpression="hr_salida" />
                    <asp:BoundField DataField="registro" HeaderText="registro" SortExpression="registro" ReadOnly="True" />
                    <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" />
                    <asp:BoundField DataField="Column1" HeaderText="Column1" SortExpression="Column1" ReadOnly="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sql_fechas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select id_ing_sal ,ci_doc ,hr_ingreso ,CONVERT(VARCHAR(8), hr_ingreso, 108) as hora,hr_salida ,CAST(hora_registro  AS DATE) as registro,observaciones,convert(varchar(30), CAST(hora_registro  AS DATE),103)+' '+CONVERT(VARCHAR(8), hr_ingreso, 108)
from tb_ing_sal 
where CAST(hr_ingreso AS DATE) &lt;&gt;CAST(hora_registro  AS DATE) and gestion ='2-2024' and observaciones ='No se Marco la Salida'" UpdateCommand="UPDATE tb_ing_sal SET hr_ingreso = @hraingres, hr_salida = @hrasalida WHERE (id_ing_sal = @idingsal)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="2-2024" Name="gestion" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txt_fechareg" Name="hraingres" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="txt_fechareg" Name="hrasalida" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="txt_id_ing" Name="idingsal" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
