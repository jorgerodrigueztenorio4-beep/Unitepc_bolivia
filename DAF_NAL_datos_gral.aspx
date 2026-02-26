<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_NAL_datos_gral.aspx.vb" Inherits="DAF_NAL_datos_gral" MasterPageFile="~/mp_daf_nacional.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
         <h3>Horario general UNITEPC</h3>
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                           
                                <asp:GridView ID="gv_horatrios_gral" runat="server" CssClass =" table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_todo" Font-Size="9pt" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" Visible="false"/>
                                        <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Hras Academicas" ReadOnly="True" SortExpression="Hras_academica" />
                                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="SiglaP" HeaderText="Sigla" SortExpression="SiglaP"  Visible="false"/>
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" />
                                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="nom_bloque" HeaderText="Bloque" SortExpression="nom_bloque" />
                                        <asp:BoundField DataField="CARDES" HeaderText="Carrera" SortExpression="CARDES" />
                                        <asp:BoundField DataField="NombreSede" HeaderText="Sede" SortExpression="NombreSede" />
                                        <asp:BoundField DataField="Gestion" HeaderText="Gestion" SortExpression="Gestion" />
                                    </Columns>
                                    <HeaderStyle BackColor="#409756" ForeColor="White" />
                                </asp:GridView>

                                <asp:SqlDataSource ID="sql_ds_todo" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente, th.hora_inicio ,th.hora_fin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.grupo,th.tipo_clase,p.SiglaP,p.Materia ,p.Sis_plan,th.dia ,a.nom_aula_lab,tb.nom_bloque  ,c.CARDES ,ts.NombreSede ,th.gestion
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
  join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan 
 join tb_aula a on th.aula = a.id_nomal 
join tb_sedes ts on th.sede = ts.idSede 
join tb_bloques tb on th.bloque  = tb.id_bloque 
join tb_carreras c on p.codcar = c.CARSIGLA 
where th.gestion ='2-2025'  and tp.gestion ='2-2025'  and a.gestion ='1-2024'
ORDER BY   ts.NombreSede , CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END ,th.hora_inicio,c.CARDES " UpdateCommand="UPDATE tb_aula SET nom_aula_lab = @nom_aula_lab WHERE (id_nomal = @id_nomal)">
                                    <UpdateParameters>
                                        <asp:Parameter Name="nom_aula_lab" />
                                        <asp:Parameter Name="id_nomal" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>

                                </div>
            </div>
         </div>
         </form>
</asp:Content>


