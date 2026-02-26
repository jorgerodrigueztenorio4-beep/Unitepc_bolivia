<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_respaldo_docente.aspx.vb" Inherits="DIR_CAR_respaldo_docente" MasterPageFile="mp_dir_car.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server"  >
      <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container">
    	<div class="row">
                            <div class="col-md-6 p-3 mb-2 bg-default text-black border border-dark rounded ">
                              <div class="alert-warning text-md-center  rounded " role="alert">
                                Seleccionar Tipo de Respaldo ,Docente,Fecha de Inicio y Fecha de Fin
                            </div>
                                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="pasadohoras" Font-Names="Consolas" Font-Size="9pt" DataKeyNames="id_ing_sal">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="id_ing_sal" HeaderText="id_ing_sal" InsertVisible="False" ReadOnly="True" SortExpression="id_ing_sal" />
                            <asp:BoundField DataField="id_horario" HeaderText="id_horario" SortExpression="id_horario" ReadOnly="True" />
                            <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso" ReadOnly="True" />
                            <asp:BoundField DataField="hr_salida" HeaderText="hr_salida" SortExpression="hr_salida" />
                        </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="pasadohoras" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select id_ing_sal ,id_horario,hr_ingreso,hr_salida from tb_ing_sal 
where day(hr_ingreso )&lt;&gt;day(hr_salida) and year(hr_ingreso)='2023'" UpdateCommand="UPDATE tb_ing_sal SET hr_salida =convert(datetime, @hr_salida,103) WHERE (id_ing_sal = @id_ing_sal)">
                            <UpdateParameters>
                                <asp:Parameter Name="hr_salida" />
                                <asp:Parameter Name="id_ing_sal" />
                            </UpdateParameters>
                                </asp:SqlDataSource>
                                                            <asp:TextBox ID="txt_id_horario" runat="server"></asp:TextBox>


                            </div>
              <div class="col-md-6 p-3 mb-2 bg-default text-black border border-dark rounded ">
                              <div class="alert-warning text-md-center  rounded " role="alert">
                                Seleccionar Tipo de Respaldo ,Docente,Fecha de Inicio y Fecha de Fin
                            </div>

                  <asp:GridView ID="gv_docente_clases" CssClass ="table table-hover " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_docenteclases" Font-Names="Consolas" Font-Size="9pt">
                    <Columns>
                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                        <asp:BoundField DataField="docente" HeaderText="docente" SortExpression="docente" ReadOnly="True" />
                        <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                        <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                    </Columns>
                            <HeaderStyle BackColor="#C2C7C0" />
                </asp:GridView>
                <asp:SqlDataSource ID="sql_ds_docenteclases" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,replace((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ),'a a a','--* Sin Asignar Docente *--')as docente , th.hora_inicio ,th.hora_fin,th.dia,th.tipo_clase  
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan
 join tb_aula a on th.aula = a.id_nomal  
where th.id_horario=@idhora  and th.gestion ='1-2024' and tp.gestion ='1-2024'  and a.gestion ='1-2024'">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txt_id_horario" Name="idhora" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            




                            </div>
            </div>
         </div>
         </form>




     
</asp:Content>



