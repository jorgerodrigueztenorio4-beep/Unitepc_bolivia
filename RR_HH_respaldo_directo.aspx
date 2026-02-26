<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_respaldo_directo.aspx.vb" Inherits="RR_HH_respaldo_directo" MasterPageFile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <form runat="server">

        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Subir Respaldos Directos</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">

                            <li class="breadcrumb-item active">
                                <asp:Label ID="lbl_cargo" runat="server" Text="Label"></asp:Label></li>
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
                                <h3 class="card-title">Lista para subir respaldos
                                </h3>


                            </div>
                            <div class="card-body">
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control mt-1 " runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_carrera" CssClass="form-control mt-1 " runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                <asp:TextBox ID="txt_fecha" type="date" CssClass="form-control-sm form-control " runat="server" AutoPostBack="True"></asp:TextBox>
                                <asp:GridView ID="gv_datos" runat="server" CssClass ="table-hover mt-1   " AutoGenerateColumns="False" DataSourceID="sql_ds_clases" Font-Names="Consolas" Font-Size="9pt" GridLines="None" DataKeyNames="id_ing_sal">
                      <Columns>
                          <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass ="btn btn-primary btn-sm " SelectText="Respaldar" ShowDeleteButton="True" >
<ControlStyle CssClass="btn btn-primary btn-sm "></ControlStyle>
                          </asp:CommandField>
                          <asp:BoundField DataField="id_ing_sal" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_ing_sal"   />
                          <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" Visible ="true"  >
                          </asp:BoundField>
                          <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                          <asp:BoundField DataField="carrera" HeaderText="Carrera" SortExpression="carrera"  />
                          <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                          <asp:BoundField DataField="sigla_materia" HeaderText="Sigla de la Materia" SortExpression="sigla_materia"  />
                          <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                          <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                          <asp:BoundField DataField="hra_inicio" HeaderText="Hora de Inicio" SortExpression="hra_inicio" >
                          <ItemStyle BackColor="#E1F1E0" />
                          </asp:BoundField>
                          <asp:BoundField DataField="hra_fin" HeaderText="Hora de Fin" SortExpression="hra_fin" >
                          <ItemStyle BackColor="#F3DEE9" />
                          </asp:BoundField>
                          <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" >
                          </asp:BoundField>
                          <asp:BoundField DataField="hr_ingreso" HeaderText="Hora de Ingreso" SortExpression="hr_ingreso" >
                          <ItemStyle BackColor="#E1F1E0" />
                          </asp:BoundField>
                          <asp:BoundField DataField="hr_salida" HeaderText="Hora de Salida" SortExpression="hr_salida" >
                          <ItemStyle BackColor="#F3DEE9" />
                          </asp:BoundField>
                          <asp:BoundField DataField="observaciones" HeaderText="Observaciones" ReadOnly="True" SortExpression="observaciones" />
                          <asp:BoundField DataField="gestion" HeaderText="Gestion" SortExpression="gestion" />
                      </Columns>
                      <HeaderStyle BackColor="#999999" ForeColor="White" />
                      <SelectedRowStyle BackColor="#FFFFB9" />
                  </asp:GridView>
                            <%--    <asp:GridView ID="gv_datos"
                                    runat="server"
                                    CssClass="table table-hover mt-1"
                                    AutoGenerateColumns="False"
                                    DataSourceID="sql_ds_clases"
                                    Font-Names="Consolas"
                                    Font-Size="9pt"
                                    GridLines="None"
                                    DataKeyNames="id_ing_sal">

                                    <Columns>

                                        <asp:CommandField ShowSelectButton="True"
                                            ShowDeleteButton="True"
                                            SelectText="Respaldar"
                                            ControlStyle-CssClass="btn btn-primary btn-sm" />

                                        <asp:BoundField DataField="id_ing_sal" HeaderText="Id." ReadOnly="True" />


                                        <asp:TemplateField HeaderText="Docente">
                                            <ItemTemplate>
                                                <b>Docente :<%# Eval("docente") %></b><br />
                                                C.I. : <%# Eval("ci_doc") %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="carrera" HeaderText="Carrera" />

                                        <asp:TemplateField HeaderText="Materia">
                                            <ItemTemplate>

                                                <%# Eval("Materia") %>
                 - 
                <%# Eval("sigla_materia") %>
                                                <div class="small text-muted">
                                                    Grupo: <%# Eval("grupo") %>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo" />
                                        <asp:BoundField DataField="dia" HeaderText="Día" />


                                        <asp:TemplateField HeaderText="Horario Clase">
                                            <ItemTemplate>
                                                <div style="background: #E1F1E0; padding: 2px;">
                                                    <%# Eval("hra_inicio", "{0:HH:mm}") %>
                                                </div>
                                                <div style="background: #F3DEE9; padding: 2px;">
                                                    <%# Eval("hra_fin", "{0:HH:mm}") %>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Marcación">
                                            <ItemTemplate>
                                                <div style="background: #E1F1E0;">
                                                    <%# Eval("hr_ingreso", "{0:HH:mm}") %>
                                                </div>
                                                <div style="background: #F3DEE9; padding: 2px;">
                                                    <%# Eval("hr_salida", "{0:HH:mm}") %>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="observaciones" HeaderText="Observaciones" />
                                        <asp:BoundField DataField="gestion" HeaderText="Gestión" />

                                    </Columns>

                                    <HeaderStyle BackColor="#999999" ForeColor="White" />
                                    <SelectedRowStyle BackColor="#FFFFB9" />

                                </asp:GridView>--%>
                                <asp:SqlDataSource ID="sql_ds_clases" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select i.id_ing_sal  ,ci_doc ,(p.nombres +' '+p.primerApellido +' '+p.segundoApellido ) as docente,carrera ,Materia ,sigla_materia,grupo,tipo_clase ,hra_inicio,hra_fin,i.dia  ,hr_ingreso ,hr_salida ,isnull(observaciones ,'Clases en Curso o Por Cursar') as observaciones   ,i.gestion 
from tb_ing_sal i
join tb_personal p on i.ci_doc = p.ci 
where p.gestion ='1-2026'  and i.gestion ='1-2026'   and sede =@sede and carrera =@carerra

  and cast(hr_ingreso as date) =cast(@fecha as date)  and (observaciones ='No se Marco la Salida' or observaciones ='No Marco la Salida' or observaciones ='No Asistio a Clases')
order by hra_inicio"
                                    InsertCommand="INSERT INTO tb_respaldos(respaldo, ci_doc, id_ing_sal, fecha_clase, fecha_registro) VALUES (@respaldo, @cidoc, @iding, @fechaclase, GETDATE())" UpdateCommand="UPDATE tb_ing_sal SET hr_ingreso = @hraingre, hr_salida = @hrasal, observaciones = 'Con Respaldo Directo' WHERE (id_ing_sal = @idingsal)" DeleteCommand="DELETE FROM tb_ing_sal WHERE (id_ing_sal = @id_ing_sal)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id_ing_sal" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="txt_img_guarda" Name="respaldo" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_ci" Name="cidoc" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_id_ingsal" Name="iding" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_fecha_marcado" Name="fechaclase" PropertyName="Text" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_fecha" Name="fecha" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="carerra" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="txt_hraingreso" Name="hraingre" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="txt_hrasalida" Name="hrasal" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="txt_id_ingsal" Name="idingsal" PropertyName="Text" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_id_ingsal" runat="server" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txt_fecha_marcado" runat="server" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txt_ci" runat="server" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txt_img_guarda" runat="server" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txt_hraingreso" runat="server" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txt_hrasalida" runat="server" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txt_observacion" runat="server" Visible="False"></asp:TextBox>
                                <asp:TextBox ID="txt_sigla_car" runat="server" Visible="False"></asp:TextBox>
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

    </form>
</asp:Content>


