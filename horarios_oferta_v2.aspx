<%@ Page Language="VB" AutoEventWireup="false" CodeFile="horarios_oferta_v2.aspx.vb" Inherits="horarios_oferta_v2" MasterPageFile="~/mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <style>
        .table td {
    white-space: pre-line; /* respeta saltos de línea */
    font-size: 12px;
    vertical-align: top;
    
}

.table th {
    text-align: center;


}
.table td:hover {
    filter: brightness(0.97);
}
 .hora-centro {
        vertical-align: middle !important;
        text-align: center;
        font-weight: bold;
        white-space: nowrap;
    }
 .form-container {
    max-width: 420px;
    margin: 40px auto;
    padding: 25px;
    background: #ffffff;
    border-radius: 10px;
    box-shadow: 0 8px 20px rgba(0,0,0,.08);
    font-family: "Segoe UI", sans-serif;
}

.form-group {
    margin-bottom: 15px;
}

.form-input,
.form-select {
    width: 100%;
    padding: 10px 12px;
    font-size: 14px;
    border-radius: 6px;
    border: 1px solid #ccc;
    transition: all .2s ease-in-out;
}

.form-input:focus,
.form-select:focus {
    outline: none;
    border-color: #0d6efd;
    box-shadow: 0 0 0 3px rgba(13,110,253,.15);
}

.hidden {
    display: none;
}


    </style>
    <form runat="server" >
        <div class="form-group">
        <asp:TextBox 
            ID="txt_codigo" 
            runat="server" 
            CssClass="form-input"
            placeholder="Ingrese su código de estudiante" AutoPostBack="True"></asp:TextBox>
    </div>

    <div class="form-group">
        <asp:DropDownList 
            ID="ddl_sede" 
            runat="server" 
            CssClass="form-select"
            AutoPostBack="True"
            DataSourceID="sql_ds_sede"
            DataTextField="NombreSede"
            DataValueField="idSede"
             Visible ="false" 
            AppendDataBoundItems="True">
            
            <asp:ListItem Value="0">Seleccione una sede</asp:ListItem>
        </asp:DropDownList>
    </div>

    <asp:SqlDataSource 
        ID="sql_ds_sede" 
        runat="server"
        ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>"
        SelectCommand="SELECT * FROM tb_sedes">
    </asp:SqlDataSource>

    <div class="form-group">
        <asp:DropDownList 
            ID="ddl_semestre" 
            runat="server" 
            CssClass="form-select"
            AutoPostBack="True" 
             Visible ="false" >
            <asp:ListItem Value="0">Seleccione semestre</asp:ListItem>
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
        </asp:DropDownList>
    </div>


        <asp:TextBox ID="txt_carrera" runat="server" Visible="false"></asp:TextBox>
        <asp:GridView ID="gv_estudiantes" runat="server" Visible="False"></asp:GridView>
        <asp:GridView ID="gv_horario" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario"    CssClass="table table-bordered table-sm" GridLines="None" HeaderStyle-CssClass="bg-dark text-white text-center" RowStyle-CssClass="" OnRowDataBound="gv_Horario_RowDataBound" BorderStyle="None" >
            <EmptyDataTemplate>
        <div class="alert alert-warning text-center m-2">
            <strong>⚠️ No existen horarios registrados para el semestre seleccionado o seleccione otro semestre.</strong><br />
            
        </div>
    </EmptyDataTemplate>
            <Columns>
                <asp:BoundField DataField="HORA" HeaderText="HORA">
    <ItemStyle CssClass="hora-centro" />
</asp:BoundField>


                <asp:BoundField DataField="LUNES" HeaderText="LUNES" ReadOnly="True" SortExpression="LUNES" ItemStyle-Wrap ="true"  >
<ItemStyle Wrap="True"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="MARTES" HeaderText="MARTES" ReadOnly="True" SortExpression="MARTES" ItemStyle-Wrap ="true"  >
<ItemStyle Wrap="True"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="MIERCOLES" HeaderText="MIERCOLES" ReadOnly="True" SortExpression="MIÉRCOLES" ItemStyle-Wrap ="true"  >
<ItemStyle Wrap="True"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="JUEVES" HeaderText="JUEVES" ReadOnly="True" SortExpression="JUEVES" ItemStyle-Wrap ="true"  >
<ItemStyle Wrap="True"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="VIERNES" HeaderText="VIERNES" ReadOnly="True" SortExpression="VIERNES" ItemStyle-Wrap ="true"  >
<ItemStyle Wrap="True"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="SÁBADO" HeaderText="SÁBADO" ReadOnly="True" SortExpression="SÁBADO" ItemStyle-Wrap ="true"  >
<ItemStyle Wrap="True"></ItemStyle>
                </asp:BoundField>
            </Columns>

<HeaderStyle CssClass="bg-dark text-white text-center"></HeaderStyle>

<RowStyle CssClass="align-top"></RowStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="WITH base AS (
    SELECT
        CONCAT(th.hora_inicio, ' - ', th.hora_fin) AS HORA,
        UPPER(th.dia) AS DIA,
        CONCAT(
            '&lt;b&gt;', p.Materia, ' (', p.SiglaP, ')&lt;/b&gt;', CHAR(10),
            '&lt;b&gt;Aula: &lt;/b&gt;', a.nom_aula_lab, CHAR(10),
            '&lt;b&gt;Docente: &lt;/b&gt;',
            REPLACE( 
                (tp.nombres + ' ' + tp.primerApellido + ' ' + tp.segundoApellido),
                'a a a',
                '--* Sin Asignar Docente *--'
            ),
            CHAR(10),
            '&lt;b&gt;Grupo: &lt;/b&gt;', th.grupo,CHAR(10),
			'&lt;b&gt;Clase: &lt;/b&gt;', th.tipo_clase 
        ) AS DETALLE
    FROM tb_designacion td
    INNER JOIN tb_horario th ON td.id_horario = th.id_horario
    INNER JOIN tb_personal tp ON th.ci_doc = tp.ci
    INNER JOIN planes_estudios p ON td.id_materia = p.id_plan
    INNER JOIN tb_aula a ON th.aula = a.id_nomal
    WHERE
        th.gestion = '1-2026'
        AND tp.gestion = '1-2026'
        AND th.sede = @sede
        AND a.gestion = '1-2024'
        AND p.Semestre = @semestre
        AND p.codcar = @carrera
),

agrupado AS (
    SELECT
        HORA,
        DIA,
        STUFF((
            SELECT
                CASE 
                    WHEN ROW_NUMBER() OVER (
                        PARTITION BY b2.HORA, b2.DIA 
                        ORDER BY b2.DETALLE
                    ) = 1
                    THEN CHAR(10) + b2.DETALLE
                    ELSE CHAR(10) + '&lt;b&gt;==================================&lt;/b&gt;' + CHAR(10) + b2.DETALLE
                END
            FROM base b2
            WHERE
                b2.HORA = b1.HORA
                AND b2.DIA = b1.DIA
            FOR XML PATH(''), TYPE
        ).value('.', 'NVARCHAR(MAX)'), 1, 1, '') AS DETALLE
    FROM base b1
    GROUP BY
        HORA,
        DIA
)


SELECT
    HORA,
    [LUNES],
    [MARTES],
    [MIERCOLES],
    [JUEVES],
    [VIERNES],
    [SÁBADO]
FROM agrupado
PIVOT (
    MAX(DETALLE)
    FOR DIA IN (
        [LUNES],
        [MARTES],
        [MIERCOLES],
        [JUEVES],
        [VIERNES],
        [SÁBADO]
    )
) p
ORDER BY HORA;
">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddl_semestre" Name="semestre" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txt_carrera" Name="carrera" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>


