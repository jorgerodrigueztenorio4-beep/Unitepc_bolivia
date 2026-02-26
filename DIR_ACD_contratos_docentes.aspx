<%@ Page Language="VB" AutoEventWireup="false"
    CodeFile="DIR_ACD_contratos_docentes.aspx.vb"
    Inherits="DIR_ACD_contratos_docentes"
    MasterPageFile="mp_dir_academico.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container-fluid">
        <h2>Contratos RRHH</h2>

        <!-- ROW PRINCIPAL -->
        <div class="row g-4">

            <!-- COLUMNA IZQUIERDA -->
            <div class="col-md-4">
                <div class="card card-primary card-outline mb-4">
                    <div class="card-header">
                        <div class="card-title">Datos para búsqueda</div>
                    </div>

                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label">Sede</label>
                            <asp:DropDownList
                                ID="ddl_sede"
                                runat="server"
                                CssClass="form-control"
                                DataSourceID="sql_ds_sede"
                                DataTextField="NombreSede"
                                DataValueField="idSede" />

                            <asp:SqlDataSource
                                ID="sql_ds_sede"
                                runat="server"
                                ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>"
                                SelectCommand="SELECT * FROM tb_sedes" />
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Carrera</label>
                            <asp:DropDownList
                                ID="ddl_Carrera"
                                runat="server"
                                CssClass="form-control" DataSourceID="sql_ds_carreras" DataTextField="CARDES" DataValueField="CARSIGLA" />
                            <asp:SqlDataSource ID="sql_ds_carreras" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] ORDER BY [CARDES]"></asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="card-footer text-end">
                        <asp:Button
                            ID="Button1"
                            runat="server"
                            CssClass="btn btn-primary"
                            Text="Buscar" />
                    </div>
                </div>
            </div>

            <!-- COLUMNA DERECHA -->
            <div class="col-md-8">
                <div class="card card-primary card-outline mb-4">
                    <div class="card-header">
                        <div class="card-title">Contratos</div>
                    </div>

                    <div class="card-body">
                        <div class="table-scroll">
                            <asp:GridView
                                ID="gv_lista"
                                runat="server"
                                AutoGenerateColumns="False"
                                CssClass="table table-sm table-striped table-bordered"
                                Font-Size="9pt"
                                Font-Names="Consolas">

                                <Columns>


                                    <asp:TemplateField HeaderText="Docente">
                                        <ItemTemplate>
                                            <div>
                                                <strong><%# Eval("Carnet") %></strong><br />
                                                <%# Eval("Nombre") %> <%# Eval("PrimerApellido") %> <%# Eval("SegundoApellido") %><br />
                                                <span class="text-muted"><%# Eval("Correo") %></span>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:BoundField DataField="CodCarre" HeaderText="Carrera" />
                                    <asp:BoundField DataField="Sigla" HeaderText="Sigla" />
                                    <asp:BoundField DataField="Gestion" HeaderText="Gestión" />
                                    <asp:BoundField DataField="Sede" HeaderText="Sede" />
                                    <asp:BoundField DataField="TipoGrupo" HeaderText="Tipo de clase" HeaderStyle-HorizontalAlign="Center">
                                        <ItemStyle BackColor="#D9EDF7" ForeColor="#31708F" Width="80px" HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Grupo" HeaderText="Grupo" >
                                        <ItemStyle BackColor="#FCF8E3" ForeColor="#8A6D3B" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                    <asp:BoundField DataField="CargaHoraMes" HeaderText="Horas" />
                                    <asp:BoundField DataField="FechAsignacionMat" HeaderText="Fecha de contratacion" />

                                </Columns>

                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
