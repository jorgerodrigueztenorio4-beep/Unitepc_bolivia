<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_LOCAL_Aulas_des.aspx.vb" Inherits="DAF_LOCAL_Aulas_des" MasterPageFile="~/mp_daf_local.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Aulas Clases
                            </div>
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1" runat="server" AutoPostBack="True" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione un Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_bloque" runat="server" AutoPostBack="True" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque"></asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques] WHERE ([id_sede] = @id_sede)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="id_sede" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="gv_aulas" runat="server" CssClass ="table-hover mt-1 " DataSourceID="sql_ds_aulas" AutoGenerateColumns="False" Font-Size="9pt">
                                    <Columns>
                                        <asp:CommandField ButtonType="Button" SelectText="Detalle" ShowSelectButton="True" ControlStyle-CssClass="btn-primary mt-1 " />
                                        <asp:BoundField DataField="id_nomal" HeaderText="id_nomal" InsertVisible="False" ReadOnly="True" SortExpression="id_nomal" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="nom_aula_lab" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="cant_clases" HeaderText="cant_clases" ReadOnly="True" SortExpression="cant_clases" />
                                        <asp:BoundField DataField="capacidad" HeaderText="capacidad" SortExpression="capacidad" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_aulas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select id_nomal,nom_aula_lab,count(nom_aula_lab ) as cant_clases,ta.capacidad   from tb_horario th
join tb_aula ta on th.aula = ta.id_nomal 
where th.sede=@sede and th.bloque=@bloque and ta.gestion='1-2024'
group by nom_aula_lab,id_nomal,capacidad ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_id_horario" runat="server" Visible="False"></asp:TextBox>
                                </div>
            <div class="col-md-8 p-3 mb-2 bg-white text-white border border-dark rounded ">
                <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                descripcion
                            </div>
                <asp:GridView ID="gv_aula" runat="server" DataSourceID="sql_aula"></asp:GridView>

                              <asp:SqlDataSource ID="sql_aula" runat="server"></asp:SqlDataSource>

                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                descripcion
                            </div>
                <asp:GridView ID="gv_detalle" runat="server" CssClass ="table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_detalle" Font-Size="9pt">
                    <Columns>
                        <asp:BoundField DataField="id_horario" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                        <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                        <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                        <asp:BoundField DataField="Hras_academica" HeaderText="Horas Academicas" ReadOnly="True" SortExpression="Hras_academica" />
                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                        <asp:BoundField DataField="link_clase" HeaderText="link_clase" SortExpression="link_clase" Visible ="false"  />
                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula/Lab" SortExpression="nom_aula_lab" />
                        <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion" Visible ="false"  />
                        <asp:BoundField DataField="SiglaP" HeaderText="Sigla Materia" SortExpression="SiglaP" />
                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan"  Visible ="false"  />
                    </Columns>
                              <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                              </asp:GridView>
                                <asp:SqlDataSource ID="sql_detalle" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente, th.hora_inicio ,th.hora_fin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.dia,th.tipo_clase ,link_clase,a.nom_aula_lab  ,td.fecha_creacion ,p.SiglaP,p.Materia,p.Sis_plan
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_personal tp on th.ci_doc = tp.ci 
inner join planes_estudios p on td.id_materia = p.id_plan 
inner join tb_aula a on th.aula = a.id_nomal 
where a.id_nomal =@aula and th.tipo_clase ='Presencial'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END , hora_inicio

">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_id_horario" Name="aula" PropertyName="Text" />
                                    </SelectParameters>
                              </asp:SqlDataSource>
                                </div>
            </div>
         </div>
         </form> 

</asp:Content>


