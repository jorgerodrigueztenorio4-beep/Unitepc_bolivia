<%@ Page Language="VB" AutoEventWireup="false" CodeFile="controlSubidaHorarios.aspx.vb" Inherits="controlSubidaHorarios" MasterPageFile="~/mp_activos.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
    <div>
        <asp:DropDownList ID="ddl_sede" runat="server" AutoPostBack="True" DataSourceID="sqlDsSede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
        <asp:SqlDataSource ID="sqlDsSede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes] WHERE ([id_rrhh] IS NOT NULL) ORDER BY [NombreSede]"></asp:SqlDataSource>
        <asp:DropDownList ID="ddl_carrera" runat="server" AutoPostBack="True" DataSourceID="sqlDsCarrera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>
        <asp:SqlDataSource ID="sqlDsCarrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] ORDER BY [CARDES]"></asp:SqlDataSource>
        <asp:DropDownList ID="ddl_semestre" runat="server" AutoPostBack="True">
            <asp:ListItem Value="0">Semestre</asp:ListItem>
            <asp:ListItem Value ="1">1</asp:ListItem>
            <asp:ListItem Value="2"></asp:ListItem>
            <asp:ListItem Value="3"></asp:ListItem>
            <asp:ListItem Value="4"></asp:ListItem>
            <asp:ListItem Value="5"></asp:ListItem>
            <asp:ListItem Value="6"></asp:ListItem>
            <asp:ListItem Value="7"></asp:ListItem>
            <asp:ListItem Value="8"></asp:ListItem>
            <asp:ListItem Value="9"></asp:ListItem>
            <asp:ListItem Value="10"></asp:ListItem>
            <asp:ListItem Value="11"></asp:ListItem>
        </asp:DropDownList>
    </div>
        <div>
            <asp:GridView ID="gv_horarioscontrol" runat="server" AutoGenerateColumns="False" DataSourceID="sqlhorarioControl" Font-Names="Consolas" Font-Size="9pt">
                <Columns>
                    <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" />
                    <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                    <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                    <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                    <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                    <asp:BoundField DataField="clase_teorica" HeaderText="clase_teorica" SortExpression="clase_teorica" />
                    <asp:BoundField DataField="cant_proyec" HeaderText="cant_proyec" SortExpression="cant_proyec" />
                    <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlhorarioControl" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT p.Semestre,p.Materia  ,p.SiglaP ,h.grupo ,h.tipo_clase ,h.clase_teorica,d.cant_proyec, replace((pe.nombres+' '+pe.primerApellido +' '+pe.segundoApellido ),'a a a','Docente por Asignar')as docente    FROM tb_horario H
JOIN tb_designacion D ON D.id_horario =H.id_horario
JOIN planes_estudios P on d.id_materia = p.id_plan 
join tb_personal pe on h.ci_doc = pe.ci 
 where h.gestion ='1-2026'
and p.codcar =@carrera
and h.sede =@sede
and pe.gestion ='1-2026'
and p.Semestre=@semestre
group by p.Materia  ,p.SiglaP ,h.grupo ,h.tipo_clase,h.clase_teorica ,p.Semestre,d.cant_proyec ,pe.nombres,pe.primerApellido ,pe.segundoApellido
order by p.SiglaP ,h.grupo ">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddl_semestre" Name="semestre" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>


