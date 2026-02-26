<%@ Page Language="VB" AutoEventWireup="false" CodeFile="COORDINADOR_horarios_presenciales.aspx.vb" Inherits="COORDINADOR_horarios_presenciales" MasterPageFile="~/mp_coordinadores.master" %>


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
                                <asp:GridView ID="gv_horarios_v" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_virtuales" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Hras_academica" SortExpression="Hras_academica" ReadOnly="True" />
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo"></asp:BoundField>
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase"></asp:BoundField>
                                        <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" />

                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_virtuales" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente, th.hora_inicio ,th.hora_fin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.dia,th.grupo,th.tipo_clase  ,p.SiglaP,p.Materia,p.Sis_plan
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_personal tp on th.ci_doc = tp.ci 
inner join planes_estudios p on td.id_materia = p.id_plan 
where  p.codcar =@carrera and th.sede =@sede and th.gestion ='2-2022' and tp.gestion ='2-2022'" DeleteCommand="delete tb_horario where id_horario =@id_hor">
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="txt_id_horario" Name="id_hor" PropertyName="Text" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_cius" Name="cius" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_siglacar" Name="carrera" PropertyName="Text" />
                                        <asp:ControlParameter Name="sede" ControlID="txt_sede" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_cius" runat="server" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txt_id_horario" runat="server" Visible="False"></asp:TextBox>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]" DeleteCommand="delete tb_designacion where id_horario =@idhora">
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="txt_id_horario" Name="idhora" PropertyName="Text" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_sede" runat="server" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txt_siglacar" runat="server" Visible="False"></asp:TextBox>
                                </div>
            </div>
         </div>

    </form>
</asp:Content>



