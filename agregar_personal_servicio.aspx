<%@ Page Language="VB" AutoEventWireup="false" CodeFile="agregar_personal_servicio.aspx.vb" Inherits="agregar_personal_servicio" MasterPageFile="mp_actualizacion.master" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <form runat="server">
        <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
            <asp:Label ID="lbl_cargo" runat="server" Text=""></asp:Label>
        </div>
        <div class=" container-fluid ">
            <%--<div class="row">--%>

            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                <div style="background-color: #ffc107" class="text-md-center  rounded text-bold " role="alert">
                    Lista  de nuevos doc.
                </div>
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary " Text="Obtener Contratos" />
                <asp:Button ID="Button2" runat="server" Text="buscar DATOS" Visible="false" />
                <asp:Button ID="Button3" runat="server" CssClass="btn btn-success" Text="Asignar a Horarios" Visible="false" />



                <asp:GridView ID="gv_lista" runat="server" Font-Size="9pt" Visible="false"></asp:GridView>
                <asp:GridView ID="GV_HORARIOS" runat="server" AutoGenerateColumns="False" DataSourceID="SQL_DS_HORARIO" Font-Size="9pt" Visible="false" >
                    <Columns>
                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                        <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                        <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                        <asp:BoundField DataField="Column1" HeaderText="Column1" SortExpression="Column1" ReadOnly="True" />
                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                        <asp:BoundField DataField="Column2" HeaderText="Column2" SortExpression="Column2" ReadOnly="True" />
                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" ReadOnly="True" SortExpression="tipo_clase" />
                        <asp:BoundField DataField="NombreSede" HeaderText="NombreSede" SortExpression="NombreSede" />
                        <asp:BoundField DataField="idSede" HeaderText="idSede" SortExpression="idSede" />
                        <asp:BoundField DataField="id_rrhh" HeaderText="id_rrhh" SortExpression="id_rrhh" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SQL_DS_HORARIO" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT H.id_horario ,H.ci_doc , H.gestion ,hora_inicio ,H.hora_fin ,H.grupo,rtrim(P.codcar) ,P.Materia,RTRIM( P.SiglaP) ,SUBSTRING (H.tipo_clase,1,1) as tipo_clase,s.NombreSede ,s.idSede,s.id_rrhh     FROM tb_horario H 
JOIN tb_designacion D ON D.id_horario = H.id_horario 
JOIN planes_estudios P ON D.id_materia  = P.id_plan 
join tb_sedes s on h.sede =s.idSede 
WHERE H.gestion = '1-2026'  "></asp:SqlDataSource>

            </div>

        </div>

        <asp:TextBox ID="txt_siglamat" runat="server" Visible="false" ></asp:TextBox>
        <asp:TextBox ID="txt_siglah" runat="server" Visible="false" ></asp:TextBox>
        <asp:TextBox ID="txt_id_horario" runat="server" Visible="false" ></asp:TextBox>
        <asp:TextBox ID="txt_ci" runat="server" Visible="false" ></asp:TextBox>
        <asp:TextBox ID="txt_nombre" runat="server" Visible="false" ></asp:TextBox>
        <asp:TextBox ID="txt_ppa" runat="server" Visible="false" ></asp:TextBox>
        <asp:TextBox ID="txt_sap" runat="server" Visible="false" ></asp:TextBox>
        <asp:GridView ID="gv_existe" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_existe" Visible="False">
            <Columns>
                <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sql_ds_existe" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_personal(nombres, primerApellido, segundoApellido, ci, gestion, fecha_registro) VALUES (@nombre, @ppa, @sap, @ci, '1-2025', GETDATE())" SelectCommand="select ci from tb_personal 
where ci=@ci and gestion ='1-2025'"
            UpdateCommand="UPDATE tb_horario SET ci_doc = @ci WHERE (id_horario = @idhorario)" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
            <InsertParameters>
                <asp:ControlParameter ControlID="txt_nombre" Name="nombre" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_ppa" Name="ppa" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_sap" Name="sap" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_id_horario" Name="idhorario" PropertyName="Text" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="txt_siglac" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="txt_sigla_h" runat="server" Visible="False"></asp:TextBox>
    </form>
</asp:Content>



