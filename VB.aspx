<%@ Page Language="VB" AutoEventWireup="false" CodeFile="VB.aspx.vb" Inherits="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
      <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border:1px solid #ccc;
        }
        table th
        {
            background-color: #F7F7F7;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border-color: #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="input-group mb-1">
                                     <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default border-dark dropdown-toggle mt-1" runat="server" DataSourceID="sql_sede" DataTextField="NombreSede" DataValueField="idSede" Font-Size="9pt"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                     <asp:DropDownList ID="ddl_carrera" CssClass="form-control border-dark btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" Font-Size="9pt" AppendDataBoundItems="True">
                                         <asp:ListItem Value="CARMED">Medicina</asp:ListItem>
                                     </asp:DropDownList>
                                     <asp:Button ID="Button2" runat="server" Text="Button" />
                                     <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                    <asp:Button ID="Button1" runat="server" CssClass ="btn btn-outline-primary mt-1 form-control " Text="Imprimir" Visible="False" />
                                </div>
    <%--<asp:GridView ID = "GridView1" runat = "server" AutoGenerateColumns = "False" OnDataBound = "OnDataBound" OnRowCreated = "OnRowCreated" DataSourceID="SqlDataSource1">--%>
        <asp:GridView ID="GridView1" runat="server"  OnDataBound = "OnDataBound" OnRowCreated = "OnRowCreated"     AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="NombreSede" HeaderText="NombreSede" SortExpression="NombreSede" />
                <asp:BoundField DataField="CARDES" HeaderText="CARDES" SortExpression="CARDES" />
                <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                <asp:BoundField DataField="apellidos" HeaderText="apellidos" ReadOnly="True" SortExpression="apellidos" />
                <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                <asp:BoundField DataField="extension" HeaderText="extension" SortExpression="extension" />
                <asp:BoundField DataField="fechaNacimiento" HeaderText="fechaNacimiento" SortExpression="fechaNacimiento" />
                <asp:BoundField DataField="estadoCivil" HeaderText="estadoCivil" SortExpression="estadoCivil" />
                <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero" />
                <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" />
                <asp:BoundField DataField="nit" HeaderText="nit" SortExpression="nit" />
                <asp:BoundField DataField="nroCuenta" HeaderText="nroCuenta" SortExpression="nroCuenta" />
                <asp:BoundField DataField="banco" HeaderText="banco" SortExpression="banco" />
                <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                <asp:BoundField DataField="celular" HeaderText="celular" SortExpression="celular" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" />
                <asp:BoundField DataField="horas" HeaderText="horas" ReadOnly="True" SortExpression="horas" />
            </Columns>
         </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select s.NombreSede,c.CARDES ,p.nombres ,(p.primerApellido +' '+p.segundoApellido )as apellidos, h.ci_doc,p.extension,p.fechaNacimiento,p.estadoCivil  
/*,g.lic_tec_en*/,p.genero ,p.direccion ,f.nit ,f.nroCuenta ,f.banco ,p.telefono ,p.celular ,p.email  ,pl.Materia,pl.Semestre ,(sum(cast(d.horas as int))*20)as horas 
from tb_horario h
join tb_sedes s on h.sede =s.idSede 
join tb_designacion d on d.id_horario = h.id_horario 
join tb_carreras c on d.carrera = c.CARSIGLA 
join tb_personal p on h.ci_doc = p.ci 
--join tb_grado_academico g on h.ci_doc = g.ci 
join tb_datos_financieros f on h.ci_doc =f.ci 
join planes_estudios pl on d.id_materia = pl.id_plan 
where h.gestion ='2-2022' and p.gestion ='2-2022' and f.gestion ='2-2022' and sede=@sede and d.carrera =@carrera
group by h.ci_doc,p.nombres,pl.Materia,s.NombreSede,c.CARDES,p.primerApellido,p.segundoApellido ,p.extension,p.fechaNacimiento,p.estadoCivil/*
,g.lic_tec_en*/ ,p.direccion,f.nit ,f.nroCuenta ,f.banco ,p.telefono ,p.celular ,p.email ,pl.Semestre ,p.genero 
order by h.ci_doc ">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
            </SelectParameters>
         </asp:SqlDataSource>
    </form>
</body>
</html>

