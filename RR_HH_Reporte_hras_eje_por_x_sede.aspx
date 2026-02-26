<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_Reporte_hras_eje_por_x_sede.aspx.vb" Inherits="RR_HH_Reporte_hras_eje_por_x_sede" MasterPageFile="mp_rr_hh.master" %>

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
                                
                                <asp:TextBox ID="txt_fini" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txt_ffin" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" CssClass =" form-control  btn btn-primary mt-1 " runat="server" Text="Buscar clases" />
                                 
                               
                              
                              
                                 <asp:Button ID="Button2" CssClass =" form-control  btn-info mt-1 " runat="server" Text="Extraer Reporte" />
                                 
                              

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
                          <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso"></asp:BoundField>
                         <asp:BoundField DataField="hr_salida" HeaderText="hr_salida" SortExpression="hr_salida" />

 <asp:BoundField DataField="Horas_ejecutas" HeaderText="Horas_ejecutas" SortExpression="Horas_ejecutas" ReadOnly="True" />
<asp:BoundField DataField="Hras_programadas" HeaderText="Hras_programadas" SortExpression="Hras_programadas" ReadOnly="True" />
                <asp:BoundField DataField="hra_inicio" HeaderText="hra_inicio" SortExpression="hra_inicio" />
                         <asp:BoundField DataField="hra_fin" HeaderText="hra_fin" SortExpression="hra_fin" />         
                         
                       

                        
                         
                         
                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                         <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" />
                     </Columns>
                              <HeaderStyle BackColor="#9966FF" ForeColor="White" />
                              </asp:GridView>
                              <asp:SqlDataSource ID="sql_ds_horas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="REPORTE_HRS_EJE_VS_PROG_X_SEDE" InsertCommand="INSERT INTO tb_ajustes(ci_doc, fecha_ini, fecha_fin, carrera, ajuste, modificado_por, fecha_ajuste, sede, tipo_clase) VALUES (@cidoc, @feha_ini, @fecha_fin, @carrera, @ajuste, @modpor, GETDATE(), @sede, @tipoclase)" SelectCommandType="StoredProcedure">
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
                                      <asp:ControlParameter ControlID="ddl_sede" Name="SEDE" PropertyName="SelectedValue" Type="String" />
                                      <asp:ControlParameter ControlID="txt_fini" Name="fechaini" PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="txt_ffin" Name="fecha_fin" PropertyName="Text" Type="DateTime" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
   
           
   
                              <asp:TextBox ID="txt_sumas" runat="server" Visible="False"></asp:TextBox>
   
           
   
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
           <asp:TextBox ID="txt_sumas2" runat="server" Visible="False"></asp:TextBox>
 
        </form>
     </asp:Content>



