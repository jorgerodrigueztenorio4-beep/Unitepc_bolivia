<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_calendario_clases.aspx.vb" Inherits="ADM_calendario_clases" MasterPageFile="~/mp1.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
       

   


       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Personales del Docente
                            </div>
                                 <asp:DropDownList ID="ddl_dia" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Seleccione un Dia</asp:ListItem>
                                    <asp:ListItem>Lunes</asp:ListItem>
                                    <asp:ListItem>Martes</asp:ListItem>
                                    <asp:ListItem>Miércoles</asp:ListItem>
                                    <asp:ListItem>Jueves</asp:ListItem>
                                    <asp:ListItem>Viernes</asp:ListItem>
                                    <asp:ListItem>Sábado</asp:ListItem>
                                </asp:DropDownList>
                                <asp:GridView ID="gv_semanas" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_semanas">
                                    <Columns>
                                        <asp:BoundField DataField="id_semana" HeaderText="id_semana" InsertVisible="False" ReadOnly="True" SortExpression="id_semana" />
                                        <asp:BoundField DataField="semana" HeaderText="semana" SortExpression="semana" />
                                        <asp:BoundField DataField="fechas" HeaderText="fechas" SortExpression="fechas" />
                                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                                        <asp:BoundField DataField="detalle" HeaderText="detalle" SortExpression="detalle" />
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                    </Columns>
                                </asp:GridView>
                                  <asp:SqlDataSource ID="sql_ds_semanas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_semanas_academicas] WHERE ([dia] = @dia) and detalle='Actividades Teorico / Practico'">
                                      <SelectParameters>
                                          <asp:ControlParameter ControlID="ddl_dia" Name="dia" PropertyName="SelectedValue" Type="String" />
                                      </SelectParameters>
                                </asp:SqlDataSource>
                                  </div>
             <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Personales del Docente
                            </div>
                 <asp:GridView ID="gv_horario" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario" Font-Size="9pt">
                     <Columns>
                         <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                         <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
                         <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                         <asp:BoundField DataField="nombre_clase" HeaderText="nombre_clase" SortExpression="nombre_clase" />
                         <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                         <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                         <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                         <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                         <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                         <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                         <asp:BoundField DataField="link_clase" HeaderText="link_clase" SortExpression="link_clase" />
                         <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
                         <asp:BoundField DataField="aula" HeaderText="aula" SortExpression="aula" />
                         <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" />
                         <asp:BoundField DataField="ci_usuario" HeaderText="ci_usuario" SortExpression="ci_usuario" />
                     </Columns>
                              </asp:GridView>

                                  <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_horario, sede, gestion, nombre_clase, tipo_clase, hora_inicio, hora_fin, ci_doc, grupo, dia, link_clase, bloque, aula, fecha_registro, ci_usuario FROM tb_horario WHERE (tipo_clase = 'Virtual')"></asp:SqlDataSource>

                                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_clases_prog" Font-Size="9pt">
                                      <Columns>
                                          <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                          <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                          <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                          <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                          <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                          <asp:BoundField DataField="Hra_academica" HeaderText="Hra_academica" ReadOnly="True" SortExpression="Hra_academica" />
                                          <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                          <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                          <asp:BoundField DataField="dia1" HeaderText="dia1" SortExpression="dia1" />
                                          <asp:BoundField DataField="fechas" HeaderText="fechas" SortExpression="fechas" />
                                      </Columns>
                              </asp:GridView>
                              <asp:TextBox ID="txt_horas_designada" runat="server"></asp:TextBox>
                              <asp:SqlDataSource ID="sql_ds_clases_prog" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente, th.hora_inicio ,th.hora_fin,((datediff (SS,th.hora_inicio   ,th.hora_fin )/60)/45) AS Hra_academica,th.dia,p.Materia,ts.dia ,ts.fechas  
 from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join planes_estudios p on td.id_materia = p.id_plan 
inner join tb_personal tp on th.ci_doc = tp.ci 
inner join tb_calendario_clase tc on tc.id_horario =th.id_horario 
inner join tb_semanas_academicas ts on tc.id_semana = ts.id_semana 
order by ts.fechas "></asp:SqlDataSource>
                              <asp:Button ID="Button1" runat="server" Text="Button" />
                              <br />

                                  </div>
              </div>
           </div>

</asp:Content>


