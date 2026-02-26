<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_editar_estado_grupo.aspx.vb" Inherits="DIR_CAR_editar_estado_grupo" MasterPageFile="mp_dir_car.master" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <form runat="server">
        <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
            <asp:Label ID="lbl_cargo" runat="server" Text=""></asp:Label>
        </div>
        <div class=" container-fluid ">
            <div class="row">
<div class="col-md-12 mb-3">
    <div class="card shadow-sm border border-secondary rounded">

        <!-- HEADER -->
        <div class="card-header text-center fw-bold"
             style="background: linear-gradient(90deg, #0d6efd, #0b5ed7); color:white;">
            <i class="bi bi-calendar-x"></i>
            Lista de Horarios para Activar o Inactivar
        </div>

        <!-- BODY -->
        <div class="card-body bg-light">

            <!-- SEDE -->
            <label class="form-label fw-semibold text-dark">Sede</label>
            <asp:DropDownList
                ID="ddl_sede"
                runat="server"
                CssClass="form-select form-select-sm shadow-sm"
                DataSourceID="sql_sede"
                DataTextField="NombreSede"
                DataValueField="idSede"
                AutoPostBack="True">
            </asp:DropDownList>

            <asp:SqlDataSource
                ID="sql_sede"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>"
                SelectCommand="SELECT * FROM tb_sedes WHERE idSede=@idse">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txt_sede" Name="idse" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

            <!-- CARRERA -->
            <label class="form-label fw-semibold text-dark mt-2">Carrera</label>
            <asp:DropDownList
                ID="ddl_carrera"
                runat="server"
                CssClass="form-select mb-2"
                DataSourceID="sql_ds_carrera"
                DataTextField="CARDES"
                DataValueField="CARSIGLA"
                AutoPostBack="True">
            </asp:DropDownList>

            <asp:SqlDataSource
                ID="sql_ds_carrera"
                runat="server"
                ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>"
                SelectCommand="SELECT * FROM tb_carreras WHERE carsigla=@carsigla"
                InsertCommand="
                    INSERT INTO tb_bitacora_eliminacion
                    (id_horario, id_designacion, ci_delete, date_delete, carrera)
                    VALUES
                    (@id_horario, @id_designacion, @ci_delete, GETDATE(), @carrera)">
                
                <InsertParameters>
                    <asp:ControlParameter ControlID="txt_id_horairo" Name="id_horario" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_id_horairo" Name="id_designacion" PropertyName="Text" />
                    <asp:ControlParameter ControlID="lbl_cargo" Name="ci_delete" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                </InsertParameters>

                <SelectParameters>
                    <asp:ControlParameter ControlID="txt_sigla_car" Name="carsigla" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </div>
</div>

             <%--   <div class="col-md-12 p-2 mb-2 bg-white text-white border border-dark rounded ">
                    <div style="background-color: #FFCC00" class="text-md-center  rounded text-bold " role="alert">
                        Lista de Horarios para Eliminar
                    </div>
                    <div class="input-group mb-1"></div>
                    <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="sql_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes] where idSede=@idse">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txt_sede" Name="idse" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DropDownList ID="ddl_carrera" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] where carsigla=@carsigla" InsertCommand="INSERT INTO tb_bitacora_eliminacion (    id_horario,    id_designacion,    ci_delete,    date_delete,    carrera)VALUES(    @id_horario,    @id_designacion,    @ci_delete,    getdate(),    @carrera);">

                        <InsertParameters>
                            <asp:ControlParameter ControlID="txt_id_horairo" Name="id_horario" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_id_horairo" Name="id_designacion" PropertyName="Text" />
                            <asp:ControlParameter ControlID="lbl_cargo" Name="ci_delete" PropertyName="Text" />
                            <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txt_sigla_car" Name="carsigla" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>--%>
                <%--<asp:GridView ID="gv_horarios" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_horarios" Font-Size="10pt" GridLines="None" DataKeyNames="id_horario">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:TemplateField HeaderText="id_d" InsertVisible="False" SortExpression="id_designacion" Visible="False">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("id_designacion") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id_designacion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estado de la clase" SortExpression="estado_clase">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("estado_clase") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="clase_teorica" runat="server" SelectedValue='<%# Bind("estado_clase") %>'>
                                    <asp:ListItem>Activo</asp:ListItem>
                                    <asp:ListItem>Inactivo</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id_horario" HeaderText="id_h" SortExpression="id_horario" ReadOnly="True" />
                        <asp:BoundField DataField="docente" HeaderText="docente" SortExpression="docente" ReadOnly="True" />
                        <asp:BoundField DataField="horas" HeaderText="horas" SortExpression="horas" ReadOnly="True" />
                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo de clase" SortExpression="tipo_clase" ReadOnly="True" />
                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" ReadOnly="True" />
                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" ReadOnly="True" />
                        <asp:BoundField DataField="hora_inicio" HeaderText="hora de inicio" SortExpression="hora_inicio" ReadOnly="True" />
                        <asp:BoundField DataField="hora_fin" HeaderText="hora de fin" SortExpression="hora_fin" ReadOnly="True" />
                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" ReadOnly="True" />
                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aulab" SortExpression="nom_aula_lab" ReadOnly="True" />
                        <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" Visible="false" ReadOnly="True" />
                        <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" ReadOnly="True" />
                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" ReadOnly="True" />
                        <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" Visible="false" />
                        <asp:BoundField DataField="ci_usuario" HeaderText="ci_usuario" SortExpression="ci_usuario" Visible="false" />

                    </Columns>
                    <HeaderStyle BackColor="#D4EDDA" />
                </asp:GridView>--%>

                <div class=" container-fluid ">
                    <asp:GridView
                        ID="gv_horarios"
                        runat="server"
                        CssClass="table table-hover mt-1"
                        AutoGenerateColumns="False"
                        DataSourceID="sql_horarios"
                        DataKeyNames="id_horario"
                        Font-Size="10pt"
                        GridLines="None" Font-Names="Consolas">

                        <Columns>


                            <asp:CommandField ShowEditButton="True" />


                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <%# Eval("id_designacion") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Estado de la clase">
                                <ItemTemplate>
                                    <span class='<%# If(Eval("estado_clase").ToString()="Activo","badge bg-success","badge bg-danger") %>'
                                        style="font-size: 10px; padding: 8px 8px; font-weight: 600; border-radius: 8px;">
                                        <%# Eval("estado_clase") %>
                                    </span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList
                                        ID="ddl_estado"
                                        runat="server"
                                        Style="font-size: 14px;"
                                        SelectedValue='<%# Bind("estado_clase") %>'>
                                        <asp:ListItem>Activo</asp:ListItem>
                                        <asp:ListItem>Inactivo</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Clase">
                                <ItemTemplate>
                                    <strong><%# Eval("Materia") %></strong><br />
                                    <%# Eval("tipo_clase") %><br />
                                    <small class="text-muted">
                                        <%# Eval("dia") %> |
                    <%# Eval("hora_inicio","{0:HH:mm}") %> -
                    <%# Eval("hora_fin","{0:HH:mm}") %>
                                    </small>
                                    <br />
                                    Aula: <%# Eval("nom_aula_lab") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="grupo" HeaderText="grupo" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Docente">
                                <ItemTemplate>
                                    <%# Eval("docente") %>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:BoundField DataField="Semestre" HeaderText="Semestre" ReadOnly="True" />


                            <asp:BoundField DataField="gestion" HeaderText="Gestión" ReadOnly="True" />

                        </Columns>

                        <HeaderStyle BackColor="#D4EDDA" />
                    </asp:GridView>
                </div>
                <asp:SqlDataSource ID="sql_horarios" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select d.id_designacion ,h.id_horario , (p.nombres+' '+p.primerApellido +' '+p.segundoApellido )as docente ,d.horas ,h.tipo_clase,m.Materia ,h.dia ,h.hora_inicio ,h.hora_fin,h.grupo,a.nom_aula_lab   ,d.carrera,m.Semestre  ,h.gestion ,h.fecha_registro ,ci_usuario ,h.estado_clase
  from tb_horario h
join tb_designacion d on d.id_horario=h.id_horario 
join tb_personal p on h.ci_doc = p.ci
join planes_estudios m on d.id_materia = m.id_plan 
join tb_aula a on h.aula = a.id_nomal 
where h.gestion ='1-2026' and p.gestion ='1-2026' and d.carrera =@carrera and h.sede =@sede and a.gestion='1-2024'
order by m.Semestre "
                    UpdateCommand="UPDATE tb_horario SET estado_clase = @estado_clase where id_horario=@id_horario" DeleteCommand="DELETE FROM tb_horario WHERE (id_horario = @id_horario)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="txt_id_horairo" Name="id_horario" PropertyName="Text" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="estado_clase" Type="String" />
                        <asp:Parameter Name="id_horario" Type="Int32" />
                    </UpdateParameters>

                </asp:SqlDataSource>
                <asp:TextBox ID="txt_id_horairo" runat="server" Visible="False"></asp:TextBox>
                <div class="input-group mb-1">
                </div>
                <asp:SqlDataSource ID="sql_ds_selec" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select d.id_designacion ,h.id_horario , (p.nombres+' '+p.primerApellido +' '+p.segundoApellido )as docente ,d.horas ,h.tipo_clase,m.Materia ,h.dia ,h.hora_inicio ,h.hora_fin,h.grupo  ,d.carrera   from tb_horario h
join tb_designacion d on d.id_horario=h.id_horario 
join tb_personal p on h.ci_doc = p.ci
join planes_estudios m on d.id_materia = m.id_plan 
where h.id_horario=@id and p.gestion ='2-2025'"
                    UpdateCommand="update tb_designacion 
set horas =@horas
where id_designacion =@idd"
                    DeleteCommand="DELETE FROM tb_designacion WHERE (id_horario = @id_horario)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="txt_id_horairo" Name="id_horario" PropertyName="Text" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txt_id_horairo" Name="id" PropertyName="Text" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txt_hora" Name="horas" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_id_desig" Name="idd" PropertyName="Text" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:TextBox ID="txt_sede" runat="server"></asp:TextBox>
                <asp:TextBox ID="txt_sigla_car" runat="server"></asp:TextBox>

            </div>
        </div>
        </div>
         </div>

    </form>

</asp:Content>



