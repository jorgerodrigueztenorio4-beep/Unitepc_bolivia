<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_NAL_con_sin_docente_detallado.aspx.vb" Inherits="DAF_NAL_con_sin_docente_detallado" MasterPageFile="~/mp_daf_nacional.master" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <form id="form1" runat="server">
        <h2>Materias con y sin docente detallado</h2>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box">
                            <span class="info-box-icon bg-success elevation-1"><i class="fas fa-reply"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Cantidad de clases de la gestion anterior</span>
                                <span class="info-box-number">
                                    <asp:Label ID="lbl_anterior_ges" runat="server" Text="Label"></asp:Label>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-sm-6 col-md-3">
                        <div class="info-box mb-3">
                            <span class="info-box-icon bg-info elevation-1"><i class="fas fa-share"></i></span>

                            <div class="info-box-content">
                                <span class="info-box-text">Cantidad de clases de la gestion actual</span>
                                <span class="info-box-number">
                                    <asp:Label ID="lbl_actual_ges" runat="server" Text="Label"></asp:Label>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="card card-default">
            <div class="card-header">
                <h3 class="card-title">Seleccione una sede y una carrera</h3>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Sede</label>
                            <asp:DropDownList ID="ddl_sede" CssClass="form-control select2" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True"></asp:DropDownList>
                            <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Carrera</label>
                            <asp:DropDownList ID="ddl_carrera" CssClass="form-control select2" runat="server" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True"></asp:DropDownList>
                            <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>Gestion</label>
                            <asp:DropDownList ID="ddl_gestion" CssClass="form-control " runat="server" AutoPostBack="True">
                                <asp:ListItem>Sg</asp:ListItem>
                                <asp:ListItem>1-2025</asp:ListItem>
                                <asp:ListItem>2-2025</asp:ListItem>
                                <asp:ListItem>1-2026</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="content">
            <div class="container-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card card-indigo">
                            <div class="card-header">
                                <h3 class="card-title">Clases con docente :
                                    <asp:Label ID="lbl_condoc" runat="server" Text=""></asp:Label></h3>
                            </div>
                            <div class="card-body">
                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="Exportar a excel con materias con docente" Visible="False" />
                                <asp:GridView ID="gv_con_doc" CssClass="mt-2" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_con_doc" Font-Size="9pt" Font-Names="Consolas">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" Visible="false" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="Nro.C.I." SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />

                                        <asp:TemplateField HeaderText="Horario">
                                            <ItemTemplate>
                                                <%# Eval("hora_inicio") %> - <%# Eval("hora_fin") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="SiglaP" HeaderText="Sigla" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" Visible="false" />
                                        <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" Visible="false" />
                                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="gestion" HeaderText="Gestion" SortExpression="gestion" />
                                    </Columns>
                                </asp:GridView>



                                <asp:SqlDataSource ID="sql_ds_con_doc" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,replace((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ),'a a a','--* Sin Asignar Docente *--')as docente,a.nom_aula_lab , th.hora_inicio ,th.hora_fin,th.dia,th.tipo_clase  ,p.SiglaP,p.Materia,p.Sis_plan,isnull(td.comun,'No es Comun') ,th.grupo ,th.gestion
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan
 join tb_aula a on th.aula = a.id_nomal  
where td.carrera =@carrera and th.gestion =@gestion and tp.gestion =@gestion and th.sede =@sede  and a.gestion ='1-2024' and th.ci_doc &lt;&gt;'0'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END,hora_inicio ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_gestion" Name="gestion" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>



                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">

                        <div class="card card-success">
                            <div class="card-header">
                                <h3 class="card-title">Clases sin docente : 
                                    <asp:Label ID="lbl_sin_doc" runat="server" Text=""></asp:Label></h3>
                            </div>
                            <div class="card-body">
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Exportar a Excel lista de materias sin docente" Visible="False" />
                                <asp:GridView ID="GridView1" CssClass="mt-2" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_sin_doc" Font-Size="9pt" Font-Names="Consolas">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" Visible="false" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="Nro.C.I." SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />

                                        <asp:TemplateField HeaderText="Horario">
                                            <ItemTemplate>
                                                <%# Eval("hora_inicio") %> - <%# Eval("hora_fin") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="SiglaP" HeaderText="Sigla" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" Visible="false" />
                                        <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" Visible="false" />
                                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="gestion" HeaderText="Gestion" SortExpression="gestion" />
                                    </Columns>
                                </asp:GridView>



                                <asp:SqlDataSource ID="sql_ds_sin_doc" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,replace((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ),'a a a','Sin Asignar Docente')as docente,a.nom_aula_lab , th.hora_inicio ,th.hora_fin,th.dia,th.tipo_clase  ,p.SiglaP,p.Materia,p.Sis_plan,isnull(td.comun,'No es Comun') ,th.grupo ,th.gestion
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan
 join tb_aula a on th.aula = a.id_nomal  
where td.carrera =@carrera and th.gestion =@gestion and tp.gestion =@gestion and th.sede =@sede  and a.gestion ='1-2024' and th.ci_doc ='0'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END,hora_inicio ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_gestion" Name="gestion" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="sql_ds_anterior" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select COUNT(*) as gestion_2_2024 from tb_horario th
join tb_designacion td on th.id_horario = td.id_horario 
join planes_estudios p on td.id_materia =p.id_plan 
join tb_personal per on th.ci_doc = per.ci 
join tb_aula a on th.aula = a.id_nomal 
where th.gestion ='2-2025' and per.gestion ='2-2025' and a.gestion ='1-2024' and th.sede =@sede and p.codcar =@carrera">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="sql_ds_actual" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select COUNT(*) as gestion_1_2025 from tb_horario th
join tb_designacion td on th.id_horario = td.id_horario 
join planes_estudios p on td.id_materia =p.id_plan 
join tb_personal per on th.ci_doc = per.ci 
join tb_aula a on th.aula = a.id_nomal 
where th.gestion ='1-2026' and per.gestion ='1-2026' and a.gestion ='1-2024' and th.sede =@sede and p.codcar =@carrera">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </section>
    </form>
</asp:Content>



