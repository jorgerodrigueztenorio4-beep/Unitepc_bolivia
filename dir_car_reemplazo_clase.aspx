<%@ Page Language="VB" AutoEventWireup="false" CodeFile="dir_car_reemplazo_clase.aspx.vb" Inherits="dir_car_reemplazo_clase" MasterPageFile="~/mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
      <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Programar Horario
                            </div>
                                 <asp:DropDownList ID="ddl_docente" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_docente" DataTextField="docente" DataValueField="ci" AutoPostBack="True"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (nombres +' '+primerApellido +' '+segundoApellido )as docente,ci  from tb_personal 
where gestion ='2-2022'
order by docente"></asp:SqlDataSource>
                                 <asp:GridView ID="gv_docente" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_cargahora" Font-Size="9pt" ShowFooter="True">
                                         <Columns>
                                             <asp:CommandField ShowSelectButton="True" />
                                             <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                             <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                             <asp:BoundField DataField="horainicio" HeaderText="horainicio" ReadOnly="True" SortExpression="horainicio" />
                                             <asp:BoundField DataField="horafin" HeaderText="horafin" ReadOnly="True" SortExpression="horafin" />
                                             <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                             <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                             <asp:BoundField DataField="horas" HeaderText="horas" SortExpression="horas" />
                                             <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                             <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                             <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" />
                                             <asp:BoundField DataField="id_materia" HeaderText="id_materia" SortExpression="id_materia" />
                                             <asp:BoundField DataField="horas1" HeaderText="horas1" SortExpression="horas1" />
                                         </Columns>
                                         <HeaderStyle BackColor="#D4EDDA" />
                                     </asp:GridView>
                                     <asp:SqlDataSource ID="sql_ds_cargahora" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc , replace(th.hora_inicio,':00.000000','') as horainicio ,replace(th.hora_fin,':00.000000','')as horafin,th.dia,th.tipo_clase,td.horas  ,p.SiglaP,p.Materia,p.Sis_plan ,td.id_materia ,td.horas 
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_personal tp on th.ci_doc = tp.ci 
inner join planes_estudios p on td.id_materia = p.id_plan 

join tb_datos_financieros tf on th.ci_doc = tf.ci
where   th.gestion ='2-2022' and tp.gestion='2-2022' and th.ci_doc =@ci and tp.gestion ='2-2022' and tf.gestion ='2-2022'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END

">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="ddl_docente" Name="ci" PropertyName="SelectedValue" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>




                            </div>
              <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Programar Horario
                            </div>
                            </div>
           
            </div>
         <div class="row">
            
                            <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Programar Horario
                            </div>
                            </div>
              <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Programar Horario
                            </div>
                            </div>
              <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Programar Horario
                            </div>
                            </div>
            </div>

         </div>
          </form> 


</asp:Content>


