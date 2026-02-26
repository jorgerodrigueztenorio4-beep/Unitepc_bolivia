<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_horarios_virtuales2.aspx.vb" Inherits="DIR_CAR_horarios_virtuales2" MasterPageFile="~/mp_dir_car2.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#faf083" class="text-md-center  rounded text-bold " role="alert">
                               Horarios Teoricos y Practicos
                            </div>
                                <asp:Button ID="Button1" CssClass ="btn btn-outline-primary mt-1 form-control " runat="server" Text="Exportar a Excel" />
                                <asp:GridView ID="gv_horarios_v" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_virtuales" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="C.I. del Docente" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" >
                                              <ItemStyle BackColor="#FFE6E6" />
                                        </asp:BoundField>
                                              <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula o Lab." SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="hora de Fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="horas Academicas" SortExpression="Hras_academica" ReadOnly="True" />
                                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" >
                                        <ItemStyle BackColor="#E6FFE7" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SiglaP" HeaderText="sigla" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Plan" SortExpression="Sis_plan" />
                                  
                                        <asp:BoundField DataField="Column1" HeaderText="Comun" SortExpression="Column1" ReadOnly="True"  >
                                        <ItemStyle BackColor="#E6F1FF" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_virtuales" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,replace((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ),'a a a','--* Sin Asignar Docente *--')as docente,a.nom_aula_lab , th.hora_inicio ,th.hora_fin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.dia,th.tipo_clase  ,p.SiglaP,p.Materia,p.Sis_plan,isnull(td.comun,'No es Comun') 
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan
 join tb_aula a on th.aula = a.id_nomal  
where td.carrera =@carrera and th.gestion ='2-2022' and tp.gestion ='2-2022' and th.sede =@sede
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END,hora_inicio " DeleteCommand="delete tb_horario where id_horario =@id_hor">
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="txt_id_horario" Name="id_hor" PropertyName="Text" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_sigla_car" Name="carrera" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_sigla_car" runat="server" Visible="False"></asp:TextBox>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]" DeleteCommand="delete tb_designacion where id_horario =@idhora">
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="txt_id_horario" Name="idhora" PropertyName="Text" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_sede" runat="server" Visible="False"></asp:TextBox>
                                </div>
            </div>
         </div>

    </form>
</asp:Content>



