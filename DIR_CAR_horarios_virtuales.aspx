<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_horarios_virtuales.aspx.vb" Inherits="DIR_CAR_horarios_virtuales" MasterPageFile="~/mp_dir_car.master" EnableEventValidation="false" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <form runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Horario de la Gestion Actual</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">

                        <li class="breadcrumb-item active">
                            <asp:Label ID="lbl_cargo" runat="server" Text=""></asp:Label></li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <!-- AREA CHART -->
                    <div class="card card-indigo">
                        <div class="card-header">
                            <h3 class="card-title">Horario</h3>


                        </div>
                        <div class="card-body">
                            <asp:DropDownList ID="ddl_Gestion" CssClass=" form-control mt-1 " runat="server" AutoPostBack="True">
                                <asp:ListItem>Seleccione una Gestión</asp:ListItem>
                                <asp:ListItem>1-2024</asp:ListItem>
                                <asp:ListItem>2-2024</asp:ListItem>
                                <asp:ListItem>1-2025</asp:ListItem>
                                <asp:ListItem>2-2025</asp:ListItem>
                                <asp:ListItem>1-2026</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="Button1" CssClass="btn btn-outline-primary  form-control mt-1  " runat="server" Text="Exportar a Excel" Visible="False" />
                            <asp:TextBox ID="txt_idhora" runat="server"></asp:TextBox>

                            <asp:Label ID="lbl_contador" runat="server" Text="Label"></asp:Label>
                            <div class="table-scroll">
                                <asp:UpdatePanel ID="upHorarios" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView
                                            ID="gv_horarios_v"
                                            runat="server"
                                            CssClass="table table-hover table-sm mt-1"
                                            AutoGenerateColumns="False"
                                            DataSourceID="sql_virtuales"
                                            OnRowCommand="gv_horarios_v_RowCommand"
                                            DataKeyNames="id_horario"
                                            Font-Size="9pt"
                                            Font-Names="Consolas"
                                            GridLines="None">



                                            <Columns>

                                                <asp:TemplateField HeaderText="Acciones">
                                                    <ItemTemplate>


                                                        <asp:LinkButton
                                                            ID="btnModal"
                                                            runat="server"
                                                            CssClass="btn btn-sm btn-primary"
                                                            CommandName="modal"
                                                            CommandArgument="<%# Container.DataItemIndex %>"
                                                            CausesValidation="false"
                                                            UseSubmitBehavior="false">
                                                        <i class="fas fa-eye"></i>

                                                        </asp:LinkButton>





                                                        <asp:LinkButton
                                                            ID="btnEliminar"
                                                            runat="server"
                                                            CssClass="btn btn-sm btn-danger"
                                                            CommandName="eliminar"
                                                            CommandArgument="<%# Container.DataItemIndex %>"
                                                            
                                                            OnClientClick="return confirm('¿Está seguro de eliminar este registro?');" >
                                                            <i class="fa fa-trash"></i>
                                                            
                                                        </asp:LinkButton>

                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>


                                                <asp:BoundField
                                                    DataField="id_horario"
                                                    HeaderText="Id."
                                                    Visible="true" />

                                                <asp:TemplateField HeaderText="Docente">
                                                    <ItemTemplate>
                                                        <div>
                                                            <strong>Docente: <%# Eval("docente") %></strong><br />
                                                            <strong>C.I.: <%# Eval("ci_doc") %></strong>
                                                        </div>
                                                    </ItemTemplate>
                                                    <ItemStyle BackColor="#FFE6E6" />
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
                                                        <span class="badge bg-info" style="font-size: 9pt; padding: 6px 10px;">
                                                            <%# Eval("hora_inicio") %> - <%# Eval("hora_fin") %></span>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>

                                                <asp:BoundField
                                                    DataField="tipo_clase"
                                                    HeaderText="Tipo de Clase">
                                                    <ItemStyle BackColor="#E6FFE7" />
                                                </asp:BoundField>


                                                <asp:TemplateField HeaderText="Materia">
                                                    <ItemTemplate>
                                                        <div>
                                                            <strong><%# Eval("Materia") %></strong><br />
                                                            <%# Eval("SiglaP") %>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:BoundField
                                                    DataField="Sis_plan"
                                                    HeaderText="Plan" />


                                                <asp:BoundField
                                                    DataField="Column1"
                                                    HeaderText="Común">
                                                    <ItemStyle BackColor="#E6F1FF" />
                                                </asp:BoundField>



                                                <asp:BoundField
                                                    DataField="gestion"
                                                    HeaderText="Gestión" />

                                            </Columns>

                                            <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />

                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>





                            <asp:SqlDataSource ID="sql_virtuales" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,replace((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ),'a a a','--* Sin Asignar Docente *--')as docente,a.nom_aula_lab , th.hora_inicio ,th.hora_fin,th.dia,th.tipo_clase  ,p.SiglaP,p.Materia,p.Sis_plan,isnull(td.comun,'No es Comun') ,th.grupo ,th.gestion
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan
 join tb_aula a on th.aula = a.id_nomal  
where td.carrera =@carrera and th.gestion =@gestion and tp.gestion =@gestion and th.sede =@sede  and a.gestion ='1-2024'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END,hora_inicio "
                                DeleteCommand="delete tb_horario where id_horario =@id_hor" UpdateCommand="UPDATE tb_horario SET ci_doc = @ci_doc WHERE (id_horario = @id_horario)">
                                <DeleteParameters>
                                    <asp:ControlParameter ControlID="txt_idhora" Name="id_hor" PropertyName="Text" />
                                </DeleteParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txt_sigla_car" Name="carrera" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="ddl_Gestion" Name="gestion" PropertyName="SelectedValue" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="id_horario" />
                                    <asp:Parameter Name="ci_doc" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:TextBox ID="txt_sigla_car" runat="server" Visible="False"></asp:TextBox>
                            <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]" DeleteCommand="delete tb_designacion where id_horario =@idhora" InsertCommand="INSERT INTO tb_bitacora_eliminacion
(
    id_horario,
    id_designacion,
    ci_delete,
    date_delete,
    carrera
)
VALUES
(
    @id_horario,
    @id_designacion,
    @ci_delete,
    getdate(),
    @carrera
);
">
                                <DeleteParameters>
                                    <asp:ControlParameter ControlID="txt_idhora" Name="idhora" PropertyName="Text" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="txt_idhora" Name="id_horario" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_idhora" Name="id_designacion" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_sigla_car" Name="ci_delete" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_sigla_car" Name="carrera" PropertyName="Text" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                            <asp:TextBox ID="txt_sede" runat="server" Visible="False"></asp:TextBox>

                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->

                    <!-- DONUT CHART -->

                    <!-- /.card -->

                    <!-- PIE CHART -->

                    <!-- /.card -->

                </div>
                <!-- /.col (LEFT) -->

                <!-- /.card -->

                <!-- STACKED BAR CHART 
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Stacked Bar Chart</h3>

              
              </div>
              <div class="card-body">
                
              </div>
           /.card-body -->
            </div>
            <!-- /.card -->

        </div>
        <!-- /.col (RIGHT) -->
        </div>
        <!-- /.row -->
        </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
    </div>


    <div class="modal fade" id="miModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 50%;" role="document">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Detalle Horario completo mas las Comunes</h5>
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    ID Horario:
       
                    <asp:Label ID="lblIdHorario" runat="server" />
                   <asp:GridView
    ID="gv_detalle"
    runat="server"
    AutoGenerateColumns="False"
    DataSourceID="sql_detalle"
    CssClass="table table-sm table-striped" Font-Names="Consolas" Font-Size="9pt">

    <Columns>

              
        <asp:TemplateField HeaderText="Docente">
            <ItemTemplate>
                <div>
                    <strong>Docente : <%# Eval("docente") %></strong><br /><span class="text-muted">CI: <%# Eval("ci_doc") %></span>
                </div>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula / Lab" />

         <asp:BoundField DataField="dia" HeaderText="Día" />

        <asp:TemplateField HeaderText="Horario">
            <ItemTemplate>
                <span class="badge badge-info" style="font-size: 9pt;">
                    <%# Eval("hora_inicio") %> - <%# Eval("hora_fin") %>
                </span>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>

       <asp:BoundField DataField="codcar" HeaderText="carrera" />

        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo" />
<asp:BoundField DataField="grupo" HeaderText="Grupo" />
       
        <asp:TemplateField HeaderText="Materia">
            <ItemTemplate>
                <strong><%# Eval("Materia") %></strong><br />
                <small class="text-muted"><%# Eval("SiglaP") %></small>
            </ItemTemplate>
        </asp:TemplateField>

        
        
        
        <asp:BoundField DataField="gestion" HeaderText="Gestión" />

    </Columns>
</asp:GridView>

                    <asp:SqlDataSource ID="sql_detalle" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,replace((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ),'a a a','--* Sin Asignar Docente *--')as docente,a.nom_aula_lab , th.hora_inicio ,th.hora_fin,th.dia,th.tipo_clase,p.codcar   ,p.SiglaP,p.Materia,p.Sis_plan ,th.grupo ,th.gestion
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan
 join tb_aula a on th.aula = a.id_nomal  
where td.id_horario =@idhorario and th.gestion =@gestion and tp.gestion =@gestion">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblIdHorario" Name="idhorario" PropertyName="Text" />
                            <asp:ControlParameter ControlID="ddl_Gestion" Name="gestion" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

            </div>
        </div>
    </div>
</form>
</asp:Content>



