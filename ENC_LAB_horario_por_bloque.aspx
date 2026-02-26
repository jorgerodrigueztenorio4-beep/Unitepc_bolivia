<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ENC_LAB_horario_por_bloque.aspx.vb" Inherits="ENC_LAB_horario_por_bloque" MasterPageFile="~/mp_enc_laboratorios.master" %>

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
    <form id="form1" runat="server">
        <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
            <asp:Label ID="lbl_cargo" runat="server" Text=""></asp:Label>
        </div>
        <div class=" container-fluid ">
            <div class="row">

                <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                    <div style="background-color: #ffc107" class="text-md-center  rounded text-bold " role="alert">
                        Horarios por Bloque
                    </div>


                    <div class="input-group mb-1">
                        <asp:DropDownList ID="ddl_bloque" CssClass="form-control  btn btn-outline-default border-dark mt-1 " runat="server" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AutoPostBack="True">
                        </asp:DropDownList>

                        <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_bloque, nom_bloque, id_sede FROM tb_bloques WHERE (id_sede = '1')"></asp:SqlDataSource>
                        <asp:Button ID="Button1" CssClass=" btn btn-primary form-control  mt-1 " runat="server" Text="Exportar a Excel" />
                    </div>
                    <%--             <asp:GridView ID="GridView1" runat="server" CssClass ="table table-hover  mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_horario" Font-Size="9pt" Font-Names="Consolas">
                                    <Columns>
                                        <asp:BoundField DataField="nombre" HeaderText="Docente" ReadOnly="True" SortExpression="nombre" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="CARDES" HeaderText="Carrera" SortExpression="CARDES" />
                                    </Columns>
                                    <HeaderStyle BackColor="#009900" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>--%>
                    <asp:GridView ID="GridView1"
                        runat="server"
                        CssClass="table table-sm table-hover table-bordered gv-profesional"
                        HeaderStyle-CssClass="gv-header"
                        AutoGenerateColumns="False"
                        DataSourceID="sql_ds_horario"
                        Font-Size="9pt"
                        Font-Names="Consolas"
                        GridLines="None">

                        <Columns>
                            <asp:BoundField DataField="nombre" HeaderText="Docente" ReadOnly="True" SortExpression="nombre" />
                            <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                            <asp:TemplateField HeaderText="Horario">
                                <ItemTemplate>
                                    <%# Eval("hora_inicio", "{0:HH:mm}") %>
        -
       
                                    <%# Eval("hora_fin", "{0:HH:mm}") %>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                            <asp:BoundField DataField="dia" HeaderText="Día" SortExpression="dia" />
                            <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />
                            <asp:BoundField DataField="CARDES" HeaderText="Carrera" SortExpression="CARDES" />
                            <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                        </Columns>
                    </asp:GridView>


                    <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (pe.nombres +' '+pe.primerApellido +' '+pe.segundoApellido ) as nombre,p.Materia,h.hora_inicio ,h.hora_fin ,h.grupo  ,h.dia,a.nom_aula_lab  ,c.CARDES,h.gestion   from tb_horario h
join tb_designacion d on d.id_horario = h.id_horario 
join planes_estudios p on d.id_materia = p.id_plan 
join tb_personal pe on h.ci_doc = pe.ci 
join tb_aula a on h.aula = a.id_nomal 
join tb_carreras c on p.codcar = c.CARSIGLA 
where h.gestion ='1-2026' and pe.gestion ='1-2026' and a.gestion ='1-2024' and h.sede ='1' and h.bloque =@bloque
ORDER BY CASE WHEN h.dia = 'Lunes' THEN 1 WHEN h.dia='Martes' THEN 2 WHEN h.dia='Miercoles' THEN 3 WHEN h.dia='Jueves' THEN 4 WHEN h.dia='Viernes' THEN 5  WHEN h.dia='Sabado' THEN 6  END,h.hora_inicio 
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>

    </form>

</asp:Content>

