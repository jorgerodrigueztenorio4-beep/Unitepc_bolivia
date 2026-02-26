<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_NAL_general_2023.aspx.vb" Inherits="DAF_NAL_general_2023" MasterPageFile="mp_daf_nacional.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            <h3>Horario general</h3>
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                          
                                <asp:GridView ID="GridView1" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_gral" Font-Names="Consolas" GridLines="None" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="horainicio" HeaderText="horainicio" ReadOnly="True" SortExpression="horainicio" />
                                        <asp:BoundField DataField="horafin" HeaderText="horafin" ReadOnly="True" SortExpression="horafin" />
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="nom_aula_lab" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                                        <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="NombreSede" HeaderText="NombreSede" SortExpression="NombreSede" />
                                    </Columns>
                                    <HeaderStyle BackColor="#009900" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_gral" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="
select th.id_horario ,th.ci_doc ,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente, replace(th.hora_inicio,':00.000000','') as horainicio ,replace(th.hora_fin,':00.000000','')as horafin,th.dia,th.tipo_clase,a.nom_aula_lab,th.grupo ,th.gestion    ,p.SiglaP,p.Materia,s.NombreSede 
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_personal tp on th.ci_doc = tp.ci 
inner join planes_estudios p on td.id_materia = p.id_plan 
join tb_aula a on th.aula = a.id_nomal 
join tb_sedes s on th.sede = s.idSede 
where  th.gestion ='2-2025' and tp.gestion='2-2025' and a.gestion ='1-2024'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END"></asp:SqlDataSource>
                                </div>
            </div>
         </div>
         </form> 
</asp:Content>



