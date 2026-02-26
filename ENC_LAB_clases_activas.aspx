<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ENC_LAB_clases_activas.aspx.vb" Inherits="ENC_LAB_clases_activas" MasterPageFile="mp_enc_laboratorios.master" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        /* Encabezado */
        .gv-header th {
            background-color: #1f2937; /* gris oscuro */
            color: #ffffff;
            text-align: center;
            font-weight: 600;
            font-size: 11px;
            border-bottom: 2px solid #0d6efd;
        }

        /* Grid general */
        .gv-profesional td {
            vertical-align: middle;
            padding: 6px 8px;
        }

        /* Docente */
        .docente-box .ci {
            font-size: 10px;
            color: #6b7280;
        }

        .docente-box .nombre {
            font-weight: 600;
            color: #111827;
        }

        /* Materia */
        .materia-box .materia {
            font-weight: 600;
        }

        .materia-box .sigla {
            font-size: 10px;
            color: #6b7280;
        }

        /* Observaciones */
        .gv-profesional td.obs {
            background-color: #fef2f2;
            color: #991b1b;
            font-weight: 600;
        }

        /* Hover elegante */
        .gv-profesional tr:hover {
            background-color: #f1f5f9;
        }

        /* Bordes suaves */
        .gv-profesional {
            border-radius: 8px;
            overflow: hidden;
        }
    </style>
    <form runat="server">

        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Listdo de Asistencia  a Clases</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Cerrar Sesion</a></li>
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
                        <div class="card card-purple">
                            <div class="card-header">
                                <h3 class="card-title">Lista de todas las Clases del Dia Actual</h3>

                                <div class="card-tools">
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="chart">
                                    <div class="input-group mb-1">
                                        <asp:DropDownList ID="ddl_sede" CssClass="custom-select form-control-border" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
                                        <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                        <asp:DropDownList ID="ddl_carrera" CssClass="custom-select form-control-border" runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>
                                        <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                    </div>
                                    <asp:GridView ID="gv_clases_todo" runat="server"
                                        CssClass="table table-sm table-hover table-bordered gv-profesional"
                                        HeaderStyle-CssClass="gv-header"
                                        AutoGenerateColumns="False"
                                        DataSourceID="sql_ds_asistencia_hoy"
                                        Font-Size="9pt"
                                        Font-Names="Segoe UI"
                                        GridLines="None">

                                        <Columns>


                                            <asp:TemplateField HeaderText="Docente">
                                                <ItemTemplate>
                                                    <strong>Docente:</strong> <%# Eval("docente") %><br />
                                                    <strong>C.I.:</strong> <%# Eval("ci_doc") %>

                                                </ItemTemplate>
                                            </asp:TemplateField>


                                            <asp:BoundField DataField="carrera" HeaderText="Carrera" />


                                            <asp:TemplateField HeaderText="Materia">
                                                <ItemTemplate>
                                                    <%# Eval("Materia") %><br />
                                                    <span class="text-muted">(<%# Eval("sigla_materia") %>)</span>
                                                </ItemTemplate>
                                            </asp:TemplateField>


                                            <asp:BoundField DataField="grupo" HeaderText="Grupo" />


                                            <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" />


                                            <asp:TemplateField HeaderText="Horario Programado">
                                                <ItemTemplate>
                                                    <%# Eval("hra_inicio", "{0:HH:mm}") %>
                -
               
                                                    <%# Eval("hra_fin", "{0:HH:mm}") %>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:TemplateField>


                                            <asp:BoundField DataField="hr_ingreso" HeaderText="Ingreso Ejecutado" />


                                            <asp:BoundField DataField="hr_salida" HeaderText="Salida Ejecutado" />

                                            <asp:BoundField DataField="aula_o_lab" HeaderText="Aula" />
                                            <asp:BoundField DataField="observaciones" HeaderText="Observaciones">
                                                <ItemStyle Font-Bold="True" Font-Size="10pt" BackColor="#FEE0E2" />
                                            </asp:BoundField>

                                        </Columns>

                                        <HeaderStyle HorizontalAlign="Center" />

                                    </asp:GridView>

                                    <asp:SqlDataSource ID="sql_ds_asistencia_hoy" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT i.ci_doc, p.nombres + ' ' + p.primerApellido + ' ' + p.segundoApellido AS docente, i.carrera, i.Materia, i.sigla_materia, i.grupo, i.tipo_clase, i.hra_inicio, i.hra_fin, i.hr_ingreso, i.hr_salida, ISNULL(i.observaciones, 'Clases en Curso o Por Cursar') AS observaciones,i.aula_o_lab FROM tb_ing_sal AS i INNER JOIN tb_personal AS p ON i.ci_doc = p.ci WHERE (p.gestion = '1-2026') AND (CONVERT (varchar, i.hora_registro, 103) = CONVERT (varchar, GETDATE(), 103)) AND (i.sede = @sede) AND (i.carrera = @carrera) AND (i.gestion = '1-2026') AND (i.dia = (SELECT (CASE DATENAME(dw , getdate()) WHEN 'Monday' THEN 'Lunes' WHEN 'Martes' THEN 'Martes' WHEN 'Wednesday' THEN 'Miercoles' WHEN 'Thursday' THEN 'Jueves' WHEN 'Friday' THEN 'Viernes' WHEN 'Saturday' THEN 'Sabado' WHEN 'Domingo' THEN 'Domingo' END) AS Expr1)) ORDER BY i.hra_inicio">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                            <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:TextBox ID="txt_sigla_car" Visible="false" runat="server"></asp:TextBox>
                                    <asp:TextBox ID="txt_sede" runat="server" Visible="false"></asp:TextBox>

                                </div>
                            </div>
                            <!-- /.card-body -->
                        </div>

                    </div>
                    <!-- /.col (LEFT) -->
                    <div class="col-md-2">
                    </div>

                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->

    </form>

</asp:Content>



