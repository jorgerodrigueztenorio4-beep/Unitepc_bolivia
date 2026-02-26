<%@ Page Language="VB" AutoEventWireup="false" CodeFile="controlProyecciones.aspx.vb" Inherits="controlProyecciones" MasterPageFile="~/mp_activos.master" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
    <div>
          <asp:DropDownList ID="ddl_sede" runat="server" AutoPostBack="True" DataSourceID="sqlDsSede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
        <asp:SqlDataSource ID="sqlDsSede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes] WHERE ([id_rrhh] IS NOT NULL) ORDER BY [NombreSede]"></asp:SqlDataSource>
        <asp:DropDownList ID="ddl_carrera" runat="server" AutoPostBack="True" DataSourceID="sqlDsCarrera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>
        <asp:SqlDataSource ID="sqlDsCarrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] ORDER BY [CARDES]"></asp:SqlDataSource>
        <asp:DropDownList ID="ddl_materia" runat="server" DataSourceID="sqlMateria" DataTextField="Materia" DataValueField="SiglaP" AutoPostBack="True"></asp:DropDownList>
          <asp:SqlDataSource ID="sqlMateria" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [planes_estudios] WHERE (([codcar] = @codcar) AND ([Sede_id] = @Sede_id))">
              <SelectParameters>
                  <asp:ControlParameter ControlID="ddl_carrera" Name="codcar" PropertyName="SelectedValue" Type="String" />
                  <asp:ControlParameter ControlID="ddl_sede" Name="Sede_id" PropertyName="SelectedValue" Type="Int32" />
              </SelectParameters>
          </asp:SqlDataSource>
    </div>
        <asp:GridView ID="gv_proyeccion" runat="server" AutoGenerateColumns="False" DataSourceID="sqlProyeccionmoodle" Width="220px" DataKeyNames="id_gm">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="id_gm" HeaderText="id_gm" InsertVisible="False" ReadOnly="True" SortExpression="id_gm" />
                <asp:BoundField DataField="materia" HeaderText="materia" SortExpression="materia" />
                <asp:BoundField DataField="grupos" HeaderText="grupos" SortExpression="grupos" />
                <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
                <asp:BoundField DataField="tipo_plan" HeaderText="tipo_plan" SortExpression="tipo_plan" />
                <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlProyeccionmoodle" runat="server" ConnectionString="<%$ ConnectionStrings:moodleConnectionString %>" SelectCommand="SELECT * FROM [tb_proyeciones] WHERE (([sede] = @sede) AND ([gestion] = @gestion) AND ([materia] LIKE '%' + @materia + '%'))" UpdateCommand="UPDATE tb_proyeciones SET grupos = @grupos WHERE (id_gm = @id_gm)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter DefaultValue="1-2026" Name="gestion" Type="String" />
                <asp:ControlParameter ControlID="ddl_materia" Name="materia" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="grupos" />
                <asp:Parameter Name="id_gm" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <div>
            <asp:GridView ID="gv_proyeccion_cantidad" runat="server" AutoGenerateColumns="False" DataSourceID="sqlProyeccionCantidad">
                <Columns>
                    <asp:BoundField DataField="id_Proyeccion" HeaderText="id_Proyeccion" InsertVisible="False" ReadOnly="True" SortExpression="id_Proyeccion" />
                    <asp:BoundField DataField="Sede" HeaderText="Sede" SortExpression="Sede" />
                    <asp:BoundField DataField="Carrera" HeaderText="Carrera" SortExpression="Carrera" />
                    <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" />
                    <asp:BoundField DataField="Sigla_mat" HeaderText="Sigla_mat" SortExpression="Sigla_mat" />
                    <asp:BoundField DataField="CantGrupoTeo" HeaderText="CantGrupoTeo" SortExpression="CantGrupoTeo" />
                    <asp:BoundField DataField="CantGrupoPrac" HeaderText="CantGrupoPrac" SortExpression="CantGrupoPrac" />
                    <asp:BoundField DataField="Gestion" HeaderText="Gestion" SortExpression="Gestion" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlProyeccionCantidad" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_Proyeccion] WHERE (([Carrera] = @Carrera) AND ([Sede] = @Sede) AND ([Gestion] = @Gestion)) ORDER BY [Semestre]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_carrera" Name="Carrera" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="ddl_sede" Name="Sede" PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter DefaultValue="1-2026" Name="Gestion" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>

