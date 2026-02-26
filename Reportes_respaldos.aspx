<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Reportes_respaldos.aspx.vb" Inherits="Reportes_respaldos" MasterPageFile="mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server"  >
      <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container">
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
                               <asp:DropDownList ID="ddl_docente" CssClass="form-control btn btn-default dropdown-toggle mt-1"  runat="server" DataSourceID="sql_ds_docente" DataTextField="docente" DataValueField="ci_doc" Font-Size="10pt"></asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente ,ci_doc from tb_horario th
join tb_designacion td on th.id_horario = td.id_horario
join planes_estudios p on td.id_materia = p.id_plan 
join tb_personal tp on th.ci_doc = tp.ci 
where th.sede =@sede and p.codcar =@sigcar group by nombres ,primerApellido,segundoApellido,ci_doc order by docente">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_siglacar" Name="sigcar" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                
                                <asp:TextBox ID="txt_fini" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txt_ffin" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" CssClass =" form-control  btn btn-primary mt-1 " runat="server" Text="Buscar clases" />
                                 <asp:Button ID="Button2" CssClass =" form-control  btn-info mt-1 " runat="server" Text="Extraer Reporte" />
                            </div>
             <div class="col-md-8 p-3 mb-2 bg-white text-black border border-dark rounded ">
                              <div class="alert-warning text-md-center  rounded " role="alert">
                                Clases de Respaldo Reprogramaciones de Clases o Practicas Externas 
                            </div>
                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horas" Font-Size="8pt" ShowFooter="True">
                     <Columns>
                         <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                         <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                         <asp:BoundField DataField="tema_avance" HeaderText="tema_avance" SortExpression="tema_avance" />
                         <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                         <asp:BoundField DataField="cant_est" HeaderText="cant_est" SortExpression="cant_est" />
                         <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso" />
                         <asp:BoundField DataField="hr_salida" HeaderText="hr_salida" SortExpression="hr_salida" />
                         <asp:BoundField DataField="MINUTOS" HeaderText="MINUTOS" SortExpression="MINUTOS" ReadOnly="True" />
                         <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones"></asp:BoundField>
                     </Columns>
                              </asp:GridView>
                              <asp:SqlDataSource ID="sql_ds_horas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT ci_doc, Materia, tema_avance, carrera, cant_est, hr_ingreso, hr_salida, DATEDIFF(SS, hr_ingreso, hr_salida) / 60 AS MINUTOS, observaciones FROM tb_ing_sal AS ti WHERE (ci_doc = @cidoc) AND (carrera = @carrera) AND (hr_ingreso BETWEEN @fini AND @fin+1)  ORDER BY TI.id_ing_sal" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
                                  <SelectParameters>
                                      <asp:ControlParameter Name="carrera" ControlID="txt_siglacar" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_fini" Name="fini" PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="txt_ffin" Name="fin" PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="ddl_docente" Name="cidoc" PropertyName="SelectedValue" />
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
        </form>
     </asp:Content>



