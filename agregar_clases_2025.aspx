<%@ Page Language="VB" AutoEventWireup="false" CodeFile="agregar_clases_2025.aspx.vb" Inherits="agregar_clases_2025" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cargar Excel a GridView</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button2" runat="server" Text="buscar" />
        <asp:Label ID="lbl_horarios" runat="server" Text=""></asp:Label>
        <asp:TextBox ID="txt_id_horario" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_id_desig" runat="server"></asp:TextBox>
        <asp:Label ID="lbldesig" runat="server" Text=""></asp:Label>
        <asp:GridView ID="gv_designacion" runat="server" AutoGenerateColumns="False" DataSourceID="sql_designacion">
            <Columns>
                <asp:BoundField DataField="id_designacion" HeaderText="id_designacion" InsertVisible="False" ReadOnly="True" SortExpression="id_designacion" />
                <asp:BoundField DataField="id_horario" HeaderText="id_horario" SortExpression="id_horario" />
                <asp:BoundField DataField="id_materia" HeaderText="id_materia" SortExpression="id_materia" />
                <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion" />
                <asp:BoundField DataField="id_sede" HeaderText="id_sede" SortExpression="id_sede" />
                <asp:BoundField DataField="plan_est" HeaderText="plan_est" SortExpression="plan_est" />
                <asp:BoundField DataField="horas" HeaderText="horas" SortExpression="horas" />
                <asp:BoundField DataField="comun" HeaderText="comun" SortExpression="comun" />
                <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
            </Columns>
        </asp:GridView>



        <asp:GridView ID="gv_horarios" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horarios">
            <Columns>
                <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
                <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
                <asp:BoundField DataField="aula" HeaderText="aula" SortExpression="aula" />
                <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" />
                <asp:BoundField DataField="ci_usuario" HeaderText="ci_usuario" SortExpression="ci_usuario" />
                <asp:BoundField DataField="designado" HeaderText="designado" SortExpression="designado" />
                <asp:BoundField DataField="estado_clase" HeaderText="estado_clase" SortExpression="estado_clase" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sql_ds_horarios" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select id_horario, sede, gestion,  tipo_clase, hora_inicio, hora_fin, ci_doc, grupo, dia,  bloque, aula, fecha_registro, ci_usuario, designado,  estado_clase
 from tb_horario th
where th.gestion ='2-2025'  and designado='si' order by id_horario " InsertCommand="INSERT INTO tb_horario (
    sede,
    gestion,
    tipo_clase,
    hora_inicio,
    hora_fin,
    ci_doc,
    grupo,
    dia,
    bloque,
    aula,
    fecha_registro,
    ci_usuario,
    designado,
    estado_clase
)
SELECT
    sede,
    '1-2026',
    tipo_clase,
    hora_inicio,
    hora_fin,
    '0',
    grupo,
    dia,
    bloque,
    aula,
    getdate(),
    ci_usuario,
    designado,
    'Migrado 2-2025' as estado_clase 
FROM tb_horario
 WHERE id_horario=@id_horario;">
            <InsertParameters>
                <asp:ControlParameter ControlID="txt_id_horario" Name="id_horario" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="sql_designacion" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_designacion, id_horario, id_materia, fecha_creacion, id_sede, plan_est, horas, comun, carrera FROM tb_designacion WHERE (id_horario = @id_orairo)" InsertCommand="INSERT INTO tb_designacion(
    id_horario,
    id_materia,
    fecha_creacion,
    id_sede,
    plan_est,
    horas,
    comun,
    carrera
)
SELECT
    id_horario,
    id_materia,
    getdate(),
    id_sede,
    plan_est,
    horas,
    comun,
    carrera
FROM tb_designacion
where  id_designacion=@id_designacion">
            <InsertParameters>
                <asp:ControlParameter ControlID="txt_id_desig" Name="id_designacion" PropertyName="Text" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_id_horario" Name="id_orairo" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>



        <h2>desde aqui anterior</h2>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <asp:Button ID="btn_dir" runat="server" Text="agregar" />
        <asp:TextBox ID="txt_fecha" runat="server" Width="242px"></asp:TextBox>


        dia<asp:TextBox ID="txt_dia" runat="server"></asp:TextBox>
         cidoc<asp:TextBox ID="txt_cidoc" runat="server"></asp:TextBox>
        hraingreso<asp:TextBox ID="txt_hraingreso" runat="server"></asp:TextBox>
        hrasalida<asp:TextBox ID="txt_hrasalida" runat="server"></asp:TextBox>
        materia<asp:TextBox ID="txt_materia" runat="server"></asp:TextBox>
        carsila<asp:TextBox ID="txt_carsigla" runat="server"></asp:TextBox>
        aula<asp:TextBox ID="txt_aula" runat="server"></asp:TextBox>
        idhorario<asp:TextBox ID="txt_idhorario" runat="server"></asp:TextBox>
        sede<asp:TextBox ID="txt_sede" runat="server"></asp:TextBox>
        sigla materia<asp:TextBox ID="txt_siglamateria" runat="server"></asp:TextBox>
        tipoclase<asp:TextBox ID="txt_tipoclase" runat="server"></asp:TextBox>
        hrainicio<asp:TextBox ID="txt_hrainicio" runat="server"></asp:TextBox>
        hrafin<asp:TextBox ID="txt_horafin" runat="server"></asp:TextBox>
        grupo<asp:TextBox ID="txt_grupo" runat="server"></asp:TextBox>
        gestion<asp:TextBox ID="txt_gestion" runat="server"></asp:TextBox>
        horas<asp:TextBox ID="txt_horas" runat="server"></asp:TextBox>
        horaregistro<asp:TextBox ID="txt_horaregistro" runat="server"></asp:TextBox>
        bloque<asp:TextBox ID="txt_bloque" runat="server"></asp:TextBox>
        obs<asp:TextBox ID="txt_observaciones" runat="server"></asp:TextBox>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="sql_agregar">
            <Columns>
                <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                <asp:BoundField DataField="horaingreso" HeaderText="horaingreso" ReadOnly="True" SortExpression="horaingreso" />
                <asp:BoundField DataField="horasalida" HeaderText="horasalida" ReadOnly="True" SortExpression="horasalida" />
                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                <asp:BoundField DataField="CARSIGLA" HeaderText="CARSIGLA" SortExpression="CARSIGLA" />
                <asp:BoundField DataField="nom_aula_lab" HeaderText="nom_aula_lab" SortExpression="nom_aula_lab" />
                <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
                <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                <asp:BoundField DataField="horas" HeaderText="horas" SortExpression="horas" />
                <asp:BoundField DataField="hraregistro" HeaderText="hraregistro" ReadOnly="True" SortExpression="hraregistro" />
                <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
                <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sql_agregar" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.ci_doc,   (@fecha +' '+th.hora_inicio+':00') as horaingreso, (@fecha+' '+th.hora_fin+':00') as horasalida,p.Materia ,tc.CARSIGLA  ,ta.nom_aula_lab,th.id_horario,th.sede ,p.SiglaP,th.tipo_clase ,th.hora_inicio ,th.hora_fin,th.grupo ,th.dia ,th.gestion ,td.horas,@fecha as hraregistro,th.bloque,'Respaldo directo Dir.' 
from tb_designacion td
join tb_horario th on td.id_horario = th.id_horario 
join tb_aula ta on th.aula = ta.id_nomal
join tb_personal tp on th.ci_doc = tp.ci 
join planes_estudios p on td.id_materia = p.id_plan
join tb_carreras tc on p.codcar = tc.CARSIGLA
where  th.dia =@dia
 and th.gestion ='2-2025'  and td.horas &lt;&gt;'0'    and tp.gestion ='2-2025'  and ta.gestion ='1-2024'" InsertCommand="    INSERT INTO tb_ing_sal
    (ci_doc, hr_ingreso, hr_salida, Materia, carrera, aula_o_lab, id_horario,
     sede, sigla_materia, tipo_clase, hra_inicio, hra_fin, grupo, dia,
     gestion, horas, hora_registro, bloque, observaciones)
    VALUES
    (@ci_doc, @hr_ingreso, @hr_salida, @Materia, @carrera, @aula_o_lab, @id_horario,
     @sede, @sigla_materia, @tipo_clase, @hra_inicio, @hra_fin, @grupo, @dia,
     @gestion, @horas, @hora_registro, @bloque, @observaciones)">
            <InsertParameters>
                <asp:ControlParameter ControlID="txt_cidoc" Name="ci_doc" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_hraingreso" Name="hr_ingreso" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txt_hrasalida" Name="hr_salida" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txt_materia" Name="Materia" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_carsigla" Name="carrera" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_aula" Name="aula_o_lab" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_idhorario" Name="id_horario" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_siglamateria" Name="sigla_materia" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_tipoclase" Name="tipo_clase" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_hrainicio" Name="hra_inicio" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_horafin" Name="hra_fin" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_grupo" Name="grupo" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_dia" Name="dia" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_gestion" Name="gestion" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_horas" Name="horas" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_horaregistro" Name="hora_registro" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txt_bloque" Name="bloque" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_observaciones" Name="observaciones" PropertyName="Text" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_dia" Name="dia" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_fecha" Name="fecha" PropertyName="Text" />

            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />


        <asp:Label ID="lbl_cont" runat="server" Text="Label"></asp:Label>
        <asp:Button ID="Button1" runat="server" Text="Button" />
       
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:TextBox ID="txt_ci_busqueda" runat="server"></asp:TextBox>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario">
            <Columns>
                <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                <asp:BoundField DataField="CARSIGLA" HeaderText="CARSIGLA" SortExpression="CARSIGLA" />
                <asp:BoundField DataField="nom_aula_lab" HeaderText="nom_aula_lab" SortExpression="nom_aula_lab" />
                <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
                <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                <asp:BoundField DataField="horas" HeaderText="horas" SortExpression="horas" />
                <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
            </Columns>
        </asp:GridView>
        
        <asp:GridView ID="gv_clases" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_clases">
            <Columns>
                <asp:BoundField DataField="DOCENTE" HeaderText="DOCENTE" SortExpression="DOCENTE" />
                <asp:BoundField DataField="C#I#" HeaderText="C#I#" SortExpression="C#I#" />
                <asp:BoundField DataField="ASIGNATURA" HeaderText="ASIGNATURA" SortExpression="ASIGNATURA" />
                <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" />
                <asp:BoundField DataField="ingreso" HeaderText="ingreso" ReadOnly="True" SortExpression="ingreso" />
                <asp:BoundField DataField="salida" HeaderText="salida" ReadOnly="True" SortExpression="salida" />
                <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sql_ds_clases" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT DOCENTE, C#I#, ASIGNATURA,FECHA, REPLACE(ingreso, ' ', '') AS ingreso, REPLACE(salida, ' ', '') AS salida, dia FROM Hoja1"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.ci_doc  ,p.Materia ,tc.CARSIGLA  ,ta.nom_aula_lab,th.id_horario,th.sede ,p.SiglaP,th.tipo_clase ,th.hora_inicio ,th.hora_fin,th.grupo ,th.dia ,th.gestion ,td.horas,getdate(),th.bloque 
from tb_designacion td
join tb_horario th on td.id_horario = th.id_horario 
join tb_aula ta on th.aula = ta.id_nomal
join tb_personal tp on th.ci_doc = tp.ci 
join planes_estudios p on td.id_materia = p.id_plan
join tb_carreras tc on p.codcar = tc.CARSIGLA
 and th.gestion ='2-2025'  and td.horas &lt;&gt;'0'    and tp.gestion ='2-2025'  and ta.gestion ='1-2024' and ci_doc=@ci" InsertCommand="INSERT INTO tb_ing_sal
(
    ci_doc,
    Materia,
    carrera,
    aula_o_lab,
    id_horario,
    sede,
    sigla_materia,
    tipo_clase,
    hra_inicio,
    hra_fin,
    grupo,
    dia,
    gestion,
    horas,
    hora_registro,
    bloque,
	observaciones,
	hr_ingreso,
	hr_salida
)
VALUES
(
    @ci_doc,
    @Materia,
    @carrera,
    @aula_o_lab,
    @id_horario,
    @sede,
    @sigla_materia,
    @tipo_clase,
    @hra_inicio,
    @hra_fin,
    @grupo,
    @dia,
    @gestion,
    @horas,
    @hora_registro,
    @bloque,
	'No Asistio a Clases GY',
	@hr_ingreso,
	@hr_salida

);">
            <InsertParameters>
                <asp:ControlParameter ControlID="txt_cidoc" Name="ci_doc" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_materia" Name="Materia" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_carsigla" Name="carrera" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_aula" Name="aula_o_lab" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_idhorario" Name="id_horario" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_siglamateria" Name="sigla_materia" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_tipoclase" Name="tipo_clase" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_hrainicio" Name="hra_inicio" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_horafin" Name="hra_fin" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_grupo" Name="grupo" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_dia" Name="dia" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_gestion" Name="gestion" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_horas" Name="horas" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_horaregistro" Name="hora_registro" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txt_bloque" Name="bloque" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_horaregistro" Name="hr_ingreso" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txt_horaregistro" Name="hr_salida" PropertyName="Text" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_ci_busqueda" Name="ci" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </form>
</body>
</html>