<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_asignar_docente.aspx.vb" Inherits="DIR_ACD_asignar_docente" MasterPageFile="~/mp_dir_academico.master" %>


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
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                <asp:GridView ID="gv_horarios_v" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_virtuales" Font-Size="9pt" DataKeyNames="id_horario">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario"  />
                                        <asp:TemplateField HeaderText="ci_doc" SortExpression="ci_doc">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" SelectedValue='<%# Bind("ci_doc", "{0}") %>' DataSourceID="sql_ds_docente" DataTextField="Docente" DataValueField="ci">
                                                    <asp:ListItem Value="0">Seleccione un Docente</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (nombres +' '+primerApellido +' '+segundoApellido+'  ---&gt;  '+ci  ) as Docente , ci  from tb_personal order by Docente  "></asp:SqlDataSource>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ci_doc") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" ReadOnly="True" SortExpression="hora_inicio" />
                                              <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" ReadOnly="True" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Hras_academica" SortExpression="Hras_academica" ReadOnly="True" />
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" ReadOnly="True"/>
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" ReadOnly="True"/>
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" ReadOnly="True">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" ReadOnly="True">
                                        </asp:BoundField>
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="nom_aula_lab" SortExpression="nom_aula_lab" ReadOnly="True"/>
                                        <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" ReadOnly="True"/>
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" ReadOnly="True"/>
                                  
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_virtuales" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc , th.hora_inicio ,th.hora_fin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.dia,p.Materia,th.grupo,th.tipo_clase ,a.nom_aula_lab ,p.SiglaP,p.Sis_plan
from tb_designacion td
join tb_horario th on td.id_horario = th.id_horario 
 
 join planes_estudios p on td.id_materia = p.id_plan 
 join tb_aula a on th.aula = a.id_nomal 

where  th.sede=@sede  and p.codcar =@car and th.gestion='2-2022' and  th.ci_doc ='0'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END
" UpdateCommand="UPDATE tb_horario SET ci_doc = @ci_doc, fecha_registro = GETDATE() WHERE (id_horario = @id_horario)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="car" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="ci_doc" />
                                        <asp:Parameter Name="id_horario" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_cius" runat="server" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txt_ci" runat="server"></asp:TextBox>
                                </div>
            </div>
         </div>

    </form>
</asp:Content>



