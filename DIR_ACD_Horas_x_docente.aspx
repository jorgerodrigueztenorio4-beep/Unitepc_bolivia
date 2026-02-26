<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_Horas_x_docente.aspx.vb" Inherits="DIR_ACD_Horas_x_docente" MasterPageFile="~/mp_dir_academico.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
      <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                               Lista de Horarios Gestion 2-2022
                            </div>
                                 <div class="input-group mb-1">
                                     <asp:DropDownList ID="ddl_docente" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_docente" DataTextField="docente" DataValueField="ci" AutoPostBack="True"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (nombres +' '+primerApellido +' '+segundoApellido )as docente,ci  from tb_personal 
where gestion ='1-2025'
order by docente"></asp:SqlDataSource>
                                     <asp:GridView ID="gv_docente" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_cargahora" Font-Size="9pt" ShowFooter="True">
                                         <Columns>
                                             <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                             <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                             <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                             <asp:BoundField DataField="horainicio" HeaderText="horainicio" ReadOnly="True" SortExpression="horainicio" />
                                             <asp:BoundField DataField="horafin" HeaderText="horafin" ReadOnly="True" SortExpression="horafin" />
                                             <asp:BoundField DataField="Hras_academica" HeaderText="Hras_academica" ReadOnly="True" SortExpression="Hras_academica" />
                                             <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                             <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                             <asp:BoundField DataField="horas" HeaderText="horas" SortExpression="horas" />
                                             <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion" />
                                             <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                             <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                             <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" />
                                             <asp:BoundField DataField="tipoContrato" HeaderText="tipoContrato" SortExpression="tipoContrato" />
                                             <asp:BoundField DataField="nit" HeaderText="nit" SortExpression="nit" />
                                             <asp:BoundField DataField="nroCuenta" HeaderText="nroCuenta" SortExpression="nroCuenta" />
                                         </Columns>
                                         <HeaderStyle BackColor="#D4EDDA" />
                                     </asp:GridView>
                                     <asp:SqlDataSource ID="sql_ds_cargahora" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente, replace(th.hora_inicio,':00.000000','') as horainicio ,replace(th.hora_fin,':00.000000','')as horafin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.dia,th.tipo_clase,td.horas  ,td.fecha_creacion ,p.SiglaP,p.Materia,p.Sis_plan,tc.tipoContrato ,tf.nit ,tf.nroCuenta 
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_personal tp on th.ci_doc = tp.ci 
inner join planes_estudios p on td.id_materia = p.id_plan 
join tb_contratos tc on th.ci_doc = tc.ci 
join tb_datos_financieros tf on th.ci_doc = tf.ci
where   th.gestion ='1-2025' and tp.gestion='1-2025' and th.ci_doc =@ci and tp.gestion ='1-2024' and tf.gestion ='1-2024'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END
,docente
">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="ddl_docente" Name="ci" PropertyName="SelectedValue" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>
                                 </div>
                                </div>
            </div>
         </div>
          </form> 

</asp:Content>


