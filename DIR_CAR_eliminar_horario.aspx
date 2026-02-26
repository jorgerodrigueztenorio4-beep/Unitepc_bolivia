<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_eliminar_horario.aspx.vb" Inherits="DIR_CAR_eliminar_horario" MasterPageFile="mp_dir_car.master" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <form runat="server">
        <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
            <asp:Label ID="lbl_cargo" runat="server" Text=""></asp:Label>
        </div>
        <div class=" container-fluid ">
            <div class="row">

                <div class="col-md-12 p-2 mb-2 bg-white text-white border border-dark rounded ">
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
                    <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] where carsigla=@carsigla" InsertCommand="INSERT INTO tb_bitacora_eliminacion
(
    id_horario,
    id_designacion,
    ci_delete,
    date_delete,
    carrera,
objeto
)
VALUES
(
    @id_horario,
    @id_designacion,
    @ci_delete,
    getdate(),
    @carrera,
@objeto
);
">
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txt_id_horairo" Name="id_horario" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_id_horairo" Name="id_designacion" PropertyName="Text" />
                            <asp:ControlParameter ControlID="lbl_cargo" Name="ci_delete" PropertyName="Text" />
                            <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="txt_objeto" Name="objeto" PropertyName="Text" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txt_sigla_car" Name="carsigla" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <asp:GridView ID="gv_horarios" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_horarios" Font-Size="10pt" GridLines="None">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True"
                            ButtonType="Button"
                            ControlStyle-CssClass="btn btn-danger"
                            SelectText="Eliminar">
                            <ControlStyle CssClass="btn btn-danger"></ControlStyle>
                        </asp:CommandField>
                        <asp:BoundField DataField="id_designacion" HeaderText="id_d" InsertVisible="False" ReadOnly="True" SortExpression="id_designacion" />
                        <asp:BoundField DataField="id_horario" HeaderText="id_h" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                        <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                        <asp:BoundField DataField="horas" HeaderText="horas" SortExpression="horas" />
                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo de clase" SortExpression="tipo_clase" />
                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                        <asp:BoundField DataField="hora_inicio" HeaderText="hora de inicio" SortExpression="hora_inicio" />
                        <asp:BoundField DataField="hora_fin" HeaderText="hora de fin" SortExpression="hora_fin" />
                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aulab" SortExpression="nom_aula_lab" />
                        <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                        <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" />
                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                        <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" Visible="false" />
                        <asp:BoundField DataField="ci_usuario" HeaderText="ci_usuario" SortExpression="ci_usuario" Visible="false" />
                    </Columns>
                    <HeaderStyle BackColor="#D4EDDA" />
                </asp:GridView>
                <asp:SqlDataSource ID="sql_horarios" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select d.id_designacion ,h.id_horario , (p.nombres+' '+p.primerApellido +' '+p.segundoApellido )as docente ,d.horas ,h.tipo_clase,m.Materia ,h.dia ,h.hora_inicio ,h.hora_fin,h.grupo,a.nom_aula_lab   ,d.carrera,m.Semestre  ,h.gestion ,h.fecha_registro ,ci_usuario 
  from tb_horario h
join tb_designacion d on d.id_horario=h.id_horario 
join tb_personal p on h.ci_doc = p.ci
join planes_estudios m on d.id_materia = m.id_plan 
join tb_aula a on h.aula = a.id_nomal 
where h.gestion ='1-2026' and p.gestion ='1-2026' and d.carrera =@carrera and h.sede =@sede and a.gestion='1-2024'
order by m.Semestre "
                    UpdateCommand="update d set d.horas =@horas
 from tb_horario h
join tb_designacion d on d.id_horario=h.id_horario 
join tb_personal p on h.ci_doc = p.ci 
where h.gestion  ='2-2025' and d.id_designacion =@id_designacion"
                    DeleteCommand="DELETE FROM tb_horario WHERE (id_horario = @id_horario)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="txt_id_horairo" Name="id_horario" PropertyName="Text" />
                    </DeleteParameters>
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
                <asp:TextBox ID="txt_objeto" runat="server"></asp:TextBox>

            </div>
        </div>
        </div>
         </div>
               <asp:SqlDataSource ID="SQL_DS_HABILITAR_HORARIO" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_habilitados, carrera, habilitacion, SEDE, fecha_modificacion FROM tb_habilitaciones_horarios WHERE (SEDE = @sede) AND (carrera = @carrera)">
               <SelectParameters>
                   <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                   <asp:ControlParameter ControlID="txt_sigla_car" Name="carrera" PropertyName="Text" />
               </SelectParameters>
           </asp:SqlDataSource>

        <asp:TextBox ID="txt_sigla_carrera" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_id_sede" runat="server"></asp:TextBox>
    </form>

</asp:Content>



