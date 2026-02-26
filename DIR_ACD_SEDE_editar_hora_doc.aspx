<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_SEDE_editar_hora_doc.aspx.vb" Inherits="DIR_ACD_SEDE_editar_hora_doc" MasterPageFile="mp_dir_academico_sedes.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
    <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-2 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                               Horario para Editar : Docente,Dia,Hora de Inicio y de Fin
                            </div>
                                 <div class="input-group mb-1">
                                     <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes] where idSede=@sede">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>
                                     <asp:DropDownList ID="ddl_carrera" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_carrera, CARSIGLA, CARDES, FACULTAD FROM tb_carreras" UpdateCommand="UPDATE tb_horario SET hora_inicio = @hini, hora_fin = @hfin WHERE (id_horario = @idhor)">
                                         <UpdateParameters>
                                             <asp:ControlParameter ControlID="txt_inicio" Name="hini" PropertyName="Text" />
                                             <asp:ControlParameter ControlID="txt_fin" Name="hfin" PropertyName="Text" />
                                             <asp:ControlParameter ControlID="txt_id_horairo" Name="idhor" PropertyName="Text" />
                                         </UpdateParameters>
                                     </asp:SqlDataSource>
                                     <asp:TextBox ID="txt_id_horairo" runat="server" Visible="False"></asp:TextBox>
                                     </div>
                                     <asp:GridView ID="gv_horarios" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_horarios" Font-Size="10pt" DataKeyNames="id_horario">
                                         <Columns>
                                             <asp:CommandField ShowSelectButton="True" />
                                             <asp:BoundField DataField="id_designacion" HeaderText="id_d" InsertVisible="False" ReadOnly="True" SortExpression="id_designacion" />
                                             <asp:BoundField DataField="id_horario" HeaderText="id_h" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                             <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                             
                                             <asp:BoundField DataField="tipo_clase" HeaderText="tipo de clase" SortExpression="tipo_clase"  ReadOnly="True"/>
                                             <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia"  ReadOnly="True"/>
                                             <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia"  ReadOnly="True"/>
                                             <asp:BoundField DataField="hora_inicio" HeaderText="hora de inicio" SortExpression="hora_inicio" />
                                             <asp:BoundField DataField="hora_fin" HeaderText="hora de fin" SortExpression="hora_fin" />
                                             <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo"  ReadOnly="True"/>
                                             <asp:BoundField DataField="nom_aula_lab" HeaderText="Aulab" SortExpression="nom_aula_lab"  ReadOnly="True"/>
                                             <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera"  ReadOnly="True"/>
                                             <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre"  ReadOnly="True"/>
                                             <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion"  ReadOnly="True"/>
                                             <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro"  ReadOnly="True" Visible ="false" />
                                             <asp:BoundField DataField="ci_usuario" HeaderText="ci_usuario" SortExpression="ci_usuario" Visible ="false"  ReadOnly="True"/>
                                         </Columns>
                                         <HeaderStyle BackColor="#D4EDDA" />
                                     </asp:GridView>
                                   <asp:GridView ID="gv_horarios2" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horarios2" Font-Size="10pt">
                                         <Columns>
                                             <asp:BoundField DataField="id_designacion" HeaderText="id_designacion" InsertVisible="False" ReadOnly="True" SortExpression="id_designacion" />
                                             <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                             <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                             <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                             <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                             <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                             <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                             <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                             <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                             <asp:BoundField DataField="nom_aula_lab" HeaderText="nom_aula_lab" SortExpression="nom_aula_lab" />
                                             <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                                             <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" />
                                             <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                                             <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" />
                                             <asp:BoundField DataField="ci_usuario" HeaderText="ci_usuario" SortExpression="ci_usuario" Visible ="false"  />
                                         </Columns>
                                         <HeaderStyle BackColor="#D4EDDA" />
                                     </asp:GridView>






                                     <asp:SqlDataSource ID="sql_horarios" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select d.id_designacion ,h.id_horario , (p.nombres+' '+p.primerApellido +' '+p.segundoApellido )as docente ,h.tipo_clase,m.Materia ,h.dia ,h.hora_inicio ,h.hora_fin,h.grupo,a.nom_aula_lab   ,d.carrera,m.Semestre  ,h.gestion ,h.fecha_registro ,ci_usuario 
  from tb_horario h
join tb_designacion d on d.id_horario=h.id_horario 
join tb_personal p on h.ci_doc = p.ci
join planes_estudios m on d.id_materia = m.id_plan 
join tb_aula a on h.aula = a.id_nomal 
where h.gestion ='2-2022' and p.gestion ='1-2024' and d.carrera =@carrera and h.sede =@sede
order by m.Semestre " UpdateCommand="UPDATE tb_horario SET hora_inicio = @hini, hora_fin = @hfin WHERE (id_horario = @id_horario)" DeleteCommand="DELETE FROM tb_horario WHERE (id_horario = @id_horario)">
                                         <DeleteParameters>
                                             <asp:ControlParameter ControlID="txt_id_horairo" Name="id_horario" PropertyName="Text" />
                                         </DeleteParameters>
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                             <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                         </SelectParameters>
                                         <UpdateParameters>
                                             <asp:Parameter Name="hini" />
                                             <asp:Parameter Name="id_horario" />
                                             <asp:Parameter Name="hfin" />
                                         </UpdateParameters>
                                     </asp:SqlDataSource>
                                      <asp:SqlDataSource ID="sql_ds_horarios2" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select d.id_designacion ,h.id_horario , (p.nombres+' '+p.primerApellido +' '+p.segundoApellido )as docente ,h.tipo_clase,m.Materia ,h.dia ,h.hora_inicio ,h.hora_fin,h.grupo,a.nom_aula_lab   ,d.carrera,m.Semestre  ,h.gestion ,h.fecha_registro ,ci_usuario 
  from tb_horario h
join tb_designacion d on d.id_horario=h.id_horario 
join tb_personal p on h.ci_doc = p.ci
join planes_estudios m on d.id_materia = m.id_plan 
join tb_aula a on h.aula = a.id_nomal 
where h.id_horario=@idhorario and h.gestion ='2-2022' and p.gestion ='2-2022'
order by m.Semestre " UpdateCommand="UPDATE tb_horario SET hora_inicio = @hini, hora_fin = @hfin WHERE (id_horario = @id_horario)" DeleteCommand="DELETE FROM tb_horario WHERE (id_horario = @id_horario)">
                                         <DeleteParameters>
                                             <asp:ControlParameter ControlID="txt_id_horairo" Name="id_horario" PropertyName="Text" />
                                         </DeleteParameters>
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="txt_id_horairo" Name="idhorario" PropertyName="Text" />
                                         </SelectParameters>
                                         <UpdateParameters>
                                             <asp:Parameter Name="hini" />
                                             <asp:Parameter Name="id_horario" />
                                             <asp:Parameter Name="hfin" />
                                         </UpdateParameters>
                                     </asp:SqlDataSource>

                                     <asp:GridView ID="gv_selec" runat="server" AutoGenerateColumns="False" DataSourceID="sql_horariosel" Visible="False">
                                         <Columns>
                                             <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                             <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
                                             <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                                             <asp:BoundField DataField="nombre_clase" HeaderText="nombre_clase" SortExpression="nombre_clase" />
                                             <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                             <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                             <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                             <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                             <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                             <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                             <asp:BoundField DataField="link_clase" HeaderText="link_clase" SortExpression="link_clase" />
                                             <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
                                             <asp:BoundField DataField="aula" HeaderText="aula" SortExpression="aula" />
                                             <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" />
                                             <asp:BoundField DataField="ci_usuario" HeaderText="ci_usuario" SortExpression="ci_usuario" />
                                             <asp:BoundField DataField="designado" HeaderText="designado" SortExpression="designado" />
                                         </Columns>
                                     </asp:GridView>


                                     <asp:SqlDataSource ID="sql_horariosel" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_horario] WHERE ([id_horario] = @id_horario)">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="txt_id_horairo" Name="id_horario" PropertyName="Text" Type="Int32" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>

                                  <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                                      <asp:Label ID="Label7" runat="server" Text="Actualizar Hora de Inicio y Fin" Visible="False"></asp:Label>
                            </div>
                                     <div class="input-group mb-1">
                                         <asp:Label ID="Label1" runat="server" Text="Hora de Inicio" Visible="False"></asp:Label>
                                        <asp:TextBox ID="txt_inicio" CssClass ="form-control mt-1 " runat="server" Visible="False"></asp:TextBox>
                                         <asp:Label ID="Label2" runat="server" Text="Hora de Fin" Visible="False"></asp:Label>
                                     <asp:TextBox ID="txt_fin" CssClass ="form-control mt-1 "  runat="server" Visible="False"></asp:TextBox>
                                         <asp:Button ID="Button1" CssClass ="btn btn-outline-primary mt-1 " runat="server" Text="Actualizar Hora de Inicio y Hora de Fin" Visible="False" />
                                         </div>
                                  <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                                      <asp:Label ID="Label8" runat="server" Text="Actualizar Docente" Visible="False"></asp:Label>
                            </div>
                                      <div class="input-group mb-1">
                                          <asp:Label ID="Label3" runat="server" Text="Docente Actual" Visible="False"></asp:Label>
                                          <asp:TextBox ID="txt_docente" CssClass ="form-control mt-1 "  runat="server" Visible="False"></asp:TextBox>
                                          <asp:Label ID="Label4" runat="server" Text="Cambiar por :" Visible="False"></asp:Label>
                                          <asp:DropDownList ID="ddl_docente" runat="server" DataSourceID="sql_docen" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" DataTextField="docente" DataValueField="ci" Visible="False"  ></asp:DropDownList>
                                          <asp:SqlDataSource ID="sql_docen" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (nombres +' '+primerApellido +' '+segundoApellido ) as docente , ci  from tb_personal 
where gestion ='2-2022' 
order by docente" UpdateCommand="UPDATE tb_horario SET ci_doc = @ci WHERE (id_horario = @idhor)">
                                              <UpdateParameters>
                                                  <asp:ControlParameter ControlID="ddl_docente" Name="ci" PropertyName="SelectedValue" />
                                                  <asp:ControlParameter ControlID="txt_id_horairo" Name="idhor" PropertyName="Text" />
                                              </UpdateParameters>
                                          </asp:SqlDataSource>
                                          <asp:Button ID="Button2" runat="server" Text="Actualizar Docente"  CssClass ="btn btn-outline-primary mt-1 " Visible="False" />
                                      </div>
                                  <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                                      <asp:Label ID="Label9" runat="server" Text="Actualizar Dia" Visible="False"></asp:Label>
                            </div>
                                     <div class="input-group mb-1">
                                         <asp:Label ID="Label5" runat="server" Text="Dia Registrado" Visible="False"></asp:Label>
                                         <asp:TextBox ID="txt_dia" CssClass ="form-control mt-1 "  runat="server" Visible="False"></asp:TextBox>
                                         <asp:Label ID="Label6" runat="server" Text="Actualizar por el Dia : " Visible="False"></asp:Label>
                                           <asp:DropDownList ID="ddl_dia" CssClass="form-control btn btn-default border-dark  dropdown-toggle mt-1" runat="server" AutoPostBack="True" Visible="False">
                                    <asp:ListItem>Seleccione un Dia</asp:ListItem>
                                    <asp:ListItem>Lunes</asp:ListItem>
                                    <asp:ListItem>Martes</asp:ListItem>
                                    <asp:ListItem>Miercoles</asp:ListItem>
                                    <asp:ListItem>Jueves</asp:ListItem>
                                    <asp:ListItem>Viernes</asp:ListItem>
                                    <asp:ListItem>Sabado</asp:ListItem>
                                </asp:DropDownList>
                                         <asp:Button ID="Button3" runat="server" Text="Actualizar Dia"  CssClass ="btn btn-outline-primary mt-1 " Visible="False" />
                                     </div> 
                                <asp:Button ID="Button4" CssClass ="btn btn-success mt-1 form-control " runat="server" Text="Volver" Visible="False" />
                                     <asp:SqlDataSource ID="sql_ds_selec" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select d.id_designacion ,h.id_horario , (p.nombres+' '+p.primerApellido +' '+p.segundoApellido )as docente ,d.horas ,h.tipo_clase,m.Materia ,h.dia ,h.hora_inicio ,h.hora_fin,h.grupo  ,d.carrera   from tb_horario h
join tb_designacion d on d.id_horario=h.id_horario 
join tb_personal p on h.ci_doc = p.ci
join planes_estudios m on d.id_materia = m.id_plan 
where h.id_horario=@id and p.gestion ='2-2022'" UpdateCommand="UPDATE tb_horario SET dia = @dia WHERE (id_horario = @idhor)" DeleteCommand="DELETE FROM tb_designacion WHERE (id_horario = @id_horario)">
                                         <DeleteParameters>
                                             <asp:ControlParameter ControlID="txt_id_horairo" Name="id_horario" PropertyName="Text" />
                                         </DeleteParameters>
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="txt_id_horairo" Name="id" PropertyName="Text" />
                                         </SelectParameters>
                                         <UpdateParameters>
                                             <asp:ControlParameter ControlID="ddl_dia" Name="dia" PropertyName="SelectedValue" />
                                             <asp:ControlParameter ControlID="txt_id_horairo" Name="idhor" PropertyName="Text" />
                                         </UpdateParameters>
                                     </asp:SqlDataSource>
                                     <asp:TextBox ID="txt_sede" runat="server" Visible="False"></asp:TextBox>
                                     <asp:TextBox ID="txt_siglacar" runat="server" Visible="False"></asp:TextBox>
                                 </div>
                                </div>
            </div>
      

    </form>

</asp:Content>



