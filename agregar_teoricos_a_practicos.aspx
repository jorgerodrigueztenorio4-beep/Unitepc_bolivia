<%@ Page Language="VB" AutoEventWireup="false" CodeFile="agregar_teoricos_a_practicos.aspx.vb" Inherits="agregar_teoricos_a_practicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td>Proyeciones<asp:Button ID="Button1" runat="server" Text="Button" /><asp:TextBox ID="txt_gteo" runat="server"></asp:TextBox> <asp:TextBox ID="txt_id_horario" runat="server"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sql_sedes" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:TextBox ID="txt_carrera" placeholder="Carrrera" runat="server"></asp:TextBox>
                        <asp:SqlDataSource ID="sql_sedes" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                    </td>
                    <td>horarios</td>
                    
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_proyecion_moodle">
                            <Columns>
                                <asp:BoundField DataField="id_gm" HeaderText="id_gm" InsertVisible="False" ReadOnly="True" SortExpression="id_gm" />
                                <asp:BoundField DataField="materia" HeaderText="materia" SortExpression="materia" />
                                <asp:BoundField DataField="grupo_teorico" HeaderText="grupo_teorico" ReadOnly="True" SortExpression="grupo_teorico" />
                                <asp:BoundField DataField="grupo_practico" HeaderText="grupo_practico" ReadOnly="True" SortExpression="grupo_practico" />
                                <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
                                <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="sql_ds_proyecion_moodle" runat="server" ConnectionString="<%$ ConnectionStrings:moodleConnectionString %>" SelectCommand="SELECT
    t.id_gm,
    t.materia,

    -- NÚMERO COMÚN (grupo teórico)
    LEFT(t.grupos, PATINDEX('%[^0-9]%', t.grupos + 'X') - 1) AS grupo_teorico,

    -- LETRA(S) DEL GRUPO PRÁCTICO (SIN EL NÚMERO)
    CASE
        WHEN t.grupos LIKE '%-%'
        THEN SUBSTRING(
                n.parte,
                PATINDEX('%[^0-9]%', n.parte + 'X'),
                LEN(n.parte)
             )
        ELSE SUBSTRING(
                t.grupos,
                PATINDEX('%[^0-9]%', t.grupos + 'X'),
                LEN(t.grupos)
             )
    END AS grupo_practico,

    t.sede,
    t.gestion
FROM tb_proyeciones t
OUTER APPLY
(
    SELECT
        nodo.value('.', 'varchar(20)') AS parte
    FROM
    (
        SELECT CAST(
            '&lt;i&gt;' +
            REPLACE(t.grupos, '-', '&lt;/i&gt;&lt;i&gt;') +
            '&lt;/i&gt;' AS XML
        ) AS xml_data
    ) d
    CROSS APPLY xml_data.nodes('/i') AS n(nodo)
) n
WHERE t.gestion = '1-2026'
and sede=@sede
and materia like'%'+@carrea+'%'
ORDER BY t.materia, t.sede,T.grupos 
">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="sede" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txt_carrera" Name="carrea" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td style="vertical-align: top;">
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="sql_clases">
                            <Columns>
                                <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
                                <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="sql_clases" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.sede ,th.tipo_clase  ,p.SiglaP,th.grupo ,th.gestion
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan
 join tb_aula a on th.aula = a.id_nomal  
where th.gestion ='1-2026' and tp.gestion ='1-2026'  and a.gestion ='1-2024'and th.tipo_clase='practico' and th.sede=@sede
and SiglaP like '%'+@carrera+'%'" UpdateCommand="UPDATE tb_horario SET clase_teorica = @clasteo WHERE (id_horario = @idhorario)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="sede" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="txt_carrera" Name="carrera" PropertyName="Text" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txt_gteo" Name="clasteo" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txt_id_horario" Name="idhorario" PropertyName="Text" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                   
                </tr>
               
            </table>
        </div>
    </form>
</body>
</html>
