<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_actualizar.aspx.vb" Inherits="ADM_actualizar" MasterPageFile="~/mp_daf_nacional.master" %>


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
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_carrera" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione una Carrera</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]" DeleteCommand="delete tb_designacion where id_horario =@idhora">
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="txt_id_horario" Name="idhora" PropertyName="Text" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_id_desig" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txt_horas" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" runat="server" Text="Actualizar" />
                                <asp:GridView ID="gv_horarios_v" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_virtuales" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario"  />
                                        <asp:BoundField DataField="id_designacion" HeaderText="id_designacion" SortExpression="id_designacion" InsertVisible="False" ReadOnly="True" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                              <asp:BoundField DataField="docente" HeaderText="docente" SortExpression="docente" ReadOnly="True" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Hras_academica" SortExpression="Hras_academica" ReadOnly="True" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Hrs_teoricas" HeaderText="Hrs_teoricas" SortExpression="Hrs_teoricas" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="link_clase" HeaderText="link_clase" SortExpression="link_clase" />
                                  
                                        <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion"  />
                                        <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_virtuales" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="
select th.id_horario,td.id_designacion ,th.ci_doc ,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente, th.hora_inicio ,th.hora_fin,th.grupo,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,p.Hrs_teoricas,th.dia,th.tipo_clase ,link_clase,/*a.nom_aula_lab  ,*/td.fecha_creacion ,p.SiglaP,p.Materia,p.Sis_plan
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_personal tp on th.ci_doc = tp.ci 
inner join planes_estudios p on td.id_materia = p.id_plan 
--inner join tb_aula a on th.aula = a.id_nomal 
where th.tipo_clase ='Presencial' and th.sede=@sede  and p.codcar =@car" DeleteCommand="delete tb_horario where id_horario =@id_hor" UpdateCommand="UPDATE tb_designacion SET horas = @horas WHERE (id_designacion = @iddesig)">
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="txt_id_horario" Name="id_hor" PropertyName="Text" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="car" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="txt_horas" Name="horas" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_id_desig" Name="iddesig" PropertyName="Text" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                </div>
            </div>
         </div>

    </form>
</asp:Content>



