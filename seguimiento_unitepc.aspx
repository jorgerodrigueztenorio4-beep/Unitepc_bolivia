<%@ Page Language="VB" AutoEventWireup="false" CodeFile="seguimiento_unitepc.aspx.vb" Inherits="seguimiento_unitepc" MasterPageFile="mp_cbba.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
   
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-8">
            <!-- general form elements -->
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Datos de la Materia a Registrar su Ingreso (Ingrese el Nro. de C.I.)</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                     
                                <asp:TextBox ID="TextBox1" placeholder="Ingrese Su nro de C.I." CssClass ="form-control " runat="server" AutoPostBack="False" Font-Bold="True" Font-Size="15pt"></asp:TextBox>
                                <asp:Button ID="Button2" runat="server" CssClass="form-control btn btn-primary mt-2" Text="Buscar Clase" />
                                <asp:Label ID="lbl_ip" CssClass ="form-control mt-1" runat="server" BackColor="#BAB1C2" Font-Bold="True" Font-Size="14pt" Visible="False"></asp:Label>
                                
                                     <div class="alert-warning mt-2 text-md-center  rounded " role="alert">
                                      <asp:Label ID="Label3" runat="server" Text="Informacion de la Materia a Ingresar" Visible="false" ></asp:Label>
                            </div> 
                                <asp:GridView ID="GridView1"  runat="server" CssClass ="table table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_horario"  Font-Size="9pt" Font-Names="Consolas">
                                    <Columns>
                                        <asp:BoundField DataField="id_ing_sal" HeaderText="id_ing_sal" SortExpression="id_ing_sal" InsertVisible="False" ReadOnly="True" Visible ="true"  />
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc"/>
                                        <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso"  Visible ="false" />
                                        <asp:BoundField DataField="hr_salida" HeaderText="hr_salida" SortExpression="hr_salida"  Visible ="false" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="tema_avance" HeaderText="tema_avance" SortExpression="tema_avance"  Visible ="false" />
                                        <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones"  Visible ="false" />
                                        <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                                        <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
                                        <asp:BoundField DataField="aula_o_lab" HeaderText="aula_o_lab" SortExpression="aula_o_lab" />
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" SortExpression="id_horario"  Visible ="false" />
                                        <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede"  Visible ="false" />
                                        <asp:BoundField DataField="sigla_materia" HeaderText="sigla_materia" SortExpression="sigla_materia" />
                                        <asp:BoundField DataField="cant_est" HeaderText="cant_est" SortExpression="cant_est"  Visible ="false" />
                                        <asp:BoundField DataField="ip_marcado" HeaderText="ip_marcado" SortExpression="ip_marcado"  Visible ="false" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="hra_inicio" HeaderText="hra_inicio" SortExpression="hra_inicio" />
                                        <asp:BoundField DataField="hra_fin" HeaderText="hra_fin" SortExpression="hra_fin" />
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion"  Visible ="false" />
                                        <asp:BoundField DataField="horas" HeaderText="horas" SortExpression="horas"  Visible ="false" />
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" Font-Size="8pt" HorizontalAlign="Center" BackColor="#217346" ForeColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select * from tb_ing_sal tp
where tp.ci_doc =@ci
and tp.gestion='1-2026'  and (tp.hr_ingreso is null or tp.hr_salida is null )  and tp.gestion ='1-2026'
 AND tp.dia =(SELECT (CASE DATENAME(dw,getdate())
 when 'Monday' then 'Lunes'
 when 'Tuesday' then 'Martes'
 when 'Wednesday' then 'Miercoles'
 when 'Thursday' then 'Jueves'
 when 'Friday' then 'Viernes'
 when 'Saturday' then 'Sabado'
 when 'Domingo' then 'Domingo'
END))  
and  CONVERT (time, SYSDATETIME(),114)&gt;=  dateadd(MINUTE, -10, CONVERT(time,convert(time,tp.hra_inicio,114)))
and CONVERT (time, SYSDATETIME(),114)&lt;= dateadd(MINUTE, +30, CONVERT(time,convert(time,tp.hra_inicio,114))) 
" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextBox1" Name="ci" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                    <div class="bg-warning disabled color-palette" style="font-family: Consolas; font-weight: bold; color: #000000"><span><asp:Label ID="Label1" runat="server" Text="Clase con Registro de ingreso pero sin registro de salida, debe registrar Su Salida para marcar otra vez un nuevo Ingreso" Visible="False" Font-Bold="True" Font-Size="14pt"></asp:Label></span></div>
                   <asp:GridView ID="GridView2" runat="server" CssClass ="table table-hover mt-2 " AutoGenerateColumns="False" DataSourceID="sql_ing_sal" Font-Size="10pt" Font-Names="Consolas">
         <Columns>
             <asp:BoundField DataField="id_ing_sal" HeaderText="id_ing_sal" InsertVisible="False" ReadOnly="True" SortExpression="id_ing_sal" Visible="true" />
             <asp:BoundField DataField="ci_doc" HeaderText="Nro de C.I." SortExpression="ci_doc" />
             <asp:BoundField DataField="hr_ingreso" HeaderText="fecha y Hora de Ingreso" SortExpression="hr_ingreso" />
             <asp:BoundField DataField="hr_salida" HeaderText="Fecha y Hora de Salida" SortExpression="hr_salida" />
             <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
             <asp:BoundField DataField="tema_avance" HeaderText="tema Avanzado" SortExpression="tema_avance" />
             <asp:BoundField DataField="observaciones" HeaderText="Observaciones" SortExpression="observaciones" />
             <asp:BoundField DataField="carrera" HeaderText="Carrera" SortExpression="carrera" />
             <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" Visible="False" />
             <asp:BoundField DataField="aula_o_lab" HeaderText="aula_o_lab" SortExpression="aula_o_lab" Visible="False" />
             <asp:BoundField DataField="id_horario" HeaderText="id_horario" SortExpression="id_horario" Visible="true" />
             <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" Visible="False" />
             <asp:BoundField DataField="sigla_materia" HeaderText="Sigla de la Materia" SortExpression="sigla_materia" />
         </Columns>
                       <HeaderStyle BackColor="#217346" ForeColor="White" />
     </asp:GridView>
                   <asp:SqlDataSource ID="sql_ing_sal" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_ing_sal(hr_ingreso, ip_marcado) VALUES (GETDATE(), @ip)" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>" SelectCommand="SELECT id_ing_sal, ci_doc, hr_ingreso, hr_salida, Materia, tema_avance, observaciones, carrera, bloque, aula_o_lab, id_horario, sede, sigla_materia, cant_est, ip_marcado, tipo_clase, hra_inicio, hra_fin, grupo, dia, gestion, horas FROM tb_ing_sal WHERE (ci_doc = @ci) AND (hr_salida IS NULL) AND (hr_ingreso is not null)" UpdateCommand="UPDATE tb_ing_sal SET hr_ingreso = GETDATE() WHERE (id_ing_sal = @id_ingsal)">
                                <InsertParameters>
                                    
                                    <asp:ControlParameter ControlID="txt_ip" Name="ip" PropertyName="Text" />
                                    
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ci" PropertyName="Text" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="txt_idhor" Name="id_ingsal" PropertyName="Text" />
                                </UpdateParameters>
     </asp:SqlDataSource>

                  </div>
                              
                
                <!-- /.card-body -->

           
            </div>
            <!-- /.card -->

            <!-- general form elements -->
            
            <!-- /.card -->

            <!-- Input addon -->
            
            <!-- /.card -->
            <!-- Horizontal Form -->
            
            <!-- /.card -->

          </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-4">
            <!-- Form Element sizes -->
            <div class="card card-teal">
              <div class="card-header">
                <h3 class="card-title">Datos para el Registro de Salida</h3>
              </div>
              <div class="card-body">

                     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional"> 
    <Triggers>
        <asp:AsyncPostBackTrigger  ControlID="Timer1" EventName="Tick" />
    </Triggers>
    <ContentTemplate> 
       <asp:GridView runat="server" CssClass ="table table-hover " AutoGenerateColumns="False" DataSourceID="sql_ds_reloh" ID="gvreloj" Font-Bold="True" Font-Names="Consolas" Font-Size="11pt" GridLines="None" ForeColor="Black">
     <Columns>
         <asp:BoundField DataField="Hora" HeaderText="Hora del Servidor" ReadOnly="True" SortExpression="Hora" >
         <HeaderStyle BorderStyle="None" HorizontalAlign="Center" VerticalAlign="Middle" />
         <ItemStyle Font-Size="16pt" HorizontalAlign="Center" />
         </asp:BoundField>
     </Columns>
           <HeaderStyle BackColor="#20C997" ForeColor="White" Font-Size="14pt" HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="sql_ds_reloh" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT convert(char(8), GETDATE(), 108)as Hora "></asp:SqlDataSource>
    
    </ContentTemplate> 
</asp:UpdatePanel> 
            <asp:Timer ID="Timer1" runat="server" Interval="500"></asp:Timer>

                   
                    <asp:Button ID="Button1" runat="server" Text="Registrar Ingreso" CssClass="btn form-control   btn-outline-primary mt-4 
                       " Visible="False" Font-Size="20pt" Height="100px" />

                  
                   <asp:TextBox ID="txt_tema_avance" CssClass="form-control mt-2 " required placeholder="Tema de Avance" runat="server" Visible="False"></asp:TextBox>
                   <asp:TextBox ID="txt_observacines" CssClass="form-control mt-2 " placeholder="Observaciones" runat="server" Visible="False"></asp:TextBox>
                   <asp:DropDownList ID="ddl_cantest" CssClass =" form-control  btn btn-success  dropdown-toggle mt-2" runat="server" Visible="false">
                       <asp:ListItem>Cantidad de Estudiantes</asp:ListItem>
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
        <asp:ListItem>60</asp:ListItem>
        <asp:ListItem>61</asp:ListItem>
        <asp:ListItem>62</asp:ListItem>
        <asp:ListItem>63</asp:ListItem>
        <asp:ListItem>64</asp:ListItem>
        <asp:ListItem>65</asp:ListItem>
        <asp:ListItem>66</asp:ListItem>
        <asp:ListItem>67</asp:ListItem>
        <asp:ListItem>68</asp:ListItem>
        <asp:ListItem>69</asp:ListItem>
        <asp:ListItem>70</asp:ListItem>
                   </asp:DropDownList>

                    <asp:Button ID="Button3" runat="server" Text="Registrar Salida" CssClass="btn  btn-danger mt-4  form-control" Visible="False" Font-Size="20pt" Height="60 px" />






              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            
            <!-- /.card -->

            <!-- general form elements disabled -->
            
            <!-- /.card -->
            <!-- general form elements disabled -->
            
            <!-- /.card -->
          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
          <div class="row">
          <!-- left column -->
          <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Horario del Docente</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
           
                <div class="card-body">
                       <asp:GridView ID="gv_horario" CssClass="table table-hover  " runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Size="9pt" Font-Names="Consolas">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" Visible ="false"  />
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc"  Visible ="false" />
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" >
                                        <ItemStyle BackColor="#FFFFEA" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Hras_academica" ReadOnly="True" SortExpression="Hras_academica"  Visible ="false" />
                                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" >
                                        <ItemStyle BackColor="#D1E9E9" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="link" HeaderText="link" ReadOnly="True" SortExpression="link"  Visible ="false" />
                                        <asp:BoundField DataField="Aula" HeaderText="Aula" ReadOnly="True" SortExpression="Aula" />
                                        <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion"  Visible ="false" />
                                        <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP"  Visible ="false" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan"  Visible ="false" />
                                    </Columns>
                                    <HeaderStyle BackColor="#217346" ForeColor="White" HorizontalAlign="Center" />
                                 </asp:GridView>
                                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente, th.hora_inicio ,th.hora_fin,th.grupo,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.dia,th.tipo_clase ,isnull(link_clase,'Sin Link') as link,isnull(a.nom_aula_lab,' ') as Aula ,td.fecha_creacion ,p.SiglaP,p.Materia,p.Sis_plan
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan 
left join tb_aula a on th.aula = a.id_nomal 
where th.ci_doc =@ci  and th.gestion='1-2026' and tp.gestion='1-2026' and a.gestion='1-2024'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END">
                                     <SelectParameters>
                                         <asp:ControlParameter ControlID="TextBox1" Name="ci" PropertyName="Text" />
                                     </SelectParameters>
                                 </asp:SqlDataSource> 
                              
                </div>
                <!-- /.card-body -->

         
            </div>
            <!-- /.card -->

            <!-- general form elements -->
            
            <!-- /.card -->

            <!-- Input addon -->
            
            <!-- /.card -->
            <!-- Horizontal Form -->
            
            <!-- /.card -->

          </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-6">
            <!-- Form Element sizes -->
            <div class="card card-teal">
              <div class="card-header">
                <h3 class="card-title">Avisos</h3>
              </div>
              <div class="card-body">
                
                    <div class="callout callout-danger">
                  

                        <asp:Label ID="lbl_avisos" runat="server" Text="Label" Visible ="false" ></asp:Label>
                </div>






              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            
            <!-- /.card -->

            <!-- general form elements disabled -->
            
            <!-- /.card -->
            <!-- general form elements disabled -->
            
            <!-- /.card -->
          </div>
          <!--/.col (right) -->
        </div>
      </div><!-- /.container-fluid -->
    </section>






























    <asp:GridView ID="gv_horario2" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario2" Font-Size="9pt" Visible="False">
        <Columns>
            <asp:BoundField DataField="id_ing_sal" HeaderText="id_ing_sal" InsertVisible="False" ReadOnly="True" SortExpression="id_ing_sal" />
            <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
            <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso" />
            <asp:BoundField DataField="hr_salida" HeaderText="hr_salida" SortExpression="hr_salida" />
            <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
            <asp:BoundField DataField="tema_avance" HeaderText="tema_avance" SortExpression="tema_avance" />
            <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" />
            <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
            <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
            <asp:BoundField DataField="aula_o_lab" HeaderText="aula_o_lab" SortExpression="aula_o_lab" />
            <asp:BoundField DataField="id_horario" HeaderText="id_horario" SortExpression="id_horario" />
            <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
            <asp:BoundField DataField="sigla_materia" HeaderText="sigla_materia" SortExpression="sigla_materia" />
            <asp:BoundField DataField="cant_est" HeaderText="cant_est" SortExpression="cant_est" />
            <asp:BoundField DataField="ip_marcado" HeaderText="ip_marcado" SortExpression="ip_marcado" />
            <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
            <asp:BoundField DataField="hra_inicio" HeaderText="hra_inicio" SortExpression="hra_inicio" />
            <asp:BoundField DataField="hra_fin" HeaderText="hra_fin" SortExpression="hra_fin" />
            <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
            <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
            <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
            <asp:BoundField DataField="horas" HeaderText="horas" SortExpression="horas" />
        </Columns>
     </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_horario2" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select * from tb_ing_sal tp
where tp.ci_doc =@ci
and tp.gestion='1-2026' 
 AND tp.dia =(SELECT (CASE DATENAME(dw,getdate())
    when 'Lunes' then 'Lunes'
     when 'Martes' then 'Martes'
     when 'Miércoles' then 'Miercoles'
     when 'Jueves' then 'Jueves'
     when 'Viernes' then 'Viernes'
     when 'Sábado' then 'Sabado'
     when 'Domingo' then 'Domingo'
END))  
and  CONVERT (time, SYSDATETIME(),114)&gt;=  dateadd(MINUTE, -10, CONVERT(time,convert(time,tp.hra_inicio,114)))
and CONVERT (time, SYSDATETIME(),114)&lt;= dateadd(MINUTE, +30, CONVERT(time,convert(time,tp.hra_inicio,114))) 
and hr_ingreso is null
" InsertCommand="INSERT INTO tb_intento_marcado(nro_ci, fecha_intento, accion) VALUES (@ci, getdate(), 'Salida')">
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="TextBox1" Name="ci" PropertyName="Text" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextBox1" Name="ci" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>




                            <asp:SqlDataSource ID="sql_ds_respuesta" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select hra_inicio ,hra_fin ,id_ing_sal ,convert(varchar,getdate(),103) from tb_ing_sal 
where convert(time,getdate() )&gt;hra_fin and id_ing_sal =@id_ingsal" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txt_id_ingsal" Name="id_ingsal" PropertyName="Text" />
                                </SelectParameters>
     </asp:SqlDataSource>
                          
   
                            <asp:SqlDataSource ID="sql_ing_sal0" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_ing_sal(hr_ingreso, ip_marcado) VALUES (@horaingreso, @ip)" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>" SelectCommand="select * from [tb_ing_sal]
where ci_doc =@ci and hr_salida is null
" UpdateCommand="UPDATE tb_ing_sal SET hr_ingreso = @hraingreso, ip_marcado = @ip WHERE (id_ing_sal = @ingresosalida)">
                                <InsertParameters>
                                    
                                    <asp:ControlParameter ControlID="txt_armadofecha" Name="horaingreso" PropertyName="Text" Type="DateTime" />
                                    
                                    <asp:ControlParameter ControlID="txt_ip" Name="ip" PropertyName="Text" />
                                    
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ci" PropertyName="Text" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="txt_armadofecha" Name="hraingreso" PropertyName="Text" Type="DateTime" />
                                    <asp:ControlParameter ControlID="txt_idhor" Name="ingresosalida" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_ip" Name="ip" PropertyName="Text" />
                                </UpdateParameters>
     </asp:SqlDataSource>
   
     <asp:TextBox ID="txt_id_hor" runat="server" Visible="False"></asp:TextBox>
   
     <br />
                            <asp:SqlDataSource ID="sql_salida" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_ing_sal(hr_salida, tema_avance, observaciones, cant_est) VALUES (GETDATE(), @temaavance, @obs, @cantest)" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>" SelectCommand="select * from tb_ing_sal 
where ci_doc =@ci and hr_salida is null
" UpdateCommand="UPDATE tb_ing_sal SET tema_avance = @temavance, cant_est = @cantest, hr_salida = GETDATE(), observaciones = @obs WHERE (id_ing_sal = @idhor)">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="txt_tema_avance" Name="temaavance" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_observacines" Name="obs" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="ddl_cantest" Name="cantest" PropertyName="SelectedValue" />
                                    
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ci" PropertyName="Text" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="txt_tema_avance" Name="temavance" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="ddl_cantest" Name="cantest" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txt_observacines" Name="obs" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_id_hor" Name="idhor" PropertyName="Text" />
                                </UpdateParameters>
     </asp:SqlDataSource>
   
                            <asp:SqlDataSource ID="sql_salida0" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_ing_sal(hr_salida, tema_avance, observaciones, cant_est) VALUES (GETDATE(), @temaavance, @obs, @cantest)" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>" SelectCommand="select * from tb_ing_sal 
where ci_doc =@ci and hr_salida is null
" UpdateCommand="UPDATE tb_ing_sal SET tema_avance = @temavance, cant_est = @cantest, hr_salida = @hrasalida, observaciones = @obs WHERE (id_ing_sal = @idhor)">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="txt_tema_avance" Name="temaavance" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_observacines" Name="obs" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="ddl_cantest" Name="cantest" PropertyName="SelectedValue" />
                                    
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ci" PropertyName="Text" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="txt_tema_avance" Name="temavance" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="ddl_cantest" Name="cantest" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txt_observacines" Name="obs" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_armadofecha" Name="hrasalida" PropertyName="Text" Type="DateTime" />
                                    <asp:ControlParameter ControlID="txt_id_hor" Name="idhor" PropertyName="Text" />
                                </UpdateParameters>
     </asp:SqlDataSource>
   
    <asp:TextBox ID="txt_ci" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="txt_materia" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="txt_crrera" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="txt_idhor" runat="server" Visible ="false"></asp:TextBox>
    <asp:TextBox ID="txt_id_aula" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="txt_bloque" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="txt_siglamat" runat="server" Visible="False"></asp:TextBox>
       <asp:TextBox ID="txt_id_ingsal" runat="server" Visible="False"></asp:TextBox>

                            <asp:TextBox ID="txt_armadofecha" runat="server" Visible="False"></asp:TextBox>
   
                            <asp:TextBox ID="txt_id_horario" runat="server" Visible="False"></asp:TextBox>
   

                            <br />
     <asp:SqlDataSource ID="sql_horaingreso" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand=" SELECT  CONVERT(char(8), getdate(), 108) AS FECHA,format(getdate(),'d/MM/y')  " InsertCommand="INSERT INTO tb_intento_marcado(nro_ci, fecha_intento, accion) VALUES (@ci, GETDATE(), 'Intento Marcar')">
         <InsertParameters>
             <asp:ControlParameter ControlID="TextBox1" Name="ci" PropertyName="Text" />
         </InsertParameters>
    </asp:SqlDataSource>
    <asp:TextBox ID="txt_ip"  runat="server" Visible="False"></asp:TextBox>

                            


                            </asp:Content>


