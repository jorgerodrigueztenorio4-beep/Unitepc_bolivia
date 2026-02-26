<%@ Page Language="VB" AutoEventWireup="false" CodeFile="agregarexamens2horas.aspx.vb" Inherits="agregarexamens2horas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Button" />
                     <asp:TextBox ID="txt_ci" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_nom_materia" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_carsigla" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_aula" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_id_horario" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_sede" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_siglaplan" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_tipo_clase" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_horainicio" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_horafin" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_grupo" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_dia" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_gestion" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_horas" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_fecha_registro" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_bloque" runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_observaciones" runat="server"></asp:TextBox>
            <asp:GridView ID="gv_materias" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario" Font-Names="Consolas" Font-Size="9pt" GridLines="None">
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
            <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.ci_doc  ,p.Materia ,tc.CARSIGLA  ,ta.nom_aula_lab,th.id_horario,th.sede ,p.SiglaP,th.tipo_clase ,th.hora_inicio ,th.hora_fin,th.grupo ,th.dia ,th.gestion ,td.horas,getdate(),th.bloque 
from tb_designacion td
join tb_horario th on td.id_horario = th.id_horario 
join tb_aula ta on th.aula = ta.id_nomal
join tb_personal tp on th.ci_doc = tp.ci 
join planes_estudios p on td.id_materia = p.id_plan
join tb_carreras tc on p.codcar = tc.CARSIGLA
where  
th.gestion ='2-2025'  
and td.horas &lt;&gt;'0'    
and tp.gestion ='2-2025'  
and ta.gestion ='1-2024'
and th.ci_doc='10911367'
and tipo_clase='Teorico'
order by ci_doc "></asp:SqlDataSource>
   
            <asp:GridView ID="gv_reg" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_registrado">
                <Columns>
                    <asp:BoundField DataField="id_ing_sal" HeaderText="id_ing_sal" InsertVisible="False" ReadOnly="True" SortExpression="id_ing_sal" />
                    <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                    <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso" />
                    <asp:BoundField DataField="hr_salida" HeaderText="hr_salida" SortExpression="hr_salida" />
                    <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                    <asp:BoundField DataField="tema_avance" HeaderText="tema_avance" SortExpression="tema_avance" />
                    <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" />
                    <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                    <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
                    <asp:BoundField DataField="aula_o_lab" HeaderText="aula_o_lab" SortExpression="aula_o_lab" />
                    <asp:BoundField DataField="id_horario" HeaderText="id_horario" SortExpression="id_horario" />
                    <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
                    <asp:BoundField DataField="sigla_materia" HeaderText="sigla_materia" SortExpression="sigla_materia" />
                    <asp:BoundField DataField="cant_est" HeaderText="cant_est" SortExpression="cant_est" />
                    <asp:BoundField DataField="ip_marcado" HeaderText="ip_marcado" SortExpression="ip_marcado" />
                    <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                    <asp:BoundField DataField="hra_inicio" HeaderText="hra_inicio" SortExpression="hra_inicio" />
                    <asp:BoundField DataField="hra_fin" HeaderText="hra_fin" SortExpression="hra_fin" />
                    <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                    <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                    <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                    <asp:BoundField DataField="horas" HeaderText="horas" SortExpression="horas" />
                    <asp:BoundField DataField="hora_registro" HeaderText="hora_registro" SortExpression="hora_registro" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sql_ds_registrado" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select * from tb_ing_sal
where observaciones='Clase Examen Final'" InsertCommand="INSERT INTO tb_ing_sal
(ci_doc, Materia, carrera, aula_o_lab, id_horario, sede, sigla_materia,
 tipo_clase, hra_inicio, hra_fin, grupo, dia, gestion, horas, hora_registro,
 bloque, observaciones)
VALUES
(@ci_doc, @Materia, @carrera, @aula_o_lab, @id_horario, @sede, @sigla_materia,
 @tipo_clase, @hra_inicio, @hra_fin, @grupo, @dia, @gestion, @horas,
 @hora_registro, @bloque, @observaciones)
">
                <InsertParameters>
                    <asp:ControlParameter ControlID="txt_ci" Name="ci_doc" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_nom_materia" Name="Materia" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_carsigla" Name="carrera" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_aula" Name="aula_o_lab" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_id_horario" Name="id_horario" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_siglaplan" Name="sigla_materia" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_tipo_clase" Name="tipo_clase" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_horainicio" Name="hra_inicio" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_horafin" Name="hra_fin" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_grupo" Name="grupo" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_dia" Name="dia" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_gestion" Name="gestion" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_horas" Name="horas" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_fecha_registro" Name="hora_registro" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_bloque" Name="bloque" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_observaciones" Name="observaciones" PropertyName="Text" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
