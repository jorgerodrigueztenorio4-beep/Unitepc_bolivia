<%@ Page Language="VB" AutoEventWireup="false" CodeFile="seguimiento_guayara1.aspx.vb" Inherits="seguimiento_guayara" MasterPageFile="mp_guayara.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
   

     <div class="alert alert-success mt-1 text-md-center text-bold  " role="alert">
    <h3>Seguimiento Docente Guayaramerin</h3>
        </div> 
     <div class=" container-fluid">
    	<div class="row">
             

                            <div class="col-md-8 p-3 mb-1   text-black border border-dark rounded  ">
                             
                                 <div class="alert-warning text-md-center  rounded  " role="alert">
                       <h3></h3>Ingrese Su Nro de C.I.
                            </div> 
                                <asp:TextBox ID="TextBox1" placeholder="Ingrese Su nro de C.I." CssClass ="form-control mt-2 " runat="server" AutoPostBack="False" Font-Bold="True" Font-Size="15pt"></asp:TextBox>
                                <asp:Button ID="Button2" runat="server" CssClass="form-control btn btn-primary mt-2" Text="Buscar Clase" />
                                
                                     <div class="alert-warning mt-2 text-md-center  rounded " role="alert">
                                      <asp:Label ID="Label3" runat="server" Text="Informacion de su Materia" Visible="false" ></asp:Label>
                            </div> 
                                <asp:GridView ID="GridView1"  runat="server" CssClass ="table table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_horario"  Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" SortExpression="id_horario" InsertVisible="False" ReadOnly="True" Visible="false" />
                                        <asp:BoundField DataField="id_designacion" HeaderText="id_designacion" SortExpression="id_designacion" InsertVisible="False" ReadOnly="True" Visible="false"/>
                                        <asp:BoundField DataField="Docente" HeaderText="Docente" SortExpression="Docente" ReadOnly="True" />
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="nom_aula_lab" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="CARDES" HeaderText="CARDES" SortExpression="CARDES" />
                                        <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" Font-Size="8pt" HorizontalAlign="Center" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,td.id_designacion ,(tp.nombres ++tp.primerApellido ++tp.segundoApellido ) as Docente,th.dia ,ta.nom_aula_lab ,th.hora_inicio ,th.hora_fin,p.Materia ,tc.CARDES ,p.SiglaP,th.grupo    from tb_designacion td
join tb_horario th on td.id_horario = th.id_horario 
join tb_aula ta on th.aula = ta.id_nomal
join tb_personal tp on th.ci_doc = tp.ci 
join planes_estudios p on td.id_materia = p.id_plan
join tb_carreras tc on p.codcar = tc.CARSIGLA
where tp.ci =@ci
and th.gestion='2-2023' and tp.gestion='2-2023'  and ta.gestion='2-2023'
and CONVERT (time, SYSDATETIME(),114)&gt;= dateadd(MINUTE, -5, CONVERT(time,convert(time,th.hora_inicio,114)))
and CONVERT (time, SYSDATETIME(),114)&lt;= dateadd(MINUTE, +45, CONVERT(time,convert(time,th.hora_inicio,114))) 
and th.sede ='12' 
             AND th.dia =(SELECT (CASE DATENAME(dw,getdate())
    when 'Lunes' then 'Lunes'
     when 'Martes' then 'Martes'
     when 'Miércoles' then 'Miercoles'
     when 'Jueves' then 'Jueves'
     when 'Viernes' then 'Viernes'
     when 'Sábado' then 'Sabado'
     when 'Domingo' then 'Domingo'
END))                        
" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextBox1" Name="ci" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
               <div class="col-md-4 p-3 mb-1 text-black border border-dark rounded text-center ">

                    <div class="alert-warning text-md-center  rounded " role="alert">
                       <asp:Label ID="Label2" runat="server" Text="Presione el Boton 'Registrar Ingreso' si ingresara a clases" Visible="false"></asp:Label>
                            </div> 
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

                    <asp:Button ID="Button3" runat="server" Text="Registrar Salida" CssClass="btn  btn-outline-danger mt-4 
                       " Visible="False" Font-Size="20pt" />

                         
   
                            </div>
            </div>

         <div class="row">
             <div class="col-md-12 p-3 mb-1   text-black border border-dark rounded  text-center ">
                   <div class="alert-warning text-md-center  rounded " role="alert">
                       <asp:Label ID="Label1" runat="server" Text="Informacion de Marcado al Ingresar" Visible="false"></asp:Label>
                            </div> 


                   <asp:GridView ID="GridView2" runat="server" CssClass ="table table-hover mt-2 " AutoGenerateColumns="False" DataSourceID="sql_ing_sal" Font-Size="10pt">
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
     </asp:GridView>
             </div>
             
         </div>


         </div>

    <asp:GridView ID="gv_horario2" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario2" Visible="False">
        <Columns>
            <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
            <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
            <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
            <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
            <asp:BoundField DataField="aula" HeaderText="aula" SortExpression="aula" />
            <asp:BoundField DataField="CARSIGLA" HeaderText="CARSIGLA" SortExpression="CARSIGLA" />
            <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
            <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
            <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
            <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
            <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
            <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
            <asp:BoundField DataField="Docente" HeaderText="Docente" SortExpression="Docente" ReadOnly="True" />
            <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
            <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
            <asp:BoundField DataField="id_designacion" HeaderText="id_designacion" InsertVisible="False" ReadOnly="True" SortExpression="id_designacion" />
        </Columns>
     </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_horario2" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT th.id_horario, th.gestion, th.sede, th.bloque, th.aula, tc.CARSIGLA, th.dia, th.hora_inicio, th.hora_fin, p.SiglaP, p.Materia, th.ci_doc, tp.nombres + + tp.primerApellido + + tp.segundoApellido AS Docente, th.grupo, th.tipo_clase, td.id_designacion FROM tb_designacion AS td INNER JOIN tb_horario AS th ON td.id_horario = th.id_horario INNER JOIN tb_aula AS ta ON th.aula = ta.id_nomal INNER JOIN tb_personal AS tp ON th.ci_doc = tp.ci INNER JOIN planes_estudios AS p ON td.id_materia = p.id_plan INNER JOIN tb_carreras AS tc ON p.codcar = tc.CARSIGLA
 WHERE 
(th.ci_doc =@ci) AND (th.gestion = '2-2023') AND (th.sede = '12') and tp.gestion='2-2023'  and ta.gestion='2-2023'
AND (CONVERT (time, SYSDATETIME(), 114) &gt;= DATEADD(MINUTE, - 5, CONVERT (time, CONVERT (time, th.hora_inicio, 114)))) 
 AND (CONVERT (time, SYSDATETIME(), 114) &lt;= DATEADD(MINUTE, 45, CONVERT (time, CONVERT (time, th.hora_inicio, 114)))) 
 AND th.dia =(SELECT (CASE DATENAME(dw,getdate())
    when 'Lunes' then 'Lunes'
     when 'Martes' then 'Martes'
     when 'Miércoles' then 'Miercoles'
     when 'Jueves' then 'Jueves'
     when 'Viernes' then 'Viernes'
     when 'Sábado' then 'Sabado'
     when 'Domingo' then 'Domingo'
END))
">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="TextBox1" Name="ci" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>




                            <asp:GridView ID="gv_respuesta" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_respuesta" Visible="False">
                                <Columns>
                                    <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                    <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                    <asp:BoundField DataField="id_horario" HeaderText="id_horario" SortExpression="id_horario" />
                                    <asp:BoundField DataField="Column1" DataFormatString="{0:d}" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                                </Columns>
     </asp:GridView>
                            <asp:SqlDataSource ID="sql_ds_respuesta" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT tb_horario.hora_inicio ,tb_horario.hora_fin ,tb_ing_sal .id_horario ,getdate() 
 From tb_horario
 CROSS JOIN tb_ing_sal
WHERE tb_horario .id_horario = @id_hor and tb_ing_sal.id_ing_sal =@id_ingsal  and convert(time,getdate() )&gt;tb_horario.hora_fin" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txt_id_horario" Name="id_hor" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_id_ingsal" Name="id_ingsal" PropertyName="Text" />
                                </SelectParameters>
     </asp:SqlDataSource>
                            <asp:SqlDataSource ID="sql_ing_sal" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_ing_sal(ci_doc, hr_ingreso, Materia, carrera, sede, id_horario, aula_o_lab, bloque, sigla_materia, ip_marcado) VALUES (@ci, GETDATE(), @materia, @carrera, '12', @idhorario, @aula, @bloque, @siglamat, @ip)" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>" SelectCommand="select * from [tb_ing_sal]
where ci_doc =@ci and hr_salida is null
">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_materia" Name="materia" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_crrera" Name="carrera" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_idhor" Name="idhorario" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_id_aula" Name="aula" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_bloque" Name="bloque" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_siglamat" Name="siglamat" PropertyName="Text" />
                                    
                                    <asp:Parameter Name="ip" />
                                    
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ci" PropertyName="Text" />
                                </SelectParameters>
     </asp:SqlDataSource>
   
                            <asp:SqlDataSource ID="sql_ing_sal0" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_ing_sal(ci_doc, hr_ingreso, Materia, carrera, sede, id_horario, aula_o_lab, bloque, sigla_materia) VALUES (@ci,@horaingreso, @materia, @carrera, '12', @idhorario, @aula, @bloque, @siglamat)" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>" SelectCommand="select * from [tb_ing_sal]
where ci_doc =@ci and hr_salida is null
">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_materia" Name="materia" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_crrera" Name="carrera" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_idhor" Name="idhorario" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_id_aula" Name="aula" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_bloque" Name="bloque" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_siglamat" Name="siglamat" PropertyName="Text" />
                                    
                                    <asp:ControlParameter ControlID="txt_armadofecha" Name="horaingreso" PropertyName="Text" Type="DateTime" />
                                    
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="TextBox1" Name="ci" PropertyName="Text" />
                                </SelectParameters>
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
                                    <asp:ControlParameter ControlID="txt_id_hor" Name="idhor" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_armadofecha" Name="hrasalida" PropertyName="Text" Type="DateTime" />
                                </UpdateParameters>
     </asp:SqlDataSource>
   
    <asp:TextBox ID="txt_ci" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="txt_materia" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="txt_crrera" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="txt_idhor" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="txt_id_aula" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="txt_bloque" runat="server" Visible="False"></asp:TextBox>
    <asp:TextBox ID="txt_siglamat" runat="server" Visible="False"></asp:TextBox>
       <asp:TextBox ID="txt_id_ingsal" runat="server" Visible="False"></asp:TextBox>

                            <asp:TextBox ID="txt_armadofecha" runat="server" Visible="False"></asp:TextBox>
   
                            <asp:TextBox ID="txt_id_horario" runat="server" Visible="False"></asp:TextBox>
   

                            <br />
     <asp:GridView ID="gv_horaingresaantes" runat="server" AutoGenerateColumns="False" DataSourceID="sql_horaingreso" Visible="False">
         <Columns>
             <asp:BoundField DataField="FECHA" HeaderText="FECHA" ReadOnly="True" SortExpression="FECHA" />
             <asp:BoundField DataField="Column1" DataFormatString="{0:d}"    HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
         </Columns>
     </asp:GridView>
     <asp:SqlDataSource ID="sql_horaingreso" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand=" SELECT  CONVERT(char(8), getdate(), 108) AS FECHA,getdate() "></asp:SqlDataSource>
   

                            </asp:Content>


