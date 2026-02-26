<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_designar_comun.aspx.vb" Inherits="DIR_CAR_designar_comun" MasterPageFile="mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                               Seleccione la clase y al Docente en la Sgte. Lista para Asignarle una materia Comun
                            </div>
                                 <div class="input-group mb-1">
                                     <asp:DropDownList ID="ddl_sede_origen" CssClass="form-control btn btn-default border-dark dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT idSede, NombreSede, nombrecorto FROM tb_sedes WHERE (idSede = @idsede)">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="txt_id_sede" Name="idsede" PropertyName="Text" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>
                                     <asp:DropDownList ID="ddl_carrera_origen" CssClass="form-control btn btn-default border-dark dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_carreras_origen" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True"></asp:DropDownList>
                                 </div>
                                <asp:DropDownList ID="ddl_clases_prog" CssClass="form-control btn btn-default border-dark dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_clases_prog" DataTextField="Expr1" DataValueField="id_horario" Font-Names="Consolas" Font-Size="9pt"></asp:DropDownList>
                                   
                                               </ContentTemplate>
                                           </asp:UpdatePanel>

                                           <asp:SqlDataSource ID="sql_ds_clases_prog" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT th.id_horario, REPLACE(tp.nombres + ' ' + tp.primerApellido + ' ' + tp.segundoApellido, 'a a a', '--* Sin Asignar Docente *--') + '--&gt; MATERIA: ' + p.Materia + '---&gt; Dia:' + th.dia + '---&gt;Tipo de Clase: ' + th.tipo_clase + '---&gt;Horas:' + th.hora_inicio + ' a ' + th.hora_fin AS Expr1 FROM tb_horario AS th INNER JOIN tb_designacion AS d ON d.id_horario = th.id_horario INNER JOIN tb_personal AS tp ON th.ci_doc = tp.ci INNER JOIN planes_estudios AS p ON d.id_materia = p.id_plan WHERE (th.gestion = '1-2026') AND (tp.gestion = '1-2026') AND (d.carrera = @carrera) AND (th.sede = @sede)" UpdateCommand="UPDATE tb_horario SET designado = 'Si' WHERE (id_horario = @id_horario)">
                                               <SelectParameters>
                                                   <asp:ControlParameter Name="carrera" ControlID="ddl_carrera_origen" PropertyName="SelectedValue" />
                                                   <asp:ControlParameter Name="sede" ControlID="ddl_sede_origen" PropertyName="SelectedValue" />
                                               </SelectParameters>
                                               <UpdateParameters>
                                                   <asp:ControlParameter ControlID="ddl_clases_prog" Name="id_horario" PropertyName="SelectedValue" />
                                               </UpdateParameters>
                                           </asp:SqlDataSource>


                                    <asp:GridView ID="gv_horarioscreados" runat="server" CssClass="table table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_horacreada" Font-Size="9pt">
                                               <Columns>
                                                   <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                                   <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                                   <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                                   <asp:BoundField DataField="nombre_clase" HeaderText="nombre_clase" SortExpression="nombre_clase" visible="false" />
                                                   
                                                   <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                                   <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                                   <asp:BoundField DataField="Hra_academica" HeaderText="Hra_academica" SortExpression="Hra_academica" ReadOnly="True" />
                                                   <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" Visible="false" />
                                                   <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                                   
                                                   <asp:BoundField DataField="link_clase" HeaderText="link_clase" SortExpression="link_clase" />
                                                   <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" Visible ="false"  />
                                                   <asp:BoundField DataField="aula" HeaderText="aula" SortExpression="aula"  Visible ="false" />
                                                   
                                               </Columns>
                                           </asp:GridView>
                                               <asp:SqlDataSource ID="sql_ds_horacreada" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_horario, nombre_clase, DATEDIFF(SS, hora_inicio, hora_fin) / 60 / 45 AS Hra_academica, hora_inicio, hora_fin, ci_doc, grupo, dia, link_clase, bloque, aula, tipo_clase FROM tb_horario WHERE (id_horario = @idhorario)">
                                                   <SelectParameters>
                                                       <asp:ControlParameter ControlID="ddl_clases_prog" Name="idhorario" PropertyName="SelectedValue" />
                                                   </SelectParameters>
                                           </asp:SqlDataSource>

                                    <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold mt-1" role="alert">
                                Datos Para Designar una Materia Comun
                            </div>



                                <asp:DropDownList ID="ddl_sede" runat="server"  CssClass="form-control btn btn-default dropdown-toggle mt-1"  DataSourceID="sql_ds_horario" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Selecicone una Sede</asp:ListItem>
                                </asp:DropDownList>


                                <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_facultad"  CssClass="form-control btn btn-default dropdown-toggle mt-1"  runat="server" DataSourceID="sql_ds_facul" DataTextField="FACDES" DataValueField="FACCOD" AutoPostBack="True" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione una Facultad</asp:ListItem>
                                </asp:DropDownList>

                                <asp:SqlDataSource ID="sql_ds_facul" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_facultades]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_carreras"  CssClass="form-control btn btn-default dropdown-toggle mt-1"   runat="server" DataSourceID="sql_ds_carreras" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione una Carrera</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_carreras" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] WHERE ([FACULTAD] = @FACULTAD)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_facultad" Name="FACULTAD" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="sql_ds_carreras_origen" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_carrera, CARSIGLA, CARDES, FACULTAD FROM tb_carreras WHERE (CARSIGLA = @carsigla)">
                                    <SelectParameters>
                                        <asp:ControlParameter Name="carsigla" ControlID="txt_sigla_carrera" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                     <asp:DropDownList ID="ddl_ant_nuevo"  CssClass="form-control btn btn-default dropdown-toggle mt-1"  runat="server" AutoPostBack="True">
                                    <asp:ListItem>Saleccione el Tipo de Plan</asp:ListItem>
                                    <asp:ListItem Value="A">Plan Antiguo</asp:ListItem>
                                    <asp:ListItem Value="N">Plan Nuevo</asp:ListItem>
                                </asp:DropDownList>

                                    <asp:DropDownList ID="ddl_materias" runat="server"  CssClass="form-control btn btn-default dropdown-toggle mt-1"   AutoPostBack="True" DataSourceID="sql_ds_materias" DataTextField="Materia" DataValueField="id_plan" AppendDataBoundItems="True">
                                        <asp:ListItem Value="0">Seleccione una Materia</asp:ListItem>
                                </asp:DropDownList>
                                         
                                           <asp:SqlDataSource ID="sql_ds_materias" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [planes_estudios] WHERE (([Sede_id] = @Sede_id) AND ([codcar] = @codcar) AND ([Sis_plan] = @Sis_plan))">
                                               <SelectParameters>
                                                   <asp:ControlParameter ControlID="ddl_sede" Name="Sede_id" PropertyName="SelectedValue" Type="Int32" />
                                                   <asp:ControlParameter ControlID="ddl_carreras" Name="codcar" PropertyName="SelectedValue" Type="String" />
                                                   <asp:ControlParameter ControlID="ddl_ant_nuevo" Name="Sis_plan" PropertyName="SelectedValue" Type="String" />
                                               </SelectParameters>
                                           </asp:SqlDataSource>

                                <asp:Button ID="Button1" runat="server" CssClass ="btn btn-primary form-control m-1 " Text="Agregar Materia Comun" />

                                </div>
             <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                                Datos de las Materias Comunes
                            </div>
                               
            <asp:GridView ID="gv_clase" runat="server" CssClass="table table-hover mt-1 "  AutoGenerateColumns="False" DataSourceID="sql_ds_clase" Font-Size="10pt"  >
                <Columns>
                    <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                    <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                    <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                    <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                    <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                    <asp:BoundField DataField="codcar" HeaderText="Sigla de la Carrera" SortExpression="codcar" />
                </Columns>
                            <HeaderStyle BackColor="#32BDCF" Font-Size="9pt" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="sql_ds_clase" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.dia ,th.hora_inicio ,th.hora_fin,tipo_clase,p.Materia,p.codcar    from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join planes_estudios p on td.id_materia = p.id_plan 
where 
 th.id_horario =@idclase" InsertCommand="INSERT INTO tb_designacion(id_horario, id_materia, fecha_creacion, id_sede, plan_est, horas, comun, carrera) VALUES (@idhorario, @id_materia, GETDATE(), @sede, @plan , '0', 'C', @carrera)" UpdateCommand="UPDATE tb_designacion SET comun = 'C' WHERE (id_horario = @id_horario)">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="ddl_clases_prog" Name="idhorario" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="ddl_materias" Name="id_materia" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="ddl_ant_nuevo" Name="plan" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="ddl_carreras" Name="carrera" PropertyName="SelectedValue" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddl_clases_prog" Name="idclase" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:ControlParameter ControlID="ddl_clases_prog" Name="id_horario" PropertyName="SelectedValue" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                  </div>
            </div>
         </div>
           <br />
        <br />
        <br />
        <br />
           <asp:TextBox ID="txt_ciusuario" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="txt_id_sede" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="txt_sigla_carrera" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="txt_sede" runat="server" Visible="False"></asp:TextBox>

        </form>



</asp:Content>


