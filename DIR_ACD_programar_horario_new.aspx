<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_programar_horario_new.aspx.vb" Inherits="DIR_ACD_programar_horario_new" MasterPageFile="mp_dir_academico.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
       <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-4 p-1 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Programar Horario
                            </div>
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True">
                                    <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT idSede, NombreSede, nombrecorto FROM tb_sedes ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_id_sede" Name="idsede" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                 <asp:DropDownList ID="ddl_bloque" runat="server" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" DataSourceID="sql_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AutoPostBack="True" AppendDataBoundItems="True">
                                     <asp:ListItem Value="0">Seleccione el Bloque</asp:ListItem>
                    </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="sql_bloque" ConnectionString='<%$ ConnectionStrings:unitepc_boliviaConnectionString %>' SelectCommand="SELECT * FROM [tb_bloques] where id_sede=@sede" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                    </asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_aula" runat="server" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" DataSourceID="sql_ds_aula" DataTextField="aula" DataValueField="id_nomal">
                                </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="sql_ds_aula" ConnectionString='<%$ ConnectionStrings:unitepc_boliviaConnectionString %>' SelectCommand="SELECT id_nomal , (nom_aula_lab +' -- Cap: '+isnull(capacidad,'0')) as aula     FROM [tb_aula] where bloque=@bloque  and gestion ='1-2024'  order by nom_aula_lab" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                 </asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_carrera" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione un Carrera</asp:ListItem>
                                </asp:DropDownList>
                                
                                          <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] ">
                                              <SelectParameters>
                                                  <asp:ControlParameter ControlID="txt_sigla_carrera" Name="siglacar" PropertyName="Text" />
                                              </SelectParameters>
                                </asp:SqlDataSource>
                                
                                       
                                  <div style="background-color: 	#ffc107" class="text-md-center  rounded text-bold" role="alert">
                                Seleccione el dia la Hora y Minutos de Inicio de la Clase
                            </div>
                           <asp:DropDownList ID="ddl_dia" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Seleccione un Dia</asp:ListItem>
                                    <asp:ListItem>Lunes</asp:ListItem>
                                    <asp:ListItem>Martes</asp:ListItem>
                                    <asp:ListItem>Miercoles</asp:ListItem>
                                    <asp:ListItem>Jueves</asp:ListItem>
                                    <asp:ListItem>Viernes</asp:ListItem>
                                    <asp:ListItem>Sabado</asp:ListItem>
                                </asp:DropDownList>
                                 <div class="input-group mb-1">
                            <asp:DropDownList ID="ddl_hr_ini" CssClass="form-control  btn btn-outline-default border-dark mt-1 " runat="server" Visible="true" AutoPostBack="True">
                    <asp:ListItem>Hora y Minutos de Inicio</asp:ListItem>
                    <asp:ListItem>06:45</asp:ListItem>
                    <asp:ListItem>07:30</asp:ListItem>
                    <asp:ListItem>08:15</asp:ListItem>
                    <asp:ListItem>09:00</asp:ListItem>
                    <asp:ListItem>09:45</asp:ListItem>
                    <asp:ListItem>10:30</asp:ListItem>
                    <asp:ListItem>11:15</asp:ListItem>
                    <asp:ListItem>12:00</asp:ListItem>
                    <asp:ListItem>12:45</asp:ListItem>
                    <asp:ListItem>13:30</asp:ListItem>
                    <asp:ListItem>14:15</asp:ListItem>
                    <asp:ListItem>15:00</asp:ListItem>
                    <asp:ListItem>15:45</asp:ListItem>
                    <asp:ListItem>16:30</asp:ListItem>
                    <asp:ListItem>17:15</asp:ListItem>
                    <asp:ListItem>18:00</asp:ListItem>
                    <asp:ListItem>18:45</asp:ListItem>
                    <asp:ListItem>19:30</asp:ListItem>
                    <asp:ListItem>20:15</asp:ListItem>
                    <asp:ListItem>21:00</asp:ListItem>
                    <asp:ListItem>21:45</asp:ListItem>
                    
                    </asp:DropDownList>
                                      
                            </div> 
                                <div style="background-color: 	#ffc107" class="text-md-center  rounded text-bold" role="alert">
                                Seleccione los Periodos de la Clase
                                  </div>
                                <div class="input-group mb-1">
                                    <asp:Button ID="Button5"  CssClass ="form-control btn-INFO mt-1 "  runat="server" Text="1 Periodos"  />
                                     <asp:Button ID="Button3"  CssClass ="form-control btn-primary mt-1 "  runat="server" Text="2 Periodos" />
                                     <asp:Button ID="Button4"  CssClass ="form-control btn-success mt-1  "  runat="server" Text="3 Periodos" />
                                    <asp:Button ID="Button6"  CssClass ="form-control btn-warning  mt-1  "  runat="server" Text="4 Periodos"  />
                                </div>

                                <div class="input-group mb-1">
                                    <asp:Label ID="Label1" runat="server" CssClass ="mt-1 ml-2 mr-1 font-weight-bold " Text="Hora de Inicio"></asp:Label>
                                    <asp:TextBox ID="txt_hora_ini" CssClass ="form-control"  runat="server" Font-Bold="True" Font-Names="Consolas" Font-Size="14pt" ReadOnly="True"></asp:TextBox>
                                    <asp:Label ID="Label2" runat="server" CssClass ="mt-1 ml-2 mr-1 font-weight-bold " Text="Hora de Fin"></asp:Label>
                                    <asp:TextBox ID="txt_hrafin" CssClass ="form-control" runat="server" Font-Bold="True" Font-Names="Consolas" Font-Size="14pt" ReadOnly="True"></asp:TextBox>
                     

                  </div>

                                <%--Seleccion de Docente--%>
                                <%-- <div style="background-color: 	#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Seleccione al Docente que dara la Clase
                            </div>
                                 <asp:DropDownList ID="ddl_docente" runat="server" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1" DataSourceID="sql_docente" DataTextField="docente" DataValueField="ci"></asp:DropDownList>


                                     <asp:SqlDataSource ID="sql_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT nombres + ' ' + primerApellido + ' ' + segundoApellido AS docente, ci FROM tb_personal order by docente"></asp:SqlDataSource>--%>

    <%--Tipo de Clase--%>
                                 <div style="background-color: 	#ffc107" class="text-md-center  rounded text-bold mt-1 " role="alert">
                                Seleccione el Tipo de Clase Virtual o Presencial
                            </div>
                                  <asp:DropDownList ID="ddl_tipo_clase" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Seleccione el Tipo de Clase</asp:ListItem>
                                    <asp:ListItem>Teorico</asp:ListItem>
                                    <asp:ListItem>Practico</asp:ListItem>
                                       
                                </asp:DropDownList>
                                <asp:TextBox ID="txt_link_clase" CssClass ="form-control mt-1 " placeholder="Link del Curso en la Plataforma Moodle" runat="server" Visible="False"></asp:TextBox>
                                <div class="input-group mb-1">
                                  <asp:DropDownList ID="ddl_grupo" CssClass=" form-control btn btn-default border-dark  dropdown-toggle mt-1"  runat="server" AutoPostBack="True" Visible="False">
                     <asp:ListItem>Grupo Numerico</asp:ListItem>
                                       <asp:ListItem>1</asp:ListItem>
                                       <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                      
                                   </asp:DropDownList>
                 
                  
                           <asp:DropDownList ID="ddl_grupol" CssClass=" form-control btn btn-default border-dark  dropdown-toggle mt-1"  runat="server" AutoPostBack="True" Visible="False">
                     <asp:ListItem>Grupos Literal</asp:ListItem>
                                      
                                        <asp:ListItem>A</asp:ListItem>
                                        <asp:ListItem>B</asp:ListItem>
                                        <asp:ListItem>C</asp:ListItem>
                                        <asp:ListItem>D</asp:ListItem>
                                        <asp:ListItem>E</asp:ListItem>
                                        <asp:ListItem>F</asp:ListItem>
                                        <asp:ListItem>G</asp:ListItem>
                                        <asp:ListItem>H</asp:ListItem>
                                        <asp:ListItem>I</asp:ListItem>
                                        <asp:ListItem>J</asp:ListItem>
                                        <asp:ListItem>K</asp:ListItem>
                                        <asp:ListItem>L</asp:ListItem>
                                       <asp:ListItem>M</asp:ListItem>
                                       <asp:ListItem>N</asp:ListItem>
                                       <asp:ListItem>O</asp:ListItem>
                                       <asp:ListItem>P</asp:ListItem>
                                       <asp:ListItem>Q</asp:ListItem>
                                       <asp:ListItem>R</asp:ListItem>
                                       <asp:ListItem>S</asp:ListItem>
                                       <asp:ListItem>T</asp:ListItem>
                                       <asp:ListItem>U</asp:ListItem>
                                       <asp:ListItem>V</asp:ListItem>
                                       <asp:ListItem>W</asp:ListItem>
                                       <asp:ListItem>X</asp:ListItem>
                                       <asp:ListItem>Y</asp:ListItem>
                                       <asp:ListItem>Z</asp:ListItem>
                                   </asp:DropDownList>

 </div>
                 <asp:TextBox ID="txt_grupos" CssClass ="form-control mt-1" runat="server" Visible="true"></asp:TextBox>


                            
                           
                                    

                                       
                         
                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary mt-1  form-control " Text="Registrar Clase" />
                                   
         </div>                      
   
                                        <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                                               <div style="background-color: 	#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Programar Clase
                         
                            </div>

                                            <asp:GridView ID="gv_clases" CssClass=" table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_clase_no" Font-Size="9pt" DataKeyNames="id_horario">
                                                <Columns>
                                                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ControlStyle-CssClass="btn-danger" />
                                                    <asp:BoundField DataField="id_horario" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                                    <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                                                    <asp:BoundField DataField="tipo_clase" HeaderText="tipo de Clase" SortExpression="tipo_clase" />
                                                    <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                                                    <asp:BoundField DataField="hora_fin" HeaderText="Hora de fin" SortExpression="hora_fin" />
                                                    <asp:BoundField DataField="NombreSede" HeaderText="Sede" SortExpression="NombreSede" />
                                                    <asp:BoundField DataField="nom_bloque" HeaderText="Bloque" SortExpression="nom_bloque" />
                                                    <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula/Lab." SortExpression="nom_aula_lab" />
                                                </Columns>
                                                <HeaderStyle BackColor="#D4EDDA" BorderColor="#C3E6CB" ForeColor="#155724" />
                                               </asp:GridView>
                                               <asp:SqlDataSource ID="sql_ds_clase_no" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT th.id_horario, th.dia, th.tipo_clase, th.hora_inicio, th.hora_fin, s.NombreSede, b.nom_bloque, a.nom_aula_lab FROM tb_horario AS th INNER JOIN tb_aula AS a ON th.aula = a.id_nomal INNER JOIN tb_bloques AS b ON th.bloque = b.id_bloque INNER JOIN tb_sedes AS s ON th.sede = s.idSede WHERE (th.designado = 'No') AND (th.gestion = '1-2025')  AND (th.ci_usuario = @cius)  and a.gestion ='1-2024'" DeleteCommand="DELETE FROM tb_horario WHERE (id_horario = @id_horario)">
                                                   <DeleteParameters>
                                                       <asp:Parameter Name="id_horario" />
                                                   </DeleteParameters>
                                                   <SelectParameters>
                                                       <asp:ControlParameter ControlID="txt_ciusuario" Name="cius" PropertyName="Text" />
                                                   </SelectParameters>
                                               </asp:SqlDataSource>
                                           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                           </asp:UpdatePanel>
                                               <asp:DropDownList ID="ddl_ant_nuevo" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Seleccione el Tipo de Plan</asp:ListItem>
                                    <asp:ListItem Value="A">Plan Antiguo</asp:ListItem>
                                    <asp:ListItem Value="N">Plan Nuevo</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddl_materias" runat="server" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" AutoPostBack="True" DataSourceID="sql_ds_materias" DataTextField="Materia" DataValueField="id_plan" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione la Materia</asp:ListItem>
                                               </asp:DropDownList>
                                         
                                           <asp:SqlDataSource ID="sql_ds_materias" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [planes_estudios] WHERE (([Sede_id] = @Sede_id) AND ([codcar] = @codcar) AND ([Sis_plan] = @Sis_plan))">
                                               <SelectParameters>
                                                   <asp:ControlParameter ControlID="ddl_sede" Name="Sede_id" PropertyName="SelectedValue" Type="Int32" />
                                                   <asp:ControlParameter ControlID="ddl_carrera" Name="codcar" PropertyName="SelectedValue" Type="String" />
                                                   <asp:ControlParameter ControlID="ddl_ant_nuevo" Name="Sis_plan" PropertyName="SelectedValue" Type="String" />
                                               </SelectParameters>
                                           </asp:SqlDataSource>
                                           <asp:GridView ID="GridView1" runat="server" CssClass=" table-hover mt-1 " AutoGenerateColumns="False" DataKeyNames="id_plan" DataSourceID="sql_materia_selec" Font-Size="9pt">
                                               <Columns>
                                                   <asp:BoundField DataField="id_plan" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_plan" />
                                                   <asp:BoundField DataField="codcar" HeaderText="Sigla de la Carrera" SortExpression="codcar" />
                                                   <asp:BoundField DataField="SiglaP" HeaderText="Sigla de la Materia" SortExpression="SiglaP" />
                                                   <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                                   <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" />
                                                   <asp:BoundField DataField="Hrs_teoricas" HeaderText="Hrs. Teoricas" SortExpression="Hrs_teoricas" />
                                                   <asp:BoundField DataField="Hrs_practicas" HeaderText="Hrs. Practicas" SortExpression="Hrs_practicas" />
                                                   <asp:BoundField DataField="Hrs_Total" HeaderText="Hrs_Total" SortExpression="Hrs_Total" />
                                                   <asp:BoundField DataField="Creditos" HeaderText="Creditos" SortExpression="Creditos" Visible ="false"  />
                                                   <asp:BoundField DataField="Sede_id" HeaderText="Sede_id" SortExpression="Sede_id" Visible ="false"  />
                                                   <asp:BoundField DataField="Sis_plan" HeaderText="Plan de Estudios" SortExpression="Sis_plan" />
                                               </Columns>
                                           </asp:GridView>
                                           <asp:SqlDataSource ID="sql_materia_selec" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [planes_estudios] WHERE ([id_plan] = @id_plan)">
                                               <SelectParameters>
                                                   <asp:ControlParameter ControlID="ddl_materias" Name="id_plan" PropertyName="SelectedValue" Type="Int32" />
                                               </SelectParameters>
                                           </asp:SqlDataSource>
                                           <asp:TextBox ID="txt_id_horarioselec" runat="server" Visible="False"></asp:TextBox>
                                           <asp:Button ID="Button2" CssClass=" btn-primary form-control mt-1 " runat="server" Text="Designar Clase" />
                                           <asp:TextBox ID="txt_horas_designada" runat="server" Visible="False"></asp:TextBox>
                                         
                                </div>


              <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                                               <div style="background-color: 	#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Clases del Aula o Lab Seleccionado
                         
                            </div>
                  <asp:GridView ID="gv_prog" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ocupado" Font-Size="9pt">
                      <Columns>
                          <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                          <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                          <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                          <asp:BoundField DataField="nom_bloque" HeaderText="Bloque" SortExpression="nom_bloque" />
                          <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />
                          <asp:BoundField DataField="carrera" HeaderText="Carrera" ReadOnly="True" SortExpression="carrera" />
                      </Columns>
                                               </asp:GridView>
                                               <asp:SqlDataSource ID="sql_ocupado" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT h.hora_inicio, h.hora_fin, h.dia, b.nom_bloque, a.nom_aula_lab,  isnull (d.carrera,'' ) as carrera 
FROM tb_horario AS h 
INNER JOIN tb_designacion AS d ON h.id_horario = d.id_horario 
INNER JOIN tb_bloques AS b ON h.bloque = b.id_bloque 
INNER JOIN tb_aula AS a ON h.aula = a.id_nomal
WHERE (h.sede = @sede) AND (h.bloque = @bloque) AND (h.dia = @dia) AND (h.aula = @aula) and h.gestion ='1-2025' order by hora_inicio">
                                                   <SelectParameters>
                                                       <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                                       <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                                                       <asp:ControlParameter ControlID="ddl_dia" Name="dia" PropertyName="SelectedValue" />
                                                       <asp:ControlParameter ControlID="ddl_aula" Name="aula" PropertyName="SelectedValue" />
                                                       <asp:ControlParameter ControlID="txt_hora_ini" Name="hora_in" PropertyName="Text" />
                                                       <asp:ControlParameter ControlID="txt_hrafin" Name="horafin" PropertyName="Text" />
                                                   </SelectParameters>
                                               </asp:SqlDataSource>
                                               <asp:GridView ID="gv_inicio" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_inicio">
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
                                                       <asp:BoundField DataField="designado" HeaderText="designado" SortExpression="designado" />
                                                   </Columns>
                                                   <HeaderStyle BackColor="#CCCCFF" />
                                               </asp:GridView>
                                               <asp:SqlDataSource ID="sql_ds_inicio" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select * from tb_horario 
where  gestion ='1-2025' and  dia =@dia and sede=@sede and aula=@aula  and @hi&lt; hora_fin and @hi&gt;= hora_inicio 
">
                                                   <SelectParameters>
                                                       <asp:ControlParameter ControlID="ddl_dia" Name="dia" PropertyName="SelectedValue" />
                                                       <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                                       <asp:ControlParameter ControlID="ddl_aula" Name="aula" PropertyName="SelectedValue" />
                                                       <asp:ControlParameter ControlID="txt_hora_ini" Name="hi" PropertyName="Text" />
                                                   </SelectParameters>
                                               </asp:SqlDataSource>
                  <asp:GridView ID="gv_fin" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_fin">
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
                          <asp:BoundField DataField="designado" HeaderText="designado" SortExpression="designado" />
                      </Columns>
                                               <HeaderStyle BackColor="#CCFFFF" />
                                               </asp:GridView>
                                               <asp:SqlDataSource ID="sql_ds_fin" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select * from tb_horario 
where  gestion ='1-2025' and  dia =@dia and sede=@sede and aula=@aula  and @hf&gt; hora_inicio and @hf&lt;=hora_fin 
">
                                                   <SelectParameters>
                                                       <asp:ControlParameter ControlID="ddl_dia" Name="dia" PropertyName="SelectedValue" />
                                                       <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                                       <asp:ControlParameter ControlID="ddl_aula" Name="aula" PropertyName="SelectedValue" />
                                                       <asp:ControlParameter ControlID="txt_hrafin" Name="hf" PropertyName="Text" />
                                                   </SelectParameters>
                                               </asp:SqlDataSource>
                  </div>


            </div>
         </div>
            <asp:TextBox ID="txt_sede" runat="server" Visible="False"></asp:TextBox>
             
      
           <asp:TextBox ID="txt_sigla_carrera" runat="server" Visible="False"></asp:TextBox>
           
           <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_horario(gestion, tipo_clase, hora_inicio, hora_fin, grupo, dia, link_clase, bloque, aula, fecha_registro, ci_usuario, sede, designado, ci_doc) VALUES ('1-2025', @tipoclase, @hini, @hrfin, @grupo, @dia, @linkclase, @bloque, @aula, GETDATE(), @ciusuario, @sede, 'No', '0')" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
               <InsertParameters>
                   <asp:ControlParameter ControlID="ddl_tipo_clase" Name="tipoclase" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="txt_hora_ini" Name="hini" PropertyName="Text" />
                   <asp:ControlParameter ControlID="txt_hrafin" Name="hrfin" PropertyName="Text" />
                   <asp:ControlParameter ControlID="txt_grupos" Name="grupo" PropertyName="Text" />
                   <asp:ControlParameter ControlID="ddl_dia" Name="dia" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="txt_link_clase" Name="linkclase" PropertyName="Text" />
                   <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="ddl_aula" Name="aula" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="txt_ciusuario" Name="ciusuario" PropertyName="Text" />
                   <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
               </InsertParameters>
           </asp:SqlDataSource>
           <asp:SqlDataSource ID="sql_ds_designacion" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_designacion(id_horario, id_materia, fecha_creacion, id_sede, plan_est, horas, carrera) VALUES (@idhorario, @id_materia, GETDATE(), @id_sede, @plan , @horas, @carrera)" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>" UpdateCommand="UPDATE tb_horario SET designado = 'Si' WHERE (id_horario = @id_horario)">
               <InsertParameters>
                   <asp:ControlParameter ControlID="txt_id_horarioselec" Name="idhorario" PropertyName="Text" />
                   <asp:ControlParameter ControlID="ddl_materias" Name="id_materia" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="ddl_sede" Name="id_sede" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="ddl_ant_nuevo" Name="plan" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="txt_horas" Name="horas" PropertyName="Text" />
                   <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
               </InsertParameters>
               <UpdateParameters>
                   <asp:ControlParameter ControlID="txt_id_horarioselec" Name="id_horario" PropertyName="Text" />
               </UpdateParameters>
           </asp:SqlDataSource>
           <asp:TextBox ID="txt_ciusuario" runat="server" Visible="False"></asp:TextBox>
           <asp:TextBox ID="txt_dia" runat="server" Visible="False"></asp:TextBox>
           <asp:TextBox ID="txt_id_sede" runat="server" Visible="False"></asp:TextBox>
           <asp:TextBox ID="txt_horas" runat="server" Visible="False"></asp:TextBox>
           

          


           </form>
</asp:Content>


