<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_ContratosDocente.aspx.vb" Inherits="DIR_CAR_ContratosDocente" MasterPageFile="~/mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class=" row">
            <h3>Datos de los contratos Docente por Carrera y Sede</h3>


        </div>
        <div class="col-md-12 mt-2 ">
            <!--begin::Quick Example-->
            <div class="card card-primary card-outline mb-4">
                <!--begin::Header-->
                <div class="card-header">
                    <div class="card-title">Datos del contrato</div>
                </div>
                <div>
                    <asp:Button ID="Button1" CssClass="btn btn-primary " runat="server" Text="Actualizar" OnClientClick="animarBarra();"  />
                    <span>
                        <asp:Label ID="lbl_notificacion" runat="server" Text=""></asp:Label>

                    </span>
       
                </div>
             
</div>

                <div>
                <asp:GridView ID="gv_contratos" CssClass="table table-hover mt-1" runat="server" Font-Names="Consolas" Font-Size="10pt" GridLines="None">
    <HeaderStyle BackColor="#999999" />
</asp:GridView>
                    </div>
                <!--end::Header-->
                <!--begin::Form-->
            </div>
            <!--begin::Body-->
            
           <%-- <asp:GridView ID="GV_HORARIOS" runat="server" AutoGenerateColumns="False" DataSourceID="SQL_DS_HORARIO" Font-Size="9pt">
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
            </asp:GridView>--%>
            <asp:SqlDataSource ID="SQL_DS_HORARIO" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT H.id_horario ,H.ci_doc , H.gestion ,hora_inicio ,H.hora_fin ,H.grupo,rtrim(P.codcar) ,P.Materia,RTRIM( P.SiglaP) ,SUBSTRING (H.tipo_clase,1,1) as tipo_clase,s.NombreSede ,s.idSede,s.id_rrhh     
FROM tb_horario H 
JOIN tb_designacion D ON D.id_horario = H.id_horario 
JOIN planes_estudios P ON D.id_materia  = P.id_plan 
join tb_sedes s on h.sede =s.idSede 
WHERE H.gestion = '1-2026'
and p.codcar=@codcar
and h.sede=@sede">
                <SelectParameters>
                    
                    <asp:ControlParameter ControlID="TextBox3" Name="codcar" PropertyName="Text"/>
                    <asp:ControlParameter ControlID="TextBox1" Name="sede" PropertyName="Text"  />
                </SelectParameters>
            </asp:SqlDataSource>

            <!--end::Body-->
            <!--begin::Footer--><asp:SqlDataSource ID="sql_ds_existe" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_personal(nombres, primerApellido, segundoApellido, ci, gestion, fecha_registro) VALUES (@nombre, @ppa, @sap, @ci, '1-2026', GETDATE())" SelectCommand="select ci from tb_personal 
where ci=@ci and gestion ='1-2026'" UpdateCommand="UPDATE tb_horario SET ci_doc = @ci WHERE (id_horario = @idhorario)" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
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
            <div class="card-footer">
                
                <asp:TextBox ID="TextBox1" placeholder="sede" runat="server"  visible="true" ></asp:TextBox>
                <asp:TextBox ID="TextBox2" placeholder="carrera" runat="server"  visible="true" ></asp:TextBox>
                <asp:TextBox ID="TextBox3" runat="server"  visible="false" ></asp:TextBox>
                  <asp:TextBox ID="txt_siglamat" runat="server"  visible="false" ></asp:TextBox>
  <asp:TextBox ID="txt_siglah" runat="server"  visible="false" ></asp:TextBox>
  <asp:TextBox ID="txt_id_horario" runat="server"  visible="false" ></asp:TextBox>
  <asp:TextBox ID="txt_ci" runat="server"  visible="false" ></asp:TextBox>
  <asp:TextBox ID="txt_nombre" runat="server"  visible="false" ></asp:TextBox>
  <asp:TextBox ID="txt_ppa" runat="server"  visible="false" ></asp:TextBox>
  <asp:TextBox ID="txt_sap" runat="server"  visible="false" ></asp:TextBox>
            </div>
          
    </form>
  
   
   
   
</asp:Content>


