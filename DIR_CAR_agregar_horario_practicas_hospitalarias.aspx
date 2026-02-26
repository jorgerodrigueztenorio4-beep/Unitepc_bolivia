<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_agregar_horario_practicas_hospitalarias.aspx.vb" Inherits="DIR_CAR_agregar_horario_practicas_hospitalarias" MasterPageFile="mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <form runat="server" >
    <div class="mt-4">
        <div class="row">

            <!-- Columna izquierda: Formulario -->
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <strong>Datos para el registro</strong>
                    </div>
                    <div class="card-body">


                        <div class="form-group">
                            <label for="email">Materia</label>
                            <asp:DropDownList ID="ddl_materia" class="form-control" runat="server" DataSourceID="sql_ds_materia" DataTextField="materia" DataValueField="id_plan"></asp:DropDownList>
                            <asp:SqlDataSource ID="sql_ds_materia" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_plan ,Materia+ ' (' + SiglaP +')' as materia FROM [planes_estudios] WHERE ([codcar] = @codcar) and Sede_id=@sede" InsertCommand="INSERT INTO tb_horario_practicas
(
    
    sede,
    gestion,
    materia,
    grupo,
    fecha_inicio,
    fecha_conclusion,
    hora_inicio,
    hora_fin,
    hospital,
    ci_doc,carrera)
VALUES
(
    
    @sede,
    '1-2026',
    @materia,
    @grupo,
    @fecha_inicio,
    @fecha_conclusion,
    @hora_inicio,
    @hora_fin,
    @hospital,
    '0',@carrera
);">
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="ddl_materia" Name="materia" PropertyName="SelectedValue" />
                                    <asp:ControlParameter ControlID="txt_grupo" Name="grupo" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="calendar_inicio" Name="fecha_inicio" PropertyName="SelectedDate" />
                                    <asp:ControlParameter ControlID="calendar_fin" Name="fecha_conclusion" PropertyName="SelectedDate" />
                                    <asp:ControlParameter ControlID="txt_hra_inicio" Name="hora_inicio" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_hra_fin" Name="hora_fin" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_hospital" Name="hospital" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txt_sigla_carrera" Name="carrera" PropertyName="Text" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txt_sigla_carrera" Name="codcar" PropertyName="Text" Type="String" />
                                    <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div class="form-group">
                            <label for="email">Grupo</label>
                            <asp:TextBox ID="txt_grupo" class="form-control" runat="server"></asp:TextBox>
                        </div>
                  <%--      <div class="card">
                            <div class="row g-3">
                                <!--begin::Col-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Fecha de Inicio</label>
                                        <asp:Calendar ID="calendar_inicio" runat="server" Font-Size="9pt"></asp:Calendar>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Fecha de Conclusion</label>
                                        <asp:Calendar ID="calendar_fin" runat="server" Font-Size="9pt"></asp:Calendar>
                                    </div>
                                </div>

                            </div>
                        </div>--%>

                        <div class="card shadow-sm p-3">
    <div class="row g-3">

        <!-- Fecha Inicio -->
        <div class="col-md-6">
            <div class="form-group">
                <label class="fw-bold text-primary">Fecha de Inicio</label>

                <div class="calendar-box">
                    <asp:Calendar 
                        ID="calendar_inicio" 
                        runat="server" 
                        CssClass="calendar-modern"
                        Font-Size="9pt">
                    </asp:Calendar>
                </div>
            </div>
        </div>

        <!-- Fecha Fin -->
        <div class="col-md-6">
            <div class="form-group">
                <label class="fw-bold text-primary">Fecha de Conclusión</label>

                <div class="calendar-box">
                    <asp:Calendar 
                        ID="calendar_fin" 
                        runat="server" 
                        CssClass="calendar-modern"
                        Font-Size="9pt">
                    </asp:Calendar>
                </div>
            </div>
        </div>

    </div>
</div>



                        <div class="card">
                            <div class="row g-3">
                                <!--begin::Col-->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Hora de inicio</label>
                                        <asp:TextBox ID="txt_hra_inicio" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Hora de fin</label>
                                        <asp:TextBox ID="txt_hra_fin" class="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email">Hospital</label>
                            <asp:TextBox ID="txt_hospital" class="form-control" runat="server"></asp:TextBox>
                        </div>
                        <asp:Button ID="Button1" class="btn btn-primary btn-block" runat="server" Text="Guardar" />
                    </div>
                </div>
            </div>

            <!-- Columna derecha: Lista -->
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <strong>Horarios de Practicas</strong>
                    </div>
                    <div class="card-body p-0">

                       <%-- <asp:GridView ID="gv_materias" runat="server" DataSourceID="sql_ds_horarios_practicas" AutoGenerateColumns="False">
                            <Columns>
                                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" />
                                <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                <asp:BoundField DataField="fecha_inicio" HeaderText="fecha_inicio" SortExpression="fecha_inicio" />
                                <asp:BoundField DataField="fecha_conclusion" HeaderText="fecha_conclusion" SortExpression="fecha_conclusion" />
                                <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                <asp:BoundField DataField="hospital" HeaderText="hospital" SortExpression="hospital" />
                                <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                            </Columns>
                        </asp:GridView>--%>

                        <asp:GridView 
    ID="gv_materias" 
    runat="server" 
    DataSourceID="sql_ds_horarios_practicas"
    AutoGenerateColumns="False"
    CssClass="table table-sm table-bordered table-hover" Font-Names="Consolas" Font-Size="9pt">

    <Columns>

       
        <asp:TemplateField HeaderText="Materia">
            <ItemTemplate>
                <strong>Materia: <%# Eval("Materia") %></strong>
                <br />
                
                <span class="text-muted">
                    <strong>Sigla de la materia: <%# Eval("SiglaP") %></strong>
                    <br />
                    <strong>Semestre: <%# Eval("Semestre") %></strong>
                </span>
            </ItemTemplate>
        </asp:TemplateField>

       
        <asp:BoundField DataField="grupo" HeaderText="Grupo" />

        
        <asp:TemplateField HeaderText="Periodo">
            <ItemTemplate>
                <%# Eval("fecha_inicio", "{0:dd/MM/yyyy}") %> <br />hasta<br /> <%# Eval("fecha_conclusion", "{0:dd/MM/yyyy}") %>
                <br />
                <small class="text-muted">
                   
                </small>
            </ItemTemplate>
        </asp:TemplateField>

        
        <asp:TemplateField HeaderText="Horario">
            <ItemTemplate>
                <%# Eval("hora_inicio", "{0:HH:mm}") %> 
                -
                <%# Eval("hora_fin", "{0:HH:mm}") %>
            </ItemTemplate>
        </asp:TemplateField>

        
        <asp:BoundField DataField="hospital" HeaderText="Hospital" />

        <asp:TemplateField HeaderText="Docente">
            <ItemTemplate>
               <strong> Docente : <%# Eval("docente") %></strong>
                <br />
                <small class="text-muted">
                    CI : <%# Eval("ci_doc") %>
                </small>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="carrera" HeaderText="Carrera" />

    </Columns>
</asp:GridView>


                        <asp:SqlDataSource ID="sql_ds_horarios_practicas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT p.Materia,p.SiglaP ,p.Semestre ,hp.grupo,hp.fecha_inicio,hp.fecha_conclusion,hp.hora_inicio,hp.hora_fin,hp.hospital,replace((per.nombres+' '+per.primerApellido +' '+per.segundoApellido ),'a a a',' Sin Asignar Docente ')AS docente ,hp.ci_doc ,hp.carrera FROM tb_horario_practicas hp INNER JOIN planes_estudios p ON hp.materia= p.id_plan INNER JOIN tb_personal per ON hp.ci_doc=per.ci WHERE per.gestion ='1-2026' AND hp.sede=@sede AND hp.carrera=@carrera">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txt_sigla_carrera" Name="carrera" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>
                </div>
            </div>

        </div>
    </div>
    <asp:TextBox ID="txt_sede" runat="server"></asp:TextBox>
    <asp:TextBox ID="txt_sigla_carrera" runat="server"></asp:TextBox>
        </form>
</asp:Content>


