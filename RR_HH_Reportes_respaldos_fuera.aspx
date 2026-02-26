<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_Reportes_respaldos_fuera.aspx.vb" Inherits="RR_HH_Reportes_respaldos_fuera" MasterPageFile="mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server"  >
      <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid">
    	<div class="row">
                            <div class="col-md-4 p-3 mb-2 bg-default text-black border border-dark rounded ">
                              <div class="alert-warning text-md-center  rounded " role="alert">
                                Seleccionar Tipo de Respaldo ,Docente,Fecha de Inicio y Fecha de Fin
                            </div>



<%--                                    <asp:DropDownList ID="ddl_respaldo_de" CssClass="form-control btn btn-default dropdown-toggle mt-1"  runat="server">
                                    <asp:ListItem>Respaldo de :</asp:ListItem>
                                    <asp:ListItem>Reemplazo de Clases</asp:ListItem>
                                    <asp:ListItem>Practicas Externas</asp:ListItem>
                                 </asp:DropDownList>--%>
                                <asp:DropDownList ID="ddl_sede" runat="server"  CssClass="form-control btn btn-default dropdown-toggle mt-1"  DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_carrera" runat="server" CssClass="form-control btn btn-default dropdown-toggle mt-1"  AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA">
                                    <asp:ListItem Value="0">Seleccione una Carrera</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] order by cardes"></asp:SqlDataSource>
                                <asp:TextBox ID="txt_ci_doc_fu" placeholder="Ingrese el Nro de C.I. del Docente" CssClass ="form-control mt-1 " runat="server" AutoPostBack="True"></asp:TextBox>
                                <asp:GridView ID="gv_docente" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_docente" Font-Names="Consolas" Font-Size="10pt" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                    </Columns>
                                    <HeaderStyle BackColor="#9751FF" ForeColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT (nombres +' '+isnull(primerApellido,'') +' '+isnull(segundoApellido,'') ) as docente FROM [tb_personal] WHERE ([ci] = @ci)  and gestion='2-2023'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_ci_doc_fu" Name="ci" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_fini" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txt_ffin" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" CssClass =" form-control  btn btn-primary mt-1 " runat="server" Text="Buscar clases" />
                                  <div class="alert-warning text-md-center  rounded mt-1 " role="alert">
                                Casilla de Ajuste por defecto " 0 "
                            </div>
                                <asp:TextBox ID="txt_ajuste" CssClass =" form-control mt-1 " Text ="0" runat="server" Visible="False"></asp:TextBox>
                                <asp:DropDownList ID="ddl_tipo_clase"  CssClass="form-control btn btn-default dropdown-toggle mt-1"  runat="server" Visible="False">
                                    <asp:ListItem Value="0">Seleccione el tipo de clase</asp:ListItem>
                                    <asp:ListItem>Teorico</asp:ListItem>
                                    <asp:ListItem>Practico</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="Button3" runat="server" CssClass =" form-control   btn-danger  mt-1 "  Text="Grabar Ajuste" Visible="False" />
                                 <asp:Button ID="Button2" CssClass =" form-control  btn-info mt-1 " runat="server" Text="Extraer Reporte" />
                                  <div class="alert-warning text-md-center  rounded mt-1  " role="alert">
                                Ajustes Realizados al Docente Entre las Fechas Seleccionadas
                            </div>
                                  <asp:GridView ID="gv_ajustes" runat="server" CssClass ="table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_ajustes" Font-Size="9pt" DataKeyNames="id_ajuste">
          <Columns>
              <asp:CommandField ShowDeleteButton="True" />
              <asp:BoundField DataField="id_ajuste" HeaderText="id_ajuste" InsertVisible="False" ReadOnly="True" SortExpression="id_ajuste"  Visible ="false"  />
              <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
              <asp:BoundField DataField="fecha_ini" HeaderText="fecha_ini" SortExpression="fecha_ini" />
              <asp:BoundField DataField="fecha_fin" HeaderText="fecha_fin" SortExpression="fecha_fin" />
              <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera"  Visible ="false"  />
              <asp:BoundField DataField="ajuste" HeaderText="ajuste" SortExpression="ajuste" />
              <asp:BoundField DataField="modificado_por" HeaderText="modificado_por" SortExpression="modificado_por"  Visible ="false"  />
              <asp:BoundField DataField="fecha_ajuste" HeaderText="fecha_ajuste" SortExpression="fecha_ajuste" />
          </Columns>
      </asp:GridView>
                                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>

                            </div>
             <div class="col-md-8 p-3 mb-2 bg-white text-black border border-dark rounded ">
                              <div class="alert-warning text-md-center  rounded " role="alert">
                                Clases de Respaldo Reprogramaciones de Clases o Practicas Externas 
                            </div>
                 <asp:GridView ID="GridView1" runat="server" CssClass ="table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_horas" Font-Size="8pt" ShowFooter="True" Font-Names="Consolas">
                     <Columns>
                         <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                         <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                         <asp:BoundField DataField="tema_avance" HeaderText="tema_avance" SortExpression="tema_avance" />
                         <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                         <asp:BoundField DataField="cant_est" HeaderText="cant_est" SortExpression="cant_est" />
                         <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso" />
                         <asp:BoundField DataField="hr_salida" HeaderText="hr_salida" SortExpression="hr_salida" />
                         <asp:BoundField DataField="Horas_ejecutas" HeaderText="Horas_ejecutas" ReadOnly="True" SortExpression="Horas_ejecutas" />
                         <asp:BoundField DataField="Hras_programadas" HeaderText="Hras_programadas" ReadOnly="True" SortExpression="Hras_programadas" />
                         <asp:BoundField DataField="hra_inicio" HeaderText="hra_inicio" SortExpression="hra_inicio" />
                         <asp:BoundField DataField="hra_fin" HeaderText="hra_fin" SortExpression="hra_fin" />
                         <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" />
                     </Columns>
                              <HeaderStyle BackColor="#9966FF" ForeColor="White" />
                              </asp:GridView>
                              <asp:SqlDataSource ID="sql_ds_horas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="REPORTE_RRHH_HRA_EJE_PROG" InsertCommand="INSERT INTO tb_ajustes(ci_doc, fecha_ini, fecha_fin, carrera, ajuste, modificado_por, fecha_ajuste, sede, tipo_clase) VALUES (@cidoc, @feha_ini, @fecha_fin, @carrera, @ajuste, @modpor, GETDATE(), @sede, @tipoclase)" SelectCommandType="StoredProcedure">
                                  <InsertParameters>
                                      <asp:ControlParameter ControlID="ddl_docente" Name="cidoc" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_fini" Name="feha_ini" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_ffin" Name="fecha_fin" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_ajuste" Name="ajuste" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_idus" Name="modpor" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="ddl_tipo_clase" Name="tipoclase" PropertyName="SelectedValue" />
                                  </InsertParameters>
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="txt_ci_doc_fu" Name="ci" PropertyName="Text" />
                                      <asp:ControlParameter Name="carrera" ControlID="ddl_carrera" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_fini" Name="fechaini" PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="txt_ffin" Name="fecha_fin" PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
   
           
   
                              <asp:TextBox ID="txt_hraprog" runat="server" Visible="False"></asp:TextBox>
   
           
   
                 </div>
            </div>
         </div>  
    <%-- <asp:GridView ID="gv_roles"  Visible ="false"  runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_roles">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" SortExpression="id_usuario" />
            <asp:BoundField DataField="nombre_usuario" HeaderText="nombre_usuario" SortExpression="nombre_usuario" />
            <asp:BoundField DataField="usuario" HeaderText="usuario" SortExpression="usuario" />
            <asp:BoundField DataField="contraeña" HeaderText="contraeña" SortExpression="contraeña" />
            <asp:BoundField DataField="rol" HeaderText="rol" SortExpression="rol" />
            <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
            <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
            <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" />
        </Columns>
      </asp:GridView>
    --%>
    
  <%--  <asp:GridView ID="gv_cargos" runat="server" Visible ="false"  AutoGenerateColumns="False" DataSourceID="sql_ds_cargo">
        <Columns>
            <asp:BoundField DataField="id_cargo" HeaderText="id_cargo" InsertVisible="False" ReadOnly="True" SortExpression="id_cargo" />
            <asp:BoundField DataField="nombre_cargo" HeaderText="nombre_cargo" SortExpression="nombre_cargo" />
        </Columns>
      </asp:GridView>--%>
     <%-- <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_carrera" Visible="False">
          <Columns>
              <asp:BoundField DataField="CARDES" HeaderText="CARDES" SortExpression="CARDES" />
          </Columns>
      </asp:GridView>--%>
     <%-- <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT [CARDES] FROM [tb_carrera_ofi] where carsigla=@carrea" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
          <SelectParameters>
              <asp:ControlParameter ControlID="txt_siglacar" Name="carrea" PropertyName="Text" />
          </SelectParameters>
      </asp:SqlDataSource>--%>
    <asp:TextBox ID="txt_sede"  Visible ="false"  runat="server"></asp:TextBox>
    <asp:TextBox ID="txt_idus"  Visible ="false"  runat="server"></asp:TextBox>
    <%-- <asp:SqlDataSource ID="sql_ds_cargo" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_cargos] WHERE ([id_cargo] = @id_cargo)" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_id_cargo" Name="id_cargo" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
    <asp:TextBox ID="txt_id_cargo"  Visible ="false"  runat="server"></asp:TextBox>
     <%--<asp:SqlDataSource ID="sql_ds_roles" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_login] where id=@idusuario" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_idus" Name="idusuario" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>--%>
     <asp:TextBox ID="txt_siglacar" runat="server" Visible="False"></asp:TextBox>
          <asp:SqlDataSource ID="sql_ds_ajustes" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_ajustes] where ci_doc=@cidoc and fecha_ini=@fi and fecha_fin=@ff and carrera=@carrera order by id_ajuste desc" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>" DeleteCommand="DELETE FROM tb_ajustes WHERE (id_ajuste = @id_ajuste)">
              <DeleteParameters>
                  <asp:Parameter Name="id_ajuste" />
              </DeleteParameters>
          <SelectParameters>
              <asp:ControlParameter ControlID="txt_ci_doc_fu" Name="cidoc" PropertyName="Text" />
              <asp:ControlParameter ControlID="txt_ffin" Name="ff" PropertyName="Text" />
              <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="txt_fini" Name="fi" PropertyName="Text" />
          </SelectParameters>
      </asp:SqlDataSource>
           <asp:TextBox ID="txt_hra_eje" runat="server" Visible="False"></asp:TextBox>
 
        </form>
     </asp:Content>



