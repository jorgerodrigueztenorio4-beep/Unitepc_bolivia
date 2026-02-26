<%@ Page Language="VB" AutoEventWireup="false" CodeFile="horariosoferta.aspx.vb" Inherits="horariosoferta" MasterPageFile="mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">

    <style>
        /* Estilo para que parezca una agenda real */
        .tabla-horario {
            border-collapse: collapse;
            width: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 12px;
            background-color: white;
        }
        .tabla-horario th {
            background-color: #2c3e50;
            color: white;
            padding: 10px;
            text-transform: uppercase;
        }
        .tabla-horario td {
            border: 1px solid #ddd;
            padding: 8px;
            vertical-align: top; /* Importante para el look de horario */
            white-space: pre-wrap; /* Mantiene los saltos de línea del SQL */
            line-height: 1.4;
            min-width: 120px;
        }
        .columna-hora {
            background-color: #f8f9fa;
            font-weight: bold;
            text-align: center;
            width: 90px;
            color: #333;
        }
        .celda-vacia { color: #ccc; font-style: italic; }
    </style>
    <form id="form1" runat="server">
  <%--  <asp:GridView ID="gv_horarios" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horarios">
        <Columns>
            <asp:BoundField DataField="Hora" HeaderText="Hora" ReadOnly="True" SortExpression="Hora" />
            <asp:BoundField DataField="Lunes" HeaderText="Lunes" ReadOnly="True" SortExpression="Lunes" />
            <asp:BoundField DataField="Martes" HeaderText="Martes" ReadOnly="True" SortExpression="Martes" />
            <asp:BoundField DataField="Miércoles" HeaderText="Miércoles" ReadOnly="True" SortExpression="Miércoles" />
            <asp:BoundField DataField="Jueves" HeaderText="Jueves" ReadOnly="True" SortExpression="Jueves" />
            <asp:BoundField DataField="Viernes" HeaderText="Viernes" ReadOnly="True" SortExpression="Viernes" />
            <asp:BoundField DataField="Sábado" HeaderText="Sábado" ReadOnly="True" SortExpression="Sábado" />
        </Columns>
        </asp:GridView>--%>
        <asp:DropDownList ID="ddl_sede" runat="server" AutoPostBack="True" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
        <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
        <asp:DropDownList ID="ddl_carrera" runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>
        <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] ORDER BY [CARDES]"></asp:SqlDataSource>
        <asp:DropDownList ID="ddl_semestre" runat="server" AutoPostBack="True">
            <asp:ListItem Value="0">Semestre</asp:ListItem>
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
        <asp:GridView ID="gv_horarios" runat="server" AutoGenerateColumns="False" 
            DataSourceID="sql_ds_horarios" CssClass="tabla-horario">
            <Columns>
                <%-- Columna de Hora --%>

                <%-- Columnas de Días --%>
                <asp:BoundField DataField="Hora" HeaderText="Hora" ReadOnly="True" SortExpression="Hora" />
                <asp:BoundField DataField="Lunes" HeaderText="Lunes" ReadOnly="True" SortExpression="Lunes" />
                <asp:BoundField DataField="Martes" HeaderText="Martes" ReadOnly="True" SortExpression="Martes" />
                <asp:BoundField DataField="Miércoles" HeaderText="Miércoles" ReadOnly="True" SortExpression="Miércoles" />
                <asp:BoundField DataField="Jueves" HeaderText="Jueves" ReadOnly="True" SortExpression="Jueves" />
                <asp:BoundField DataField="Viernes" HeaderText="Viernes" ReadOnly="True" SortExpression="Viernes" />
                <asp:BoundField DataField="Sábado" HeaderText="Sábado" ReadOnly="True" SortExpression="Sábado" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sql_ds_horarios" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="WITH Bloques AS (
     SELECT 1 bloque, '06:45' hi, '07:30' hf UNION ALL
    SELECT 2, '07:30', '08:15' UNION ALL
    SELECT 3, '08:15', '09:00' UNION ALL
    SELECT 4, '09:00', '09:45' UNION ALL
    SELECT 5, '09:45', '10:30' UNION ALL
    SELECT 6, '10:30', '11:15' UNION ALL
    SELECT 7, '11:15', '12:00' UNION ALL
    SELECT 8, '12:00', '12:45' union ALL
	SELECT 9, '12:45', '13:30' union ALL
	SELECT 10, '13:30', '14:15' union ALL
	SELECT 11, '14:15', '15:00' union ALL
	SELECT 12, '15:00', '15:45' union ALL
	SELECT 13, '15:45', '16:30' union ALL
	SELECT 14, '16:30', '17:15' union ALL
	SELECT 15, '17:15', '18:00' union ALL
	SELECT 16, '18:00', '18:45' union ALL
	SELECT 17, '18:45', '19:30' union ALL
	SELECT 18, '19:30', '20:15' union ALL
	SELECT 19, '20:15', '21:00' union ALL
	SELECT 20, '21:00', '21:45' union ALL
	SELECT 21, '21:45', '22:30' union ALL
	SELECT 22, '22:30', '23:15'
),
BaseHorario AS (
    SELECT
        b.bloque,
        b.hi + '-' + b.hf AS rango_hora,
        th.dia,
        -- Construcción del bloque visual de la materia
        p.Materia + CHAR(10) + 
        'Aula: ' + ISNULL(a.nom_aula_lab, '--') + CHAR(10) +
        'Doc: ' + ISNULL(
            NULLIF(
                LTRIM(RTRIM(tp.nombres + ' ' + tp.primerApellido + ' ' + tp.segundoApellido)),
                ''
            ),
            '--* Sin Asignar Docente *--'
        ) + CHAR(10) +
        'Grupo: ' + CAST(th.grupo AS varchar(10)) AS detalle
    FROM Bloques b
    LEFT JOIN tb_horario th ON 
        CAST(b.hi AS time) &gt;= CAST(th.hora_inicio AS time) 
        AND CAST(b.hi AS time) &lt; CAST(th.hora_fin AS time)
        AND th.gestion = '1-2026' 
        AND th.sede = @sede
    LEFT JOIN tb_designacion td ON 
        td.id_horario = th.id_horario 
    LEFT JOIN planes_estudios p ON 
        td.id_materia = p.id_plan
        -- FILTROS ESPECÍFICOS AQUÍ:
        AND p.codcar = @carrera  -- Filtro por Carrera
        AND p.semestre = @semestre    -- Filtro por Semestre (Cámbialo según necesites)
    LEFT JOIN tb_aula a ON 
        th.aula = a.id_nomal 
        AND a.gestion = '1-2024'
    LEFT JOIN tb_personal tp ON 
        th.ci_doc = tp.ci and tp.gestion ='1-2026'
)
SELECT
    rango_hora AS [Hora],
    ISNULL([Lunes], '') AS [Lunes],
    ISNULL([Martes], '') AS [Martes],
    ISNULL([Miercoles], '') AS [Miércoles],
    ISNULL([Jueves], '') AS [Jueves],
    ISNULL([Viernes], '') AS [Viernes],
    ISNULL([Sabado], '') AS [Sábado]
FROM (
    SELECT rango_hora, dia, detalle, bloque FROM BaseHorario
) SourceTable
PIVOT (
    MAX(detalle)
    FOR dia IN ([Lunes], [Martes], [Miercoles], [Jueves], [Viernes], [Sabado])
) pvt
ORDER BY bloque;">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddl_semestre" Name="semestre" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>


