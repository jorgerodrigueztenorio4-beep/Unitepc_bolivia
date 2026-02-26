<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SEC_DIR_ACD_editar_grupos.aspx.vb" Inherits="SEC_DIR_ACD_editar_grupos" MasterPageFile="~/mp_sec_dir_academico.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
    <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-2 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                               Lista de Horarios
                            </div>
                                 <div class="input-group mb-1">
                                     <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                     <asp:DropDownList ID="ddl_carrera" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                     
                                      </div>
                                     <asp:GridView ID="gv_horarios" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_horarios" Font-Size="10pt" DataKeyNames="id_designacion">
                                         <Columns>
                                             <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass ="btn btn-outline-primary  mt-1 " />
                                             <asp:BoundField DataField="id_designacion" HeaderText="Idd." InsertVisible="False" ReadOnly="True" SortExpression="id_designacion" />
                                             <asp:BoundField DataField="id_horario" HeaderText="Idh." InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                             <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                             <asp:BoundField DataField="horas" HeaderText="Horas" SortExpression="horas" />
                                             <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                                             <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                             <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                                             <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                                             <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                                             <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                             <asp:BoundField DataField="carrera" HeaderText="Carrera" SortExpression="carrera" />
                                             <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />
                                         </Columns>
                                         <HeaderStyle BackColor="#D4EDDA" />
                                     </asp:GridView>
                                     <asp:SqlDataSource ID="sql_horarios" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select d.id_designacion ,h.id_horario , replace((p.nombres+' '+p.primerApellido +' '+p.segundoApellido ),'a a a','--* Sin Asignar Docente *--')as docente ,d.horas ,h.tipo_clase,m.Materia ,h.dia ,h.hora_inicio ,h.hora_fin,h.grupo  ,d.carrera   ,a.nom_aula_lab  
from tb_horario h
join tb_designacion d on d.id_horario=h.id_horario 
join tb_personal p on h.ci_doc = p.ci
join planes_estudios m on d.id_materia = m.id_plan 
join tb_aula a on h.aula = a.id_nomal 
where h.gestion ='2-2022' and p.gestion ='2-2022' and d.carrera =@carrera and h.sede =@sede
ORDER BY CASE WHEN h.dia = 'Lunes' THEN 1 WHEN h.dia='Martes' THEN 2 WHEN h.dia='Miercoles' THEN 3 WHEN h.dia='Jueves' THEN 4 WHEN h.dia='Viernes' THEN 5  WHEN h.dia='Sabado' THEN 6  END,hora_inicio " UpdateCommand="update d set d.horas =@horas
 from tb_horario h
join tb_designacion d on d.id_horario=h.id_horario 
join tb_personal p on h.ci_doc = p.ci 
where h.gestion  ='2-2022' and d.id_designacion =@id_designacion">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                             <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                         </SelectParameters>
                                         <UpdateParameters>
                                             <asp:Parameter Name="horas" />
                                             <asp:Parameter Name="id_designacion" />
                                         </UpdateParameters>
                                     </asp:SqlDataSource>
                                     <asp:TextBox ID="txt_id_horairo" runat="server" Visible="False"></asp:TextBox>
                                     <asp:GridView ID="gv_selec" runat="server" CssClass="table table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_selec" Font-Size="10pt">
                                         <Columns>
                                             <asp:BoundField DataField="id_designacion" HeaderText="Idd." InsertVisible="False" ReadOnly="True" SortExpression="id_designacion" />
                                             <asp:BoundField DataField="id_horario" HeaderText="Idh." InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                             <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                             <asp:BoundField DataField="horas" HeaderText="Horas" SortExpression="horas" />
                                             <asp:BoundField DataField="tipo_clase" HeaderText="tipo de Clase" SortExpression="tipo_clase" />
                                             <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                             <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                                             <asp:BoundField DataField="hora_inicio" HeaderText="hora de Inicio" SortExpression="hora_inicio" />
                                             <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                                             <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                             <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" Visible ="false"  />
                                         </Columns>
                                         <HeaderStyle BackColor="#D4EDDA" />
                                     </asp:GridView>
                                     <div class="input-group mb-1">
                                     
                                     <asp:TextBox ID="txt_hora" placeholder="Ingrese la Hora de la Materia" CssClass ="form-control mt-1 " runat="server" Visible="False"></asp:TextBox>
                                     <asp:Button ID="Button1" runat="server" CssClass ="btn btn-primary mt-1 form-control  " Text="Actualizar Hora" Visible="False" />
                                         </div>
                                     <asp:Button ID="Button2" CssClass ="btn btn-success mt-1 form-control " runat="server" Text="Volver" Visible="False" />
                                     <asp:SqlDataSource ID="sql_ds_selec" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select d.id_designacion ,h.id_horario , (p.nombres+' '+p.primerApellido +' '+p.segundoApellido )as docente ,d.horas ,h.tipo_clase,m.Materia ,h.dia ,h.hora_inicio ,h.hora_fin,h.grupo  ,d.carrera   from tb_horario h
join tb_designacion d on d.id_horario=h.id_horario 
join tb_personal p on h.ci_doc = p.ci
join planes_estudios m on d.id_materia = m.id_plan 
where h.id_horario=@id and p.gestion ='2-2022'" UpdateCommand="UPDATE tb_horario SET grupo = @horas WHERE (id_horario = @idh)">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="txt_id_horairo" Name="id" PropertyName="Text" />
                                         </SelectParameters>
                                         <UpdateParameters>
                                             <asp:ControlParameter ControlID="txt_hora" Name="horas" PropertyName="Text" />
                                             <asp:ControlParameter ControlID="txt_id_horairo" Name="idh" PropertyName="Text" />
                                         </UpdateParameters>
                                     </asp:SqlDataSource>
                                     <asp:TextBox ID="txt_id_desig" runat="server" Visible="False"></asp:TextBox>
                                 </div>
                                </div>
            </div>
         </div>

    </form>

</asp:Content>



