<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_plan_estudios.aspx.vb" Inherits="ADM_plan_estudios" MasterPageFile="~/mp_dir_academico.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">

    <div class="container-fluid mt-3">

        <!-- ALERTA DE CARGO -->
        <div class="alert alert-success text-center fw-bold shadow-sm" role="alert">
            <asp:Label ID="lbl_cargo" runat="server" Text=""></asp:Label>
        </div>

            <div class="row g-3">

            <!-- FILTROS -->
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-header bg-warning text-center fw-bold">
                        Filtros
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label class="form-label">Sede</label>
                            <asp:DropDownList ID="ddl_sede" CssClass="form-select form-control " runat="server"
                                DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Facultad</label>
                            <asp:DropDownList ID="ddl_facultad" CssClass="form-select form-control " runat="server"
                                DataSourceID="sql_ds_facultad" DataTextField="FACDES" DataValueField="FACCOD" />
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Tipo de Plan</label>
                            <asp:DropDownList ID="ddl_ant_nuevo" CssClass="form-control form-select" runat="server">
                                <asp:ListItem>Seleccione el Tipo de Plan</asp:ListItem>
                                <asp:ListItem Value="A">Plan Antiguo</asp:ListItem>
                                <asp:ListItem Value="N">Plan Nuevo</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Carrera</label>
                            <asp:DropDownList ID="ddl_carrera" CssClass="form-select form-control " runat="server"
                                DataSourceID="sql_ds_carera" DataTextField="CARDES" DataValueField="CARSIGLA" />
                        </div>
                        <asp:Button ID="Button1" CssClass="btn btn-primary w-100" runat="server" Text="Ver Plan" />
                    </div>
                </div>
            </div>

            <!-- PLAN DE ESTUDIOS -->
            <div class="col-md-8">
                <div class="card shadow-sm">
                    <div class="card-header bg-warning text-center fw-bold">
                        Plan de Estudios
                    </div>
                    <div class="card-body">

                        <!-- GRIDVIEW FACULTAD -->
                        <asp:GridView ID="gv_facul" runat="server" CssClass="table table-striped table-hover table-bordered mb-3"></asp:GridView>

                        <!-- GRIDVIEW CARRERA -->
                        <asp:GridView ID="gv_carrera" runat="server" CssClass="table table-striped table-hover table-bordered mb-3"></asp:GridView>

                        <!-- GRIDVIEW PLAN -->
                        <asp:GridView ID="gv_plan" runat="server" CssClass="table table-striped table-hover table-bordered"
                            Font-Size="10pt"></asp:GridView>

                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- FUENTES DE DATOS -->
    <asp:SqlDataSource ID="sql_ds_carera" runat="server"
        ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>"
        SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_ds_facultad" runat="server"
        ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>"
        SelectCommand="SELECT * FROM [tb_facultades]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="sql_ds_sede" runat="server"
        ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>"
        SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>

</asp:Content>
