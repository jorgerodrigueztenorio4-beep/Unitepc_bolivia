<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_horarios_virtuales.aspx.vb" Inherits="DIR_ACD_horarios_virtuales" MasterPageFile="~/mp_dir_academico.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                               Lista de Horarios Gestion 1-2024
                            </div>
                                 <div class="input-group mb-1">

                                <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_carrera" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione una Carrera</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                     <asp:Button ID="Button1" runat="server" CssClass ="btn btn-primary form-control mt-1  " Text="Exportar a Excel" />
                                 </div>
                              <%--       <asp:GridView ID="gv_horarios_v" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_virtuales" Font-Size="9pt" Font-Names="Consolas">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_horario"  />
                                        <asp:BoundField DataField="ci_doc" HeaderText="C.I. del Docente" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                              <asp:BoundField DataField="horainicio" HeaderText="Hora de Inicio" SortExpression="horainicio" ReadOnly="True" />
                                        <asp:BoundField DataField="horafin" HeaderText="Hora de Fin" SortExpression="horafin" ReadOnly="True" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Horas Academicas" SortExpression="Hras_academica" ReadOnly="True" />
                                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion" Visible ="false"  >
                                        </asp:BoundField >
                                      
                                        <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="gestion" HeaderText="Gestion" SortExpression="gestion" />
                                  
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Plan" SortExpression="Sis_plan"  />
                                        <asp:BoundField DataField="comun" HeaderText="Comun" SortExpression="comun"  />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>--%>
                                <div class="table-scroll">

<asp:GridView 
    ID="gv_horarios_v" 
    runat="server"
    CssClass="table table-hover table-sm mt-1"
    AutoGenerateColumns="False"
    DataSourceID="sql_virtuales"
    DataKeyNames="id_horario"
    Font-Size="9pt"
    Font-Names="Consolas"
    GridLines="None">

    <Columns>

        
        <asp:TemplateField HeaderText="Eliminar">
            <ItemTemplate>
                <asp:LinkButton 
                    ID="btnEliminar" 
                    runat="server" 
                    CssClass="btn btn-danger btn-sm"
                    ToolTip="Eliminar">
                    <i class="fa fa-trash"></i>
                </asp:LinkButton>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" Width="60px" />
        </asp:TemplateField>

        
        <asp:BoundField 
            DataField="id_horario" 
            HeaderText="Id." />

        
        <asp:TemplateField HeaderText="Docente">
            <ItemTemplate>
                <div class="lh-sm">
                    <strong>Docente:</strong><br />
                    <%# Eval("docente") %><br />
                    <strong>C.I.:</strong> <%# Eval("ci_doc") %>
                </div>
            </ItemTemplate>
            <ItemStyle BackColor="#FFE6E6" VerticalAlign="Top" />
        </asp:TemplateField>

        
        <asp:BoundField 
            DataField="nom_aula_lab" 
            HeaderText="Aula / Lab." />

        
        <asp:BoundField 
            DataField="grupo" 
            HeaderText="Grupo" />

        
        <asp:BoundField 
            DataField="dia" 
            HeaderText="Día" />

       
        <asp:TemplateField HeaderText="Horario">
            <ItemTemplate>
                <span class="badge bg-info" style="font-size: 9pt; padding: 6px 10px;" >
                    <%# Eval("horainicio") %> - <%# Eval("horafin") %>
                </span>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>

        
        <asp:BoundField 
            DataField="tipo_clase" 
            HeaderText="Tipo">
            <ItemStyle BackColor="#E6FFE7" />
        </asp:BoundField>

       
        <asp:TemplateField HeaderText="Materia">
            <ItemTemplate>
                <div class="lh-sm">
                    <strong><%# Eval("Materia") %></strong><br />
                    <span class="text-muted"><%# Eval("SiglaP") %></span>
                </div>
            </ItemTemplate>
        </asp:TemplateField>

       
        <asp:BoundField 
            DataField="Sis_plan" 
            HeaderText="Plan" />

       
        <asp:BoundField 
            DataField="Comun" 
            HeaderText="Común">
            <ItemStyle BackColor="#E6F1FF" />
        </asp:BoundField>

        
        <asp:BoundField 
            DataField="gestion" 
            HeaderText="Gestión" />

    </Columns>

    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />

</asp:GridView>

</div>




                                <asp:SqlDataSource ID="sql_virtuales" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,iIf((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )='a a a','Sin Docente',(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ))as docente, replace(th.hora_inicio,':00.000000','') as horainicio ,replace(th.hora_fin,':00.000000','')as horafin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.dia,th.tipo_clase,a.nom_aula_lab,th.grupo ,th.gestion    ,p.SiglaP,p.Materia,p.Sis_plan,IIF(td.comun ='C', 'Si es Materia Comun', 'NO es Materia Comun') as comun ,td.fecha_creacion
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_personal tp on th.ci_doc = tp.ci 
inner join planes_estudios p on td.id_materia = p.id_plan 
join tb_aula a on th.aula = a.id_nomal 
where  th.sede=@sede  and p.codcar =@car and th.gestion ='1-2026' and tp.gestion='1-2026' and a.gestion ='1-2024'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END, th.hora_inicio 
">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="car" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                               
                                </div>
            </div>
         </div>

    </form>
</asp:Content>



