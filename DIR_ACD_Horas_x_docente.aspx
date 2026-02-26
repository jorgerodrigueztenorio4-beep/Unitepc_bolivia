<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_Horas_x_docente.aspx.vb" Inherits="DIR_ACD_Horas_x_docente" MasterPageFile="~/mp_dir_academico.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
        <asp:Label ID="lbl_cargo" runat="server" Text=""></asp:Label>
    </div>
    <div class=" container-fluid ">
        <div class="row">

            <div class="col-md-12 p-3 mb-2  ">
                <div style="background-color: #FFCC00" class="text-md-center  rounded text-bold " role="alert">
                    Lista de Horarios
                </div>
                <div class="input-group mb-1">
                    <asp:DropDownList ID="ddl_docente" CssClass="form-control btn btn-default  dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_docente" DataTextField="docente" DataValueField="ci" AutoPostBack="True" AppendDataBoundItems="True">
                        <asp:ListItem>Docente</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (nombres +' '+primerApellido +' '+segundoApellido )as docente,ci  from tb_personal 
where gestion ='1-2026'
order by docente"></asp:SqlDataSource>
                  


                  
                </div>
            </div>



            <div class="col-md-12">
                  <asp:GridView
                        ID="gv_docente"
                        runat="server"
                        CssClass="table table-striped table-hover table-bordered" Font-Size="10pt"
                        AutoGenerateColumns="False"
                        DataSourceID="sql_ds_cargahora" ShowFooter="True">

                        <Columns>



                            <asp:TemplateField HeaderText="Horario">
                                <ItemTemplate>
                                    <strong>Docente : <%# Eval("Docente") %></strong>
                                    <br />
                                    <small class="text-muted">ci :  (<%# Eval("ci_doc") %>)</small>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="dia" HeaderText="Día" />
                            <asp:TemplateField HeaderText="Horario">



                                <ItemTemplate>
                                    <span class="badge badge-success" style="font-size: 10pt;">
                                        <%# Eval("horainicio") %> - <%# Eval("horafin") %>
                </span>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Hras_academica" HeaderText="Horas Academicas" ReadOnly="True" SortExpression="Hras_academica" />

                            <asp:BoundField DataField="tipo_clase" HeaderText="Tipo" />
                            
                            <asp:TemplateField HeaderText="Materia">
                                <ItemTemplate>
                                    <strong><%# Eval("Materia") %></strong>
                                    <br />
                                    <small class="text-muted"><%# Eval("SiglaP") %></small>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="grupo" HeaderText="Grupo" />
                            <asp:BoundField DataField="gestion" HeaderText="Gestión" />

                        </Columns>

                        <HeaderStyle BackColor="#D4EDDA" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="sql_ds_cargahora" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT th.id_horario, th.ci_doc, tp.nombres + ' ' + tp.primerApellido + ' ' + tp.segundoApellido AS docente, REPLACE(th.hora_inicio, ':00.000000', '') AS horainicio, REPLACE(th.hora_fin, ':00.000000', '') AS horafin, DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica, th.dia, th.tipo_clase, td.horas, td.fecha_creacion, p.SiglaP, p.Materia, p.Sis_plan ,th.gestion,th.grupo
FROM tb_designacion AS td INNER JOIN tb_horario AS th ON td.id_horario = th.id_horario INNER JOIN tb_personal AS tp ON th.ci_doc = tp.ci INNER JOIN planes_estudios AS p ON td.id_materia = p.id_plan 
WHERE (th.gestion = '1-2026') AND (tp.gestion = '1-2026') AND (th.ci_doc = @ci) AND (tp.gestion = '1-2026') ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia = 'Martes' THEN 2 WHEN th.dia = 'Miercoles' THEN 3 WHEN th.dia = 'Jueves' THEN 4 WHEN th.dia = 'Viernes' THEN 5 WHEN th.dia = 'Sabado' THEN 6 END, docente">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddl_docente" Name="ci" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
            </div>
        </div>
    </div>
    </form> 

</asp:Content>


