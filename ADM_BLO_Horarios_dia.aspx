<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_BLO_Horarios_dia.aspx.vb" Inherits="ADM_BLO_Horarios_dia" MasterPageFile="~/mp_adm_blo.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <form id="form1" runat="server">
     
        <div class="container mt-2">
            <div class="card shadow-sm">
                <div class="card-body">

                    <div class="form-row">


                        <!-- BLOQUE -->
                        <div class="form-group col-md-6">
                            <label><strong>Bloque</strong></label>
                            <asp:DropDownList
                                ID="ddl_bloque"
                                runat="server"
                                CssClass="form-control"
                                AutoPostBack="True"
                                DataSourceID="sql_ds_bloque"
                                DataTextField="nom_bloque"
                                DataValueField="id_bloque">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques] WHERE ([id_sede] = @id_sede)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txt_sede" Name="id_sede" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <!-- AULA -->
                        <div class="form-group col-md-6">
                            <label><strong>Aula</strong></label>
                            <asp:DropDownList
                                ID="ddl_aula"
                                runat="server"
                                CssClass="form-control"
                                AutoPostBack="True"
                                DataSourceID="sql_ds_aula"
                                DataTextField="nom_aula_lab"
                                DataValueField="id_nomal">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sql_ds_aula" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_aula] WHERE (([bloque] = @bloque) AND ([gestion] = @gestion)) ORDER BY [nom_aula_lab]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" Type="String" />
                                    <asp:Parameter DefaultValue="1-2024" Name="gestion" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:TextBox ID="txt_sede" Visible="false" runat="server"></asp:TextBox>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <div>
            <style>
                .horario-grid {
                    width: 100%;
                    border-collapse: collapse;
                    font-size: 13px;
                }

                    .horario-grid th {
                        background-color: #1f4e79;
                        color: white;
                        text-align: center;
                        padding: 8px;
                        font-weight: bold;
                    }

                    .horario-grid td {
                        border: 1px solid #dcdcdc;
                        padding: 6px;
                        vertical-align: top;
                        white-space: pre-line; /* IMPORTANTE para saltos de línea */
                    }

                .hora-col {
                    background-color: #f2f2f2;
                    font-weight: bold;
                    text-align: center;
                    width: 120px;
                }

                .teorico {
                    background-color: #e3f2fd;
                }

                .practico {
                    background-color: #fff3cd;
                }

                .horario-grid tr:hover {
                    background-color: #f5f5f5;
                }
            </style>

            <asp:GridView ID="gv_horario"
                runat="server"
                AutoGenerateColumns="False"
                DataSourceID="sql_ds_horario"
                CssClass="horario-grid"
                GridLines="None"
                OnRowDataBound="gv_horario_RowDataBound">

                <Columns>

                    <asp:BoundField DataField="hora"
                        HeaderText="Hora"
                        ItemStyle-CssClass="hora-col"
                        HeaderStyle-HorizontalAlign="Center" />

                    <asp:TemplateField HeaderText="Lunes">
                        <ItemTemplate>
                            <asp:Label ID="lblLunes" runat="server"
                                Text='<%# Eval("lunes") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Martes">
                        <ItemTemplate>
                            <asp:Label ID="lblMartes" runat="server"
                                Text='<%# Eval("martes") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Miércoles">
                        <ItemTemplate>
                            <asp:Label ID="lblMiercoles" runat="server"
                                Text='<%# Eval("miercoles") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Jueves">
                        <ItemTemplate>
                            <asp:Label ID="lblJueves" runat="server"
                                Text='<%# Eval("jueves") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Viernes">
                        <ItemTemplate>
                            <asp:Label ID="lblViernes" runat="server"
                                Text='<%# Eval("viernes") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Sabado">
                        <ItemTemplate>
                            <asp:Label ID="lblSabado" runat="server"
                                Text='<%# Eval("Sabado") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>
            <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT *
FROM
(
    SELECT  
        CONVERT(varchar(5), h.hora_inicio, 108) + ' - ' + 
        CONVERT(varchar(5), h.hora_fin, 108) AS hora,

        h.dia,

        p.Materia 
        + ' (' + h.tipo_clase + ')' + CHAR(3) 
		+CHAR(10) + 'Doc: ' + replace((t.nombres+' '+t.primerApellido +' '+t.segundoApellido ),'a a a','--* Sin Asignar Docente *--') + CHAR(3) 
		+CHAR(10) + 'Aula: ' +a.nom_aula_lab  + CHAR(3)
		
		+CHAR(10) + 'Grupo: '+h.grupo + CHAR(3)
                +CHAR(10) + 'Semestre: ' + CAST(p.Semestre AS VARCHAR(10)) + CHAR(3)
		+CHAR(10) + 'Carrera: '+ c.CARDES    as detalle

    FROM tb_horario h
    JOIN tb_designacion d ON d.id_horario = h.id_horario 
    JOIN planes_estudios p ON d.id_materia = p.id_plan 
    JOIN tb_aula a ON h.aula = a.id_nomal 
    JOIN tb_personal t ON h.ci_doc = t.ci
                join tb_carreras c ON d.carrera =c.CARSIGLA 
                

    WHERE t.gestion = '1-2026'
    AND h.gestion = '1-2026'
    AND h.sede = @sede	and h.aula =@aula
) AS src

PIVOT
(
    MAX(detalle)
    FOR dia IN ([lunes],[martes],[miercoles],[jueves],[viernes],[sabado])
) AS pvt

ORDER BY hora">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                    <asp:ControlParameter ControlID="ddl_aula" Name="aula" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>


