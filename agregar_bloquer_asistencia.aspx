<%@ Page Language="VB" AutoEventWireup="false" CodeFile="agregar_bloquer_asistencia.aspx.vb" Inherits="agregar_bloquer_asistencia" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Button" />
            <asp:TextBox ID="txt_bloque" runat="server"></asp:TextBox>
            <asp:TextBox ID="txt_idhorario" runat="server"></asp:TextBox>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario">
                <Columns>
                    <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                    <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario,th.bloque 
from tb_designacion td
join tb_horario th on td.id_horario = th.id_horario 
join tb_aula ta on th.aula = ta.id_nomal
join tb_personal tp on th.ci_doc = tp.ci 
join planes_estudios p on td.id_materia = p.id_plan
join tb_carreras tc on p.codcar = tc.CARSIGLA
where  th.dia ='viernes'
  and th.gestion ='1-2024'  and td.horas &lt;&gt;'0'    and tp.gestion ='1-2024'  and ta.gestion ='1-2024' order by th.id_horario "></asp:SqlDataSource>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario_asisencia">
                <Columns>
                    <asp:BoundField DataField="id_horario" HeaderText="id_horario" SortExpression="id_horario" />
                    <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sql_ds_horario_asisencia" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="
  select id_horario ,bloque  from tb_ing_sal 
  where CONVERT(varchar,hora_registro ,103)=CONVERT(varchar,getdate(),103) order by id_horario" UpdateCommand="UPDATE tb_ing_sal SET bloque = @bloque WHERE (id_horario = @idhorario)">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txt_bloque" Name="bloque" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_idhorario" Name="idhorario" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
