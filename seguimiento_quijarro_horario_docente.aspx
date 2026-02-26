<%@ Page Language="VB" AutoEventWireup="false" CodeFile="seguimiento_quijarro_horario_docente.aspx.vb" Inherits="seguimiento_quijarro_horario_docente" MasterPageFile="~/mp_s_p_quijarro.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    

     <div class="alert alert-success mt-1 text-md-center text-bold  " role="alert">
    <h3>Seguimiento Docente Puerto Quijarro</h3>
        </div> 
     <div class=" container-fluid">
    	<div class="row">
             

                            <div class="col-md-12 p-3 mb-1   text-black border border-dark rounded  ">
                             
                                 <div class="alert-warning text-md-center  rounded  " role="alert">
                       <h3></h3>Ingrese Su Nro de C.I.
                            </div> 
                                <asp:TextBox ID="txt_ci" placeholder="Ingrese Su nro de C.I." CssClass ="form-control mt-2 " runat="server" AutoPostBack="False" Font-Bold="True" Font-Size="15pt"></asp:TextBox>
                                <asp:Button ID="Button2" runat="server" CssClass="form-control btn btn-primary mt-2" Text="Buscar Clase" />
                                <asp:GridView ID="gv_horario" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" Visible ="false"  />
                                        <asp:BoundField DataField="ci_doc" HeaderText="Nro de C.I." SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" >
                                        <ItemStyle BackColor="#CCE5FF" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" >
                                        <ItemStyle BackColor="#FFF3CD" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Horas Academicas" ReadOnly="True" SortExpression="Hras_academica" />
                                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" >
                                        <ItemStyle BackColor="#99FFCC" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="link" HeaderText="Link" ReadOnly="True" SortExpression="link" />
                                        <asp:BoundField DataField="Aula" HeaderText="Aula" ReadOnly="True" SortExpression="Aula" />
                                        <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion" Visible ="false"  />
                                        <asp:BoundField DataField="SiglaP" HeaderText="Sigla" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" >
                                        <ItemStyle BackColor="#FFFFCC" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" Visible ="false"  />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" HorizontalAlign="Center" />
                                 </asp:GridView>
                                 <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente, th.hora_inicio ,th.hora_fin,th.grupo,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.dia,th.tipo_clase ,isnull(link_clase,'Sin Link') as link,isnull(a.nom_aula_lab,' ') as Aula ,td.fecha_creacion ,p.SiglaP,p.Materia,p.Sis_plan
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan 
left join tb_aula a on th.aula = a.id_nomal 
where th.ci_doc =@ci and th.gestion='2-2023' and tp.gestion='2-2023' and a.gestion='2-2023'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END">
                                     <SelectParameters>
                                         <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                                     </SelectParameters>
                                 </asp:SqlDataSource>
                                </div> 
            </div> 
         </div> 
</asp:Content>



