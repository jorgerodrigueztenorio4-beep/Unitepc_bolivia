<%@ Page Language="VB" AutoEventWireup="false" CodeFile="COORDINADOR_programar_horario.aspx.vb" Inherits="COORDINADOR_programar_horario" MasterPageFile="~/mp_coordinadores.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
       <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Programar Horario
                            </div>
                                
                                          <asp:DropDownList ID="ddl_dia" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Seleccione un Dia</asp:ListItem>
                                    <asp:ListItem>Lunes</asp:ListItem>
                                    <asp:ListItem>Martes</asp:ListItem>
                                    <asp:ListItem>Miercoles</asp:ListItem>
                                    <asp:ListItem>Jueves</asp:ListItem>
                                    <asp:ListItem>Viernes</asp:ListItem>
                                    <asp:ListItem>Sabado</asp:ListItem>
                                </asp:DropDownList>
                                  <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Seleccione la Hora  y Minutos de Inicio
                            </div>
                            <asp:DropDownList ID="ddl_hr_ini" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1" runat="server" Visible="true" AutoPostBack="True">
                    <asp:ListItem>Seleccione la Hora de Inicio</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    </asp:DropDownList>
                <asp:DropDownList ID="ddl_min_ini" CssClass ="form-control btn btn-outline-info  mt-1 " runat="server" Visible="true">
                    <asp:ListItem>Seleccione Minutos de Inicio</asp:ListItem>
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                    <asp:ListItem>32</asp:ListItem>
                    <asp:ListItem>33</asp:ListItem>
                    <asp:ListItem>34</asp:ListItem>
                    <asp:ListItem>35</asp:ListItem>
                    <asp:ListItem>36</asp:ListItem>
                    <asp:ListItem>37</asp:ListItem>
                    <asp:ListItem>38</asp:ListItem>
                    <asp:ListItem>39</asp:ListItem>
                    <asp:ListItem>40</asp:ListItem>
                    <asp:ListItem>41</asp:ListItem>
                    <asp:ListItem>42</asp:ListItem>
                    <asp:ListItem>43</asp:ListItem>
                    <asp:ListItem>44</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                    <asp:ListItem>46</asp:ListItem>
                    <asp:ListItem>47</asp:ListItem>
                    <asp:ListItem>48</asp:ListItem>
                    <asp:ListItem>49</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                    <asp:ListItem>51</asp:ListItem>
                    <asp:ListItem>52</asp:ListItem>
                    <asp:ListItem>53</asp:ListItem>
                    <asp:ListItem>54</asp:ListItem>
                    <asp:ListItem>55</asp:ListItem>
                    <asp:ListItem>56</asp:ListItem>
                    <asp:ListItem>57</asp:ListItem>
                    <asp:ListItem>58</asp:ListItem>
                    <asp:ListItem>59</asp:ListItem>

                </asp:DropDownList>
                                 <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Seleccione la Hora  y Minutos de Fin de la Clase
                            </div>
                                  <asp:DropDownList ID="ddl_hra_fin" CssClass ="form-control btn btn-outline-info  mt-1 "  runat="server">
                  <asp:ListItem>Seleccione la Hora de Fin</asp:ListItem>
                     <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddl_min_fin" CssClass ="form-control btn btn-outline-info  mt-1 "  runat="server">
                    <asp:ListItem>Seleccione Minutos de Fin</asp:ListItem>
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                    <asp:ListItem>24</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>26</asp:ListItem>
                    <asp:ListItem>27</asp:ListItem>
                    <asp:ListItem>28</asp:ListItem>
                    <asp:ListItem>29</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>31</asp:ListItem>
                    <asp:ListItem>32</asp:ListItem>
                    <asp:ListItem>33</asp:ListItem>
                    <asp:ListItem>34</asp:ListItem>
                    <asp:ListItem>35</asp:ListItem>
                    <asp:ListItem>36</asp:ListItem>
                    <asp:ListItem>37</asp:ListItem>
                    <asp:ListItem>38</asp:ListItem>
                    <asp:ListItem>39</asp:ListItem>
                    <asp:ListItem>40</asp:ListItem>
                    <asp:ListItem>41</asp:ListItem>
                    <asp:ListItem>42</asp:ListItem>
                    <asp:ListItem>43</asp:ListItem>
                    <asp:ListItem>44</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                    <asp:ListItem>46</asp:ListItem>
                    <asp:ListItem>47</asp:ListItem>
                    <asp:ListItem>48</asp:ListItem>
                    <asp:ListItem>49</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                    <asp:ListItem>51</asp:ListItem>
                    <asp:ListItem>52</asp:ListItem>
                    <asp:ListItem>53</asp:ListItem>
                    <asp:ListItem>54</asp:ListItem>
                    <asp:ListItem>55</asp:ListItem>
                    <asp:ListItem>56</asp:ListItem>
                    <asp:ListItem>57</asp:ListItem>
                    <asp:ListItem>58</asp:ListItem>
                    <asp:ListItem>59</asp:ListItem>

                </asp:DropDownList>

                            

                                <%--Seleccion de Docente--%>
                                 <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Seleccione al Docente que dara la Clase
                            </div>
                                 <asp:DropDownList ID="ddl_docente" runat="server" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1" DataSourceID="sql_docente" DataTextField="docente" DataValueField="ci"></asp:DropDownList>


                                     <asp:SqlDataSource ID="sql_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT nombres + ' ' + primerApellido + ' ' + segundoApellido AS docente, ci FROM tb_personal order by docente"></asp:SqlDataSource>

    <%--Tipo de Clase--%>
                                 <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Seleccione el Tipo de Clase Virtual o Presencial
                            </div>
                                  <asp:DropDownList ID="ddl_tipo_clase" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Seleccione el Tipo de Clase</asp:ListItem>
                                    <asp:ListItem>Virtual</asp:ListItem>
                                    <asp:ListItem>Presencial</asp:ListItem>
                                       
                                </asp:DropDownList>
                                <asp:TextBox ID="txt_link_clase" CssClass ="form-control mt-1 " placeholder="Link del Curso en la Plataforma Moodle" runat="server" Visible="False"></asp:TextBox>
                                     <asp:DropDownList ID="ddl_bloque" runat="server" CssClass="form-control  btn btn-outline-info dropdown-toggle mt-1" DataSourceID="sql_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AutoPostBack="True" Visible="False">
                    </asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="sql_bloque" ConnectionString='<%$ ConnectionStrings:unitepc_boliviaConnectionString %>' SelectCommand="SELECT * FROM [tb_bloques] where id_sede=@sede" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                                    </SelectParameters>
                    </asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_aula" runat="server" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1" DataSourceID="sql_ds_aula" DataTextField="nom_aula_lab" DataValueField="id_nomal" Visible="False"></asp:DropDownList>
                                <asp:SqlDataSource runat="server" ID="sql_ds_aula" ConnectionString='<%$ ConnectionStrings:unitepc_boliviaConnectionString %>' SelectCommand="SELECT * FROM [tb_aula] where bloque=@bloque" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                 </asp:SqlDataSource>

                                 <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Seleccione el Grupo
                            </div>

                                  <asp:DropDownList ID="ddl_grupo" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1"  runat="server" AutoPostBack="True">
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
                 
                  
                           <asp:DropDownList ID="ddl_grupol" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1"  runat="server" AutoPostBack="True">
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
 
                 <asp:TextBox ID="txt_grupos" CssClass ="form-control mt-1" runat="server" Visible="true"></asp:TextBox>

                            
                           
                                    

                                       
                         
                                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary mt-1  form-control " Text="Registrar Clase" />
                                   
         </div>                      
   
                                        <div class="col-md-8 p-3 mb-2 bg-white text-white border border-dark rounded ">
                                               <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Programar Clase
                         
                            </div>


                                           <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                               <ContentTemplate>
                                                   <asp:Button ID="Button3" CssClass="btn btn-primary mt-1 form-control " runat="server" Text="Actualizar Lista" />
                                                   <asp:DropDownList ID="ddl_clases_prog" runat="server" AppendDataBoundItems="True" AutoPostBack="True" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1" DataSourceID="sql_ds_clases_prog" DataTextField="Column1" DataValueField="id_horario">
                                                       <asp:ListItem Value="0">Seleccione una Clase Programada</asp:ListItem>
                                                   </asp:DropDownList>
                                              

                                           <asp:SqlDataSource ID="sql_ds_clases_prog" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="
	  select th.id_horario ,(tp.nombres +' '+tp.primerApellido +' '+tp.segundoApellido+'---&gt; Dia:'+th.dia +'---&gt;Tipo de Clase: '+ th.tipo_clase+'---&gt;Horas:'+th.hora_inicio +' a '+th.hora_fin  ) from tb_horario th
	  inner join  tb_personal tp on th.ci_doc = tp.ci 
	  where ci_usuario =@ciusu and designado='No'" UpdateCommand="UPDATE tb_horario SET designado = 'Si' WHERE (id_horario = @id_horario)">
                                               <SelectParameters>
                                                   <asp:ControlParameter ControlID="txt_ciusuario" Name="ciusu" PropertyName="Text" />
                                               </SelectParameters>
                                               <UpdateParameters>
                                                   <asp:ControlParameter ControlID="ddl_clases_prog" Name="id_horario" PropertyName="SelectedValue" />
                                               </UpdateParameters>
                                           </asp:SqlDataSource>
                                          
                                           <asp:GridView ID="gv_horarioscreados" runat="server" CssClass="table table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_horacreada" Font-Size="9pt">
                                               <Columns>
                                                   <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                                   <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                                   <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                                   <asp:BoundField DataField="nombre_clase" HeaderText="nombre_clase" SortExpression="nombre_clase" visible="false" />
                                                   
                                                   <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                                   <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                                   <asp:BoundField DataField="Hra_academica" HeaderText="Hra_academica" SortExpression="Hra_academica" ReadOnly="True" />
                                                   <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" Visible="false" />
                                                   <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                                   
                                                   <asp:BoundField DataField="link_clase" HeaderText="link_clase" SortExpression="link_clase" />
                                                   <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" Visible ="false"  />
                                                   <asp:BoundField DataField="aula" HeaderText="aula" SortExpression="aula"  Visible ="false" />
                                                   
                                               </Columns>
                                           </asp:GridView>
                                                   
                                               <asp:SqlDataSource ID="sql_ds_horacreada" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_horario, nombre_clase, DATEDIFF(SS, hora_inicio, hora_fin) / 60 / 45 AS Hra_academica, hora_inicio, hora_fin, ci_doc, grupo, dia, link_clase, bloque, aula, tipo_clase FROM tb_horario WHERE (id_horario = @idhorario)">
                                                   <SelectParameters>
                                                       <asp:ControlParameter ControlID="ddl_clases_prog" Name="idhorario" PropertyName="SelectedValue" />
                                                   </SelectParameters>
                                           </asp:SqlDataSource>
                                           
 </ContentTemplate>
                                           </asp:UpdatePanel>
                                               <asp:DropDownList ID="ddl_ant_nuevo" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Saleccione el Tipo de Plan</asp:ListItem>
                                    <asp:ListItem Value="A">Plan Antiguo</asp:ListItem>
                                    <asp:ListItem Value="N">Plan Nuevo</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddl_materias" runat="server" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1" AutoPostBack="True" DataSourceID="sql_ds_materias" DataTextField="Materia" DataValueField="id_plan"></asp:DropDownList>
                                         
                                           <asp:SqlDataSource ID="sql_ds_materias" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [planes_estudios] WHERE (([Sede_id] = @Sede_id) AND ([codcar] = @codcar) AND ([Sis_plan] = @Sis_plan))">
                                               <SelectParameters>
                                                   <asp:ControlParameter ControlID="txt_id_sede" Name="Sede_id" PropertyName="Text" Type="Int32" />
                                                   <asp:ControlParameter ControlID="txt_sigla_carrera" Name="codcar" PropertyName="Text" Type="String" />
                                                   <asp:ControlParameter ControlID="ddl_ant_nuevo" Name="Sis_plan" PropertyName="SelectedValue" Type="String" />
                                               </SelectParameters>
                                           </asp:SqlDataSource>
                                           <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover mt-1 " AutoGenerateColumns="False" DataKeyNames="id_plan" DataSourceID="sql_materia_selec">
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
            </div>
         </div>
            <asp:TextBox ID="txt_sede" runat="server" Visible="False"></asp:TextBox>
             <asp:TextBox ID="txt_hora_ini" runat="server" Visible="false" ></asp:TextBox>
      <asp:TextBox ID="txt_hrafin" runat="server" Visible="false"></asp:TextBox>
           <asp:TextBox ID="txt_sigla_carrera" runat="server" Visible="False"></asp:TextBox>
           
           <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_horario(gestion, tipo_clase, hora_inicio, hora_fin, ci_doc, grupo, dia, link_clase, bloque, aula, fecha_registro, ci_usuario, sede, designado) VALUES ('1-2022', @tipoclase, @hini, @hrfin, @cidocente, @grupo, @dia, @linkclase, @bloque, @aula, GETDATE(), @ciusuario, @sede, 'No')" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
               <InsertParameters>
                   <asp:ControlParameter ControlID="ddl_tipo_clase" Name="tipoclase" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="txt_hora_ini" Name="hini" PropertyName="Text" />
                   <asp:ControlParameter ControlID="txt_hrafin" Name="hrfin" PropertyName="Text" />
                   <asp:ControlParameter Name="cidocente" ControlID="ddl_docente" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="txt_grupos" Name="grupo" PropertyName="Text" />
                   <asp:ControlParameter ControlID="ddl_dia" Name="dia" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="txt_link_clase" Name="linkclase" PropertyName="Text" />
                   <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="ddl_aula" Name="aula" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="txt_ciusuario" Name="ciusuario" PropertyName="Text" />
                   <asp:ControlParameter ControlID="txt_id_sede" Name="sede" PropertyName="Text" />
               </InsertParameters>
           </asp:SqlDataSource>
           <asp:SqlDataSource ID="sql_ds_designacion" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_designacion(id_horario, id_materia, fecha_creacion, id_sede, plan_est) VALUES (@idhorario, @id_materia, GETDATE(), @id_sede, @plan )" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
               <InsertParameters>
                   <asp:ControlParameter ControlID="ddl_clases_prog" Name="idhorario" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="ddl_materias" Name="id_materia" PropertyName="SelectedValue" />
                   <asp:ControlParameter ControlID="txt_id_sede" Name="id_sede" PropertyName="Text" />
                   <asp:ControlParameter ControlID="ddl_ant_nuevo" Name="plan" PropertyName="SelectedValue" />
               </InsertParameters>
           </asp:SqlDataSource>
           <asp:TextBox ID="txt_ciusuario" runat="server" Visible="False"></asp:TextBox>
           <asp:TextBox ID="txt_dia" runat="server" Visible="False"></asp:TextBox>
           <asp:TextBox ID="txt_id_sede" runat="server" Visible="False"></asp:TextBox>

          


           </form>
</asp:Content>


