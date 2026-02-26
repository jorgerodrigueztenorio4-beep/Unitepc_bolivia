<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_Reportes_respaldos2_1.aspx.vb" Inherits="RR_HH_Reportes_respaldos2_1" MasterPageFile="mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />


    <form runat ="server"  >
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

      <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid">
    	<div class="row">
                            <div class="col-md-4 p-3 mb-2 bg-default text-black border border-dark rounded ">
                              <div class="alert-warning text-md-center  rounded " role="alert">
                                Seleccionar Tipo de Respaldo ,Docente,Fecha de Inicio y Fecha de Fin
                            </div>



                                <asp:DropDownList ID="ddl_sede" runat="server"  CssClass="form-control btn btn-default dropdown-toggle mt-1"  DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_carrera" runat="server" CssClass="form-control btn btn-default dropdown-toggle mt-1"  AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA">
                                    <asp:ListItem Value="0">Seleccione una Carrera</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] order by cardes"></asp:SqlDataSource>
                               <asp:DropDownList ID="ddl_docente" CssClass="form-control btn btn-default dropdown-toggle mt-1"  runat="server" DataSourceID="sql_ds_docente" DataTextField="docente" DataValueField="ci_doc" Font-Size="10pt">
                                   <asp:ListItem Value="0">Seleccione un Docente</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente ,ci_doc from tb_horario th
join tb_designacion td on th.id_horario = td.id_horario
join planes_estudios p on td.id_materia = p.id_plan 
join tb_personal tp on th.ci_doc = tp.ci 
where th.sede =@sede and p.codcar =@sigcar   and th.gestion ='2-2025' and tp.gestion ='2-2025'    group by nombres ,primerApellido,segundoApellido,ci_doc order by docente">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="sigcar" PropertyName="SelectedValue" />
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
                
                 <asp:TextBox ID="txt_id_ingsal" runat="server" Visible="False"></asp:TextBox>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
                 <asp:GridView ID="GridView1" runat="server" CssClass ="table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_horas" Font-Size="8pt" ShowFooter="True" Font-Names="Consolas" DataKeyNames="id_ing_sal" GridLines="None">
                     <Columns>
                          <asp:TemplateField>
            <ItemTemplate>
              <asp:LinkButton ID="btnSeleccionar" runat="server"
                CommandName="Select"
                CssClass="btn btn-danger btn-sm"
                ToolTip="Seleccionar / Eliminar">
    <i class="fa fa-trash"></i>
</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
                         <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                         <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                         <asp:BoundField DataField="tema_avance" HeaderText="Tema de Avance" SortExpression="tema_avance" />
                         <asp:BoundField DataField="carrera" HeaderText="Carrera" SortExpression="carrera" />
                         <asp:BoundField DataField="cant_est" HeaderText="cant. est." SortExpression="cant_est" />
                         <asp:BoundField DataField="hr_ingreso" HeaderText="Hora de ingreso" SortExpression="hr_ingreso" />
                         <asp:BoundField DataField="hr_salida" HeaderText="Hora de salida" SortExpression="hr_salida" />
                         <asp:BoundField DataField="Horas_ejecutas" HeaderText="Horas ejecutas" ReadOnly="True" SortExpression="Horas_ejecutas" />
                         <asp:BoundField DataField="Hras_programadas" HeaderText="Hras. programadas" ReadOnly="True" SortExpression="Hras_programadas" />
                         <asp:BoundField DataField="hra_inicio" HeaderText="Hora de inicio" SortExpression="hra_inicio" />
                         <asp:BoundField DataField="hra_fin" HeaderText="Hora de fin" SortExpression="hra_fin" />
                         <asp:BoundField DataField="observaciones" HeaderText="Observaciones" SortExpression="observaciones" />
                         <asp:BoundField DataField="id_ing_sal" HeaderText="id_ing_sal" SortExpression="observaciones" Visible ="false"  />
                     </Columns>
                              <HeaderStyle BackColor="#9966FF" ForeColor="White" />
                              </asp:GridView>

                  
                              <asp:SqlDataSource ID="sql_ds_horas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="REPORTE_RRHH_HRA_EJE_PROG" InsertCommand="INSERT INTO tb_ajustes(ci_doc, fecha_ini, fecha_fin, carrera, ajuste, modificado_por, fecha_ajuste, sede, tipo_clase) VALUES (@cidoc, @feha_ini, @fecha_fin, @carrera, @ajuste, @modpor, GETDATE(), @sede, @tipoclase)" SelectCommandType="StoredProcedure" DeleteCommand="DELETE FROM tb_ing_sal WHERE (id_ing_sal = @ingsal)">
                                  <DeleteParameters>
                                      <asp:ControlParameter ControlID="txt_id_ingsal" Name="ingsal" PropertyName="Text" />
                                  </DeleteParameters>
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
                                      <asp:ControlParameter ControlID="ddl_docente" Name="ci" PropertyName="SelectedValue" />
                                      <asp:ControlParameter Name="carrera" ControlID="ddl_carrera" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_fini" Name="fechaini" PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="txt_ffin" Name="fecha_fin" PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
  
            </ContentTemplate>
</asp:UpdatePanel>
   
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
              <asp:ControlParameter ControlID="ddl_docente" Name="cidoc" PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="txt_ffin" Name="ff" PropertyName="Text" />
              <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="txt_fini" Name="fi" PropertyName="Text" />
          </SelectParameters>
      </asp:SqlDataSource>
           <asp:TextBox ID="txt_hra_eje" runat="server" Visible="False"></asp:TextBox>
 
        </form>
     </asp:Content>



