<%@ Page Language="VB" AutoEventWireup="false" CodeFile="actualizacion_comun.aspx.vb" Inherits="actualizacion_comun" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button2" runat="server" Text="actualizar" />
            <asp:TextBox ID="txt_fecha" runat="server"></asp:TextBox>
            <asp:TextBox ID="txt_id" runat="server"></asp:TextBox>
            <asp:GridView ID="gv_demas" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_demas">
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

            <asp:SqlDataSource ID="sql_ds_demas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select * from tb_ing_sal where hr_salida &lt;hr_ingreso and gestion ='1-2024' and hr_ingreso &gt;='01/10/2023' order by hr_ingreso  desc" UpdateCommand="UPDATE tb_ing_sal SET hr_salida =@horasale WHERE (id_ing_sal = @igsalida)">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txt_id" Name="igsalida" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_fecha" Name="horasale" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>

            <br />
            otro
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Button" />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_comun">
                <Columns>
                    <asp:BoundField DataField="id_designacion" HeaderText="id_designacion" SortExpression="id_designacion" InsertVisible="False" ReadOnly="True" />
                </Columns>
                
            </asp:GridView>
            <asp:TextBox runat="server" ID="txt_id_hor"></asp:TextBox>
            <asp:SqlDataSource ID="sql_ds_comun" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select id_designacion  from tb_designacion 

	where comun ='C' and horas is not null
	order by id_horario ,id_designacion" UpdateCommand="update tb_designacion 
	set horas =(select ((DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45) * 20) as carga_mensual    from tb_designacion td
join tb_horario th on td.id_horario = th.id_horario 
join planes_estudios p on td.id_materia = p.id_plan
	where td.id_designacion =@iddesig
	)
	where id_designacion =@iddesig">
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txt_id_hor" Name="iddesig" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
