<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_NAL_proyeccion.aspx.vb" Inherits="DAF_NAL_proyeccion" MasterPageFile="~/mp_daf_nacional.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_proyectos">
        <Columns>
            <asp:BoundField DataField="NombreSede" HeaderText="NombreSede" SortExpression="NombreSede" />
            <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
            <asp:BoundField DataField="Hras_programadas" HeaderText="Hras_programadas" ReadOnly="True" SortExpression="Hras_programadas" />
            <asp:BoundField DataField="Hras_ejecutas" HeaderText="Hras_ejecutas" ReadOnly="True" SortExpression="Hras_ejecutas" />
            <asp:BoundField DataField="Diferencia" HeaderText="Diferencia" ReadOnly="True" SortExpression="Diferencia" />
            <asp:BoundField DataField="Porcentaje_Ejecutado" HeaderText="Porcentaje_Ejecutado" ReadOnly="True" SortExpression="Porcentaje_Ejecutado" />
        </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sql_ds_proyectos" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT 
    s.NombreSede,
    ti.carrera,

    -- Horas programadas como entero
    SUM(
        CONVERT(INT, ROUND(ISNULL(DATEDIFF(SECOND, ti.hra_inicio, ti.hra_fin) / 60.0 / 45.0, 0), 0))
    ) AS Hras_programadas,

    -- Horas ejecutadas como entero
    SUM(
        CONVERT(INT, ROUND(ISNULL(DATEDIFF(SECOND, ti.hr_ingreso, ti.hr_salida) / 60.0 / 45.0, 0), 0))
    ) AS Hras_ejecutas,

    -- Diferencia
    SUM(
        CONVERT(INT, ROUND(ISNULL(DATEDIFF(SECOND, ti.hra_inicio, ti.hra_fin) / 60.0 / 45.0, 0), 0))
    ) -
    SUM(
        CONVERT(INT, ROUND(ISNULL(DATEDIFF(SECOND, ti.hr_ingreso, ti.hr_salida) / 60.0 / 45.0, 0), 0))
    ) AS Diferencia,

    -- Porcentaje ejecutado como entero
    CONVERT(INT,
        CASE 
            WHEN SUM(CONVERT(INT, ROUND(ISNULL(DATEDIFF(SECOND, ti.hra_inicio, ti.hra_fin) / 60.0 / 45.0, 0), 0))) = 0 
                THEN 0
            ELSE 
                (SUM(CONVERT(INT, ROUND(ISNULL(DATEDIFF(SECOND, ti.hr_ingreso, ti.hr_salida) / 60.0 / 45.0, 0), 0))) * 100.0) /
                SUM(CONVERT(INT, ROUND(ISNULL(DATEDIFF(SECOND, ti.hra_inicio, ti.hra_fin) / 60.0 / 45.0, 0), 0)))
        END
    ) AS Porcentaje_Ejecutado

FROM tb_ing_sal ti
join tb_sedes s on ti.sede=s.idSede
WHERE ti.gestion = '1-2025'
GROUP BY s.NombreSede, ti.carrera
ORDER BY s.NombreSede, ti.carrera;
"></asp:SqlDataSource>
    </form>
</asp:Content>


