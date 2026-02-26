<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_Reportes_respaldos4.aspx.vb" Inherits="RR_HH_Reportes_respaldos4" MasterPageFile="mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server"  >
      <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" ">
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
                                <asp:DropDownList ID="ddl_sede" runat="server"  CssClass="form-control btn btn-default dropdown-toggle mt-1"  DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True" AutoPostBack="True">
                                    <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_carrera" runat="server" CssClass="form-control btn btn-default dropdown-toggle mt-1"  AutoPostBack="True">
                                    <asp:ListItem>ELEGI COMUN</asp:ListItem>
                                    <asp:ListItem Value="FACEFA">FACEFA</asp:ListItem>
                                    <asp:ListItem>INGENIERIAS</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] order by cardes"></asp:SqlDataSource>
                               <asp:DropDownList ID="ddl_docente" CssClass="form-control btn btn-default dropdown-toggle mt-1"  runat="server" Font-Size="10pt" AutoPostBack="True">
                                   <asp:ListItem Value="0">Seleccione un Docente</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente ,ci_doc from tb_horario th
join tb_designacion td on th.id_horario = td.id_horario
join planes_estudios p on td.id_materia = p.id_plan 
join tb_personal tp on th.ci_doc = tp.ci 
where th.sede =@sede and tp.gestion='1-2026' and th.gestion ='1-2026'  and (p.codcar ='carcpu' or p.codcar ='caradm' or p.codcar ='carico' or p.codcar ='CARCAD' or p.codcar ='CARCCP' or p.codcar ='CARCIC' or p.codcar ='CARECO')
group by nombres ,primerApellido,segundoApellido,ci_doc order by docente
">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                
                                <asp:SqlDataSource ID="sql_ds_docente0" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente ,ci_doc from tb_horario th
join tb_designacion td on th.id_horario = td.id_horario
join planes_estudios p on td.id_materia = p.id_plan 
join tb_personal tp on th.ci_doc = tp.ci 
where th.sede =@sede and tp.gestion='1-2026' and th.gestion ='1-2026'  and (p.codcar ='carsis' or p.codcar ='carson' or p.codcar ='carele' or p.codcar ='caribi' )
group by nombres ,primerApellido,segundoApellido,ci_doc order by docente">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                
                                <asp:TextBox ID="txt_fini" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txt_ffin" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" CssClass =" form-control  btn btn-primary mt-1 " runat="server" Text="Buscar clases" />
                                  <div class="alert-warning text-md-center  rounded mt-1 " role="alert">
                                Casilla de Ajuste por defecto " 0 "
                            </div>
                                <asp:TextBox ID="txt_ajuste" CssClass =" form-control mt-1 " Text ="0" runat="server"></asp:TextBox>
                                <asp:Button ID="Button3" runat="server" CssClass =" form-control   btn-danger  mt-1 "  Text="Grabar Ajuste" />
                                 <asp:Button ID="Button2" CssClass =" form-control  btn-info mt-1 " runat="server" Text="Extraer Reporte" />
                                  <div class="alert-warning text-md-center  rounded mt-1  " role="alert">
                                Ajustes Realizados al Docente Entre las Fechas Seleccionadas
                            </div>
                                  <asp:GridView ID="gv_ajustes" runat="server" CssClass ="table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_ajustes" Visible="true" Font-Size="9pt">
          <Columns>
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

                 <asp:GridView ID="GridView1" runat="server" CssClass ="table table-hover mt-1 " Font-Names="Consolas" Font-Size="8pt" GridLines="None" ShowFooter="True"></asp:GridView>


                              <asp:SqlDataSource ID="sql_ds_horas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT ci_doc, Materia, tema_avance, carrera, cant_est, hr_ingreso, hr_salida, CONVERT (integer, ROUND(CONVERT (decimal, DATEDIFF(SS, hr_ingreso, hr_salida)) / 60 / 45, 0)) AS Horas_ejecutas, ISNULL(DATEDIFF(SS, hra_inicio, hra_fin) / 60 / 45, '0') AS Hras_programadas, hra_inicio, hra_fin, observaciones 
FROM tb_ing_sal AS ti 
WHERE (ci_doc = @ci) AND (carrera = 'carcpu' OR carrera = 'caradm' OR carrera = 'carico' OR carrera = 'CARCAD' OR carrera = 'CARCCP' OR carrera = 'CARCIC' OR carrera = 'CARECO') AND (hr_ingreso BETWEEN @fini AND @ffin +1) and ti.sede =@sede
ORDER BY id_ing_sal" InsertCommand="INSERT INTO tb_ajustes(ci_doc, fecha_ini, fecha_fin, carrera, ajuste, modificado_por, fecha_ajuste) VALUES (@cidoc, @feha_ini, @fecha_fin, @carrera, @ajuste, @modpor, GETDATE())">
                                  <InsertParameters>
                                      <asp:ControlParameter ControlID="ddl_docente" Name="cidoc" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_fini" Name="feha_ini" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_ffin" Name="fecha_fin" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_ajuste" Name="ajuste" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_idus" Name="modpor" PropertyName="Text" />
                                  </InsertParameters>
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_fini" Name="fini" PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="txt_ffin" Name="ffin" PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
   
           
   
                              <asp:SqlDataSource ID="sql_ds_horas0" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="Select ti.ci_doc ,ti.Materia ,ti.tema_avance ,ti.carrera ,cant_est ,hr_ingreso ,hr_salida ,convert(integer,round((((convert(decimal,datediff (SS,TI.hr_ingreso   ,TI.hr_salida ))/60)/45)),0)) AS Horas_ejecutas,isnull(DATEDIFF(SS, ti.hra_inicio ,ti.hra_fin) / 60 / 45,'0') AS Hras_programadas,ti.hra_inicio ,ti.hra_fin ,ti.observaciones 
FROM tb_ing_sal ti
where TI.ci_doc =@ci and  (TI.carrera ='carsis' or TI.carrera ='carson' or TI.carrera='carele' or TI.carrera ='caribi' ) and  TI.hr_ingreso BETWEEN @fini and (@ffin+1) and ti.sede=@sede
order by TI.id_ing_sal;" InsertCommand="INSERT INTO tb_ajustes(ci_doc, fecha_ini, fecha_fin, carrera, ajuste, modificado_por, fecha_ajuste) VALUES (@cidoc, @feha_ini, @fecha_fin, @carrera, @ajuste, @modpor, GETDATE())">
                                  <InsertParameters>
                                      <asp:ControlParameter ControlID="ddl_docente" Name="cidoc" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_fini" Name="feha_ini" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_ffin" Name="fecha_fin" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_ajuste" Name="ajuste" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_idus" Name="modpor" PropertyName="Text" />
                                  </InsertParameters>
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="ddl_docente" Name="ci" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_fini" Name="fini" PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="txt_ffin" Name="ffin" PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
   
           
   
                              <asp:TextBox ID="txt_sumas" runat="server" Visible="False"></asp:TextBox>
                  <asp:TextBox ID="txt_hra_eje" runat="server" Visible="False"></asp:TextBox>
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
          <asp:SqlDataSource ID="sql_ds_ajustes" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_ajustes] where ci_doc=@cidoc and fecha_ini=@fi and fecha_fin=@ff and carrera=@carrera order by id_ajuste desc" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
          <SelectParameters>
              <asp:ControlParameter ControlID="ddl_docente" Name="cidoc" PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="txt_ffin" Name="ff" PropertyName="Text" />
              <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
              <asp:ControlParameter ControlID="txt_fini" Name="fi" PropertyName="Text" />
          </SelectParameters>
      </asp:SqlDataSource>
           <asp:TextBox ID="txt_sumas2" runat="server" Visible="False"></asp:TextBox>
           <asp:TextBox ID="txt_ci" runat="server" Visible="false"></asp:TextBox>
 
        </form>
     </asp:Content>



