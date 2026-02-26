<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_SEDE_editar_aula.aspx.vb" Inherits="DIR_ACD_SEDE_editar_aula" MasterPageFile="mp_dir_academico_sedes.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
    <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-2 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                               Lista de Horarios para Actualizar aula
                            </div>
                                 <div class="input-group mb-1">
                                     <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT idSede, NombreSede, nombrecorto FROM tb_sedes WHERE (idSede = @idsede)">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="txt_sede" Name="idsede" PropertyName="Text" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>
                                     <asp:DropDownList ID="ddl_carrera" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_carrera, CARSIGLA, CARDES, FACULTAD FROM tb_carreras ">
                                     </asp:SqlDataSource>
                                     
                                      </div>
                                     <asp:GridView ID="gv_horarios" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_horarios" Font-Size="10pt" DataKeyNames="id_designacion">
                                         <Columns>
                                             <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass ="btn btn-outline-primary  mt-1 " >
<ControlStyle CssClass="btn btn-outline-primary  mt-1 "></ControlStyle>
                                             </asp:CommandField>
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
                                             <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" >
                                             <ItemStyle BackColor="#fefff1" />
                                             </asp:BoundField>
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
                                             <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula/Lab." SortExpression="nom_aula_lab"  >
                                             <ItemStyle BackColor="#fefff1" />
                                             </asp:BoundField>
                                         </Columns>
                                         <HeaderStyle BackColor="#D4EDDA" />
                                     </asp:GridView>
                                     <div class="input-group mb-1">
                                         <asp:DropDownList ID="ddl_bloque" runat="server" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" Visible="False">
                                             <asp:ListItem Value="0">Seleccione Bloque</asp:ListItem>
                                         </asp:DropDownList>
                                         <asp:SqlDataSource ID="sql_ds_bloque"  runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques] WHERE ([id_sede] = @id_sede)">
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="txt_sede" Name="id_sede" PropertyName="Text" Type="Int32" />
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                         <asp:DropDownList ID="ddl_aula" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" runat="server" AppendDataBoundItems="True" DataSourceID="sql_aula" DataTextField="nom_aula_lab" DataValueField="id_nomal" Visible="False">
                                             <asp:ListItem Value="0">Seleccione Aula</asp:ListItem>
                                         </asp:DropDownList>
                                         <asp:SqlDataSource ID="sql_aula" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_nomal, nom_aula_lab, bloque, capacidad, dimenciones, Sede, ultima_actualizacion, foto, gestion, tipo_ambiente, ubicacion_piso, capacidad_bs, estado_aula, nro_pupitres, observaciones FROM tb_aula WHERE (bloque = @bloque) AND (gestion = '2-2022')">
                                             <SelectParameters>
                                                 <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" Type="Int32" />
                                             </SelectParameters>
                                         </asp:SqlDataSource>
                                     <asp:Button ID="Button1" runat="server" CssClass ="btn btn-primary mt-1 form-control  " Text="Actualizar Aula" Visible="False" />
                                         </div>
                                     <asp:Button ID="Button2" CssClass ="btn btn-success mt-1 form-control " runat="server" Text="Volver" Visible="False" />
                                     <asp:SqlDataSource ID="sql_ds_selec" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT d.id_designacion, h.id_horario, p.nombres + ' ' + p.primerApellido + ' ' + p.segundoApellido AS docente, d.horas, h.tipo_clase, m.Materia, h.dia, h.hora_inicio, h.hora_fin, h.grupo, d.carrera, a.nom_aula_lab FROM tb_horario AS h INNER JOIN tb_designacion AS d ON d.id_horario = h.id_horario INNER JOIN tb_personal AS p ON h.ci_doc = p.ci INNER JOIN planes_estudios AS m ON d.id_materia = m.id_plan INNER JOIN tb_aula AS a ON h.aula = a.id_nomal WHERE (h.id_horario = @id) AND (p.gestion = '2-2022')" UpdateCommand="UPDATE tb_horario SET aula = @horas WHERE (id_horario = @idh)">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="txt_id_horairo" Name="id" PropertyName="Text" />
                                         </SelectParameters>
                                         <UpdateParameters>
                                             <asp:ControlParameter ControlID="ddl_aula" Name="horas" PropertyName="SelectedValue" />
                                             <asp:ControlParameter ControlID="txt_id_horairo" Name="idh" PropertyName="Text" />
                                         </UpdateParameters>
                                     </asp:SqlDataSource>
                                     <asp:TextBox ID="txt_id_desig" runat="server" Visible="False"></asp:TextBox>
                                 </div>
                                </div>
            </div>
        <asp:TextBox ID="txt_siglacar" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="txt_sede" runat="server" Visible="False"></asp:TextBox>
         


    </form>

</asp:Content>



