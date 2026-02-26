<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DES_ACADEMICO_horarios.aspx.vb" Inherits="DES_ACADEMICO_horarios" MasterPageFile="~/mp_desarrollo_academico.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#faf083" class="text-md-center  rounded text-bold " role="alert">
                               Horarios Teoricos y Practicos
                            </div>
                                <div class="input-group mb-1">
                                    <asp:DropDownList ID="ddl_sede" CssClass="form-control  btn btn-outline-default border-dark mt-1 "  runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True" AutoPostBack="True">
                                        <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                    <asp:DropDownList ID="ddl_carrera" CssClass="form-control  btn btn-outline-default border-dark mt-1 "  runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True">
                                        <asp:ListItem Value="0">Seleccione una Carrera</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddl_gestion" CssClass="form-control  btn btn-outline-default border-dark mt-1 "  runat="server" AutoPostBack="True">
                                        <asp:ListItem>Seleccione una Gestión</asp:ListItem>
                                        <asp:ListItem>1-2022</asp:ListItem>
                                        <asp:ListItem>2-2022</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Button ID="Button2" runat="server" CssClass ="btn btn-outline-success mt-1 form-control " Text="Exportar a pdf" />
<asp:Button ID="Button1" CssClass ="btn btn-outline-primary mt-1 form-control " runat="server" Text="Exportar a Excel Sin formato" />
                                </div>
                                
                                <asp:GridView ID="gv_horarios_v" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_virtuales" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" >
                                        </asp:BoundField>
                                              <asp:BoundField DataField="docente" HeaderText="docente" SortExpression="docente" ReadOnly="True" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="nom_aula_lab" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" />
                                  
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_virtuales" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="
select th.id_horario,th.gestion  ,th.ci_doc ,replace((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ),'a a a','--* Sin Asignar Docente *--')as docente,a.nom_aula_lab , th.hora_inicio ,th.hora_fin,/*DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,*/th.dia,th.tipo_clase  ,p.SiglaP,p.Materia,p.Sis_plan
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan
 join tb_aula a on th.aula = a.id_nomal 
 join tb_carreras c on p.codcar = c.CARSIGLA 
where /*td.carrera ='carder'*/c.CARSIGLA =@carrera and th.gestion =@gestion and tp.gestion =@gestion and th.sede =@sede
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END,hora_inicio 

" DeleteCommand="delete tb_horario where id_horario =@id_hor">
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="txt_id_horario" Name="id_hor" PropertyName="Text" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_gestion" Name="gestion" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_sigla_car" runat="server" Visible="False"></asp:TextBox>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] order by CARDES " DeleteCommand="delete tb_designacion where id_horario =@idhora">
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="txt_id_horario" Name="idhora" PropertyName="Text" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_sede" runat="server" Visible="False"></asp:TextBox>
                                </div>
            </div>
         </div>

    </form>
</asp:Content>



