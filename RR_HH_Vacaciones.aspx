<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_Vacaciones.aspx.vb" Inherits="RRHH_Vacaciones" MasterPageFile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <form id="form1" runat="server">


        <main class="app-main">
            <!--begin::App Content Header-->
            <div class="app-content-header">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row">
                        <div class="col-sm-6">
                            <h3 class="mb-0">Vacaciones</h3>
                        </div>

                    </div>
                    <!--end::Row-->
                </div>
                <!--end::Container-->
            </div>
            <!--end::App Content Header-->
            <!--begin::App Content-->
            <div class="app-content">
                <!--begin::Container-->
                <div class="container-fluid">
                    <!--begin::Row-->
                    <div class="row g-4">
                        <!--begin::Col-->

                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-md-6">
                            <!--begin::Quick Example-->
                            <div class="card card-primary card-outline mb-4">
                                <!--begin::Header-->
                                <div class="card-header">
                                    <div class="card-title">Lista de Contratados</div>
                                </div>
                                <!--end::Header-->
                                <!--begin::Form-->
                                <form>
                                    <!--begin::Body-->
                                    <div class="card-body">
                                        <div class="mb-3">

                                            <asp:GridView ID="Gv_Vacaciones" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDsVacaciones" OnRowDataBound="Gv_Vacaciones_RowDataBound" DataKeyNames="CI_Contratado,FechaIngreso" GridLines="None" Font-Names="Consolas">
                                                <Columns>
                                                    <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="btn-primary" ButtonType="Button" />
                                                    <asp:TemplateField HeaderText="CI_Contratado">
                                                        <HeaderTemplate>
                                                            CI Contratado<br />
                                                            <asp:TextBox ID="txtFilterCI" runat="server" AutoPostBack="true" OnTextChanged="FilterTextChanged"></asp:TextBox>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <%# Eval("CI_Contratado") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="Fechade ingreso">
                                                        <HeaderTemplate>
                                                            Fecha de ingreso<br />
                                                            <asp:TextBox ID="txtFilterFecha" runat="server" AutoPostBack="true" OnTextChanged="FilterTextChanged"></asp:TextBox>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <%# Eval("FechaIngreso", "{0:yyyy-MM-dd}") %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <asp:BoundField DataField="AntiguedadAños" HeaderText="Años de antiguedad" ReadOnly="True" SortExpression="AntiguedadAños" />
                                                    <asp:BoundField DataField="DiasVacacion" HeaderText="Diasde vacacion" ReadOnly="True" SortExpression="DiasVacacion" />
                                                </Columns>
                                                <HeaderStyle BackColor="#999999" />
                                            </asp:GridView>


                                            <asp:SqlDataSource ID="SqlDsVacaciones" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="	SELECT 
    c.CI_Contratado,
    c.FechaIngreso,
    DATEDIFF(YEAR, c.FechaIngreso, GETDATE()) AS AntiguedadAños,
    COALESCE(p.DiasVacacion, 0) AS DiasVacacion
FROM 
    Contrataciones_Empleados c
LEFT JOIN 
    Parametros_Vacaciones p 
        ON DATEDIFF(YEAR, c.FechaIngreso, GETDATE()) 
           BETWEEN p.AntiguedadInicio AND p.AntiguedadFin
		   order by DiasVacacion"></asp:SqlDataSource>
                                            <asp:TextBox ID="txt_cicontrado" runat="server" Visible="false"></asp:TextBox>




                                        </div>



                                    </div>
                                    <!--end::Body-->
                                    <!--begin::Footer-->

                                    <!--end::Footer-->
                                </form>
                                <!--end::Form-->
                            </div>
                            <!--end::Quick Example-->
                            <!--begin::Input Group-->
                            <div class="card card-success card-outline mb-4">
                                <!--begin::Header-->
                                <div class="card-header">
                                    <div class="card-title">Dias de Vacaciones Disponibles</div>
                                </div>
                                <!--end::Header-->
                                <!--begin::Body-->
                                <div class="card-body">
                                    <div class="app-content">
                                        <!--begin::Container-->
                                        <div class="container-fluid">
                                            <!-- Info boxes -->
                                            <div class="row">


                                                <div class="col-12 col-sm-6 col-md-4">
                                                    <div class="info-box">
                                                        <span class="info-box-icon text-bg-danger shadow-sm">
                                                            <i class="bi bi-hand-thumbs-up-fill"></i>
                                                        </span>
                                                        <div class="info-box-content">
                                                            <span class="info-box-text">Dias Disponibles</span>
                                                            <span class="info-box-number">
                                                                <asp:Label ID="lbldiasvacacion" runat="server" Font-Bold="True" Font-Size="13pt" ForeColor="Black"></asp:Label></span>
                                                        </div>
                                                        <!-- /.info-box-content -->
                                                    </div>
                                                    <!-- /.info-box -->
                                                </div>

                                                <div class="col-12 col-sm-6 col-md-4">
                                                    <div class="info-box">
                                                        <span class="info-box-icon text-bg-warning shadow-sm">
                                                            <i class="bi bi-people-fill"></i>
                                                        </span>
                                                        <div class="info-box-content">
                                                            <span class="info-box-text">Dias con Permiso</span>
                                                            <span class="info-box-number">
                                                                <asp:Label ID="lbl_gastados" runat="server" Text="" Font-Bold="True" Font-Size="13pt" ForeColor="Black"></asp:Label></span>
                                                        </div>
                                                        <!-- /.info-box-content -->
                                                    </div>
                                                    <!-- /.info-box -->
                                                </div>

                                            </div>
                                        </div>
                                    </div>


                                </div>

                            </div>
                            <!--end::Input Group-->
                            <!--begin::Horizontal Form-->

                            <!--end::Horizontal Form-->
                        </div>
                        <!--end::Col-->
                        <!--begin::Col-->
                        <div class="col-md-6">
                            <!--begin::Different Height-->
                            <div class="card card-secondary card-outline mb-4">
                                <!--begin::Header-->
                                <div class="card-header">
                                    <div class="card-title">Vacaciones Solicitadas</div>
                                </div>
                                <!--end::Header-->
                                <!--begin::Body-->
                                <div class="card-body">
                                    <asp:GridView ID="GvVacacionesSol" CssClass="table table-hover " runat="server" AutoGenerateColumns="False" DataSourceID="SqlDSVacacionesSol" GridLines="None" DataKeyNames="CI_Contratado,DiasHabilesPermiso">
                                        <Columns>
                                            <asp:BoundField DataField="CI_Contratado" HeaderText="CI Contratado" ReadOnly="True" SortExpression="CI_Contratado" />
                                            <asp:BoundField DataField="DiasHabilesPermiso" HeaderText="Dias habiles de permiso" ReadOnly="True" SortExpression="DiasHabilesPermiso" />
                                        </Columns>
                                        <HeaderStyle BackColor="#999999" />
                                    </asp:GridView>


                                </div>
                                <!--end::Body-->
                            </div>
                            <!--end::Different Height-->
                            <!--begin::Different Width-->
                            <div class="card card-danger card-outline mb-4">
                                <!--begin::Header-->
                                <div class="card-header">
                                    <div class="card-title">Detalles de las solicitudes</div>
                                </div>
                                <!--end::Header-->
                                <!--begin::Body-->
                                <div class="card-body">

                                    <asp:GridView ID="gv_detalles_vac" CssClass="table table-hover " runat="server" AutoGenerateColumns="False" DataSourceID="SqlDSDetalles" GridLines="None" BackColor="White">
                                        <Columns>
                                            <asp:BoundField DataField="id_permiso" HeaderText="id_permiso" InsertVisible="False" ReadOnly="True" SortExpression="id_permiso" Visible="false" />
                                            <asp:BoundField DataField="CI_Contratado" HeaderText="CI Contratado" SortExpression="CI_Contratado" />
                                            <asp:BoundField DataField="FechaSolicitud" HeaderText="Fecha de solicitud" SortExpression="FechaSolicitud" />
                                            <asp:BoundField DataField="FechaSalida" HeaderText="Fecha de salida" SortExpression="FechaSalida" />
                                            <asp:BoundField DataField="FechaRetorno" HeaderText="Fecha de retorno" SortExpression="FechaRetorno" />
                                            <asp:BoundField DataField="TipoPermiso" HeaderText="Tipo de permiso" SortExpression="TipoPermiso" Visible="false" />
                                        </Columns>
                                        <HeaderStyle BackColor="#999999" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDSDetalles" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT        id_permiso, CI_Contratado, FechaSolicitud, FechaSalida, FechaRetorno, TipoPermiso
FROM            tb_permisos
WHERE      CI_Contratado=@ci">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="txt_cicontrado" Name="ci" PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <!--end::Body-->
                            </div>


                            <div class="card card-primary card-outline mb-4">
                                <!--begin::Header-->
                                <div class="card-header">
                                    <div class="card-title">Quick Example</div>
                                </div>
                                <!--end::Header-->
                                <!--begin::Form-->
                                <form>
                                    <!--begin::Body-->
                                    <div class="card-body">

                                    </div>
                                    <!--end::Body-->
                                    <!--begin::Footer-->
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                    <!--end::Footer-->
                                </form>
                                <!--end::Form-->
                            </div>
                            <!--end::Different Width-->
                            <!--begin::Form Validation-->

                            <!--end::Form Validation-->
                        </div>
                        <!--end::Col-->
                    </div>
                    <!--end::Row-->
                </div>
                <!--end::Container-->
            </div>
            <!--end::App Content-->
        </main>
        <!--end::App Main-->
        <!--begin::Footer-->
































        <asp:SqlDataSource ID="SqlDSVacacionesSol" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SET DATEFIRST 7; 
;WITH Dias AS
(
    SELECT CI_Contratado, FechaSalida AS Dia, FechaRetorno
    FROM tb_permisos
    WHERE TipoPermiso = 1

    UNION ALL

    SELECT CI_Contratado, DATEADD(DAY, 1, Dia), FechaRetorno
    FROM Dias
    WHERE DATEADD(DAY, 1, Dia) &lt;= FechaRetorno
)
SELECT
    CI_Contratado,
    COUNT(*) AS DiasHabilesPermiso
FROM Dias
WHERE DATEPART(WEEKDAY, Dia) &lt;&gt; 7 and CI_Contratado=@ci
GROUP BY CI_Contratado,CI_Contratado
OPTION (MAXRECURSION 0);
">
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_cicontrado" Name="ci" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>


