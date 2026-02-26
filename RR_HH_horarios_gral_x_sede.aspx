<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_horarios_gral_x_sede.aspx.vb" Inherits="RR_HH_horarios_gral_x_sede" MasterPageFile="~/mp_rr_hh.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                               Lista de Horarios Presenciales
                            </div>
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True" AutoPostBack="True">
                                    <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                               
                                
                                <asp:GridView ID="gv_horarios_v" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_virtuales" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_horario" Visible ="false"   />
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                              <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Hras_academica" SortExpression="Hras_academica" ReadOnly="True" Visible ="false" />
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="link_clase" HeaderText="link_clase" SortExpression="link_clase" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="nom_aula_lab" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion" Visible ="false" />
                                        <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                  
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia"  />
                                        <asp:BoundField DataField="CARDES" HeaderText="CARDES" SortExpression="CARDES" />
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Plan" SortExpression="Sis_plan" />
                                        <asp:BoundField DataField="comun" HeaderText="comun" SortExpression="comun" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_virtuales" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente, th.hora_inicio ,th.hora_fin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.dia,th.tipo_clase ,link_clase,a.nom_aula_lab  ,td.fecha_creacion ,p.SiglaP,p.Materia,tc.CARDES ,p.Sis_plan,td.comun 
from tb_designacion td
 left join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan 
 join tb_carreras tc on p.codcar =tc.CARSIGLA 
left  join tb_aula a on th.aula = a.id_nomal 
where th.sede=@sede
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END ,tc.CARDES 
">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_cius" runat="server" Visible="False"></asp:TextBox>
                                </div>
            </div>
         </div>

    </form>
</asp:Content>



