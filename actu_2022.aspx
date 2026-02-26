<%@ Page Language="VB" AutoEventWireup="false" CodeFile="actu_2022.aspx.vb" Inherits="actu_2022" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="dist/css/adminlte.css" rel="stylesheet" />
    <link href="dist/css/adminlte.min.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 683px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:DropDownList ID="ddl_sede" runat="server" AutoPostBack="True" DataSourceID="sqlds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
        <asp:SqlDataSource ID="sqlds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA">
        </asp:DropDownList>
        <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]" InsertCommand="INSERT INTO tb_Proyeccion
(
     Sede,
    Carrera,
    Semestre,
    Sigla_mat,
    CantGrupoTeo,
    CantGrupoPrac,
    Gestion
)
VALUES
(
  
    @Sede,
    @Carrera,
    @Semestre,
    @Sigla_mat,
    @CantGrupoTeo,
    @CantGrupoPrac,
    '1-2026'
);
">
            <InsertParameters>
                <asp:ControlParameter ControlID="ddl_sede" Name="Sede" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="DropDownList1" Name="Carrera" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txt_semestre" Name="Semestre" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_sigla" Name="Sigla_mat" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_gteo" Name="CantGrupoTeo" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_gprac" Name="CantGrupoPrac" PropertyName="Text" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="actualizar" />
        <asp:Button ID="Button2" runat="server" Text="guardar" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:TextBox ID="txt_semestre" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_sigla" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_gteo" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_gprac" runat="server"></asp:TextBox>
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1">  <asp:GridView ID="gvProyeccion" runat="server">
        </asp:GridView> </td>
                <td><asp:GridView ID="gv_db" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_proyeccion">
                    <Columns>
                        <asp:BoundField DataField="id_Proyeccion" HeaderText="id_Proyeccion" InsertVisible="False" ReadOnly="True" SortExpression="id_Proyeccion" />
                        <asp:BoundField DataField="Sede" HeaderText="Sede" SortExpression="Sede" />
                        <asp:BoundField DataField="Carrera" HeaderText="Carrera" SortExpression="Carrera" />
                        <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" />
                        <asp:BoundField DataField="Sigla_mat" HeaderText="Sigla_mat" SortExpression="Sigla_mat" />
                        <asp:BoundField DataField="CantGrupoTeo" HeaderText="CantGrupoTeo" SortExpression="CantGrupoTeo" />
                        <asp:BoundField DataField="CantGrupoPrac" HeaderText="CantGrupoPrac" SortExpression="CantGrupoPrac" />
                        <asp:BoundField DataField="Gestion" HeaderText="Gestion" SortExpression="Gestion" />
                    </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sql_ds_proyeccion" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_Proyeccion] WHERE (([Sede] = @Sede) AND ([Carrera] = @Carrera))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddl_sede" Name="Sede" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="DropDownList1" Name="Carrera" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                
            </tr>
            <tr>
                <td>otro desde aqui</td>
            </tr>
            <tr>
                <td valign="top" style="padding:0; margin:0;">
                    <asp:GridView ID="gv_clases" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_clases">
                        <Columns>
                            <asp:BoundField DataField="id_designacion" HeaderText="id_designacion" InsertVisible="False" ReadOnly="True" SortExpression="id_designacion" />
                            <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                            <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                            <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
                            <asp:BoundField DataField="codcar" HeaderText="codcar" SortExpression="codcar" />
                            <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sql_ds_clases" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select  d.id_designacion  ,Materia ,p.SiglaP ,h.sede ,p.codcar ,h.tipo_clase   from tb_designacion d 
join planes_estudios p on d.id_materia = p.id_plan 
join tb_horario h on d.id_horario = h.id_horario 
where gestion='1-2026'" UpdateCommand="update tb_designacion
set  cant_proyec=@cantpro
where id_designacion =@iddesignacion">
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="txt_horasproyec" Name="cantpro" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_id_desing" Name="iddesignacion" PropertyName="Text" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top" style="padding:0; margin:0;">
                    <asp:TextBox ID="txt_id_desing" runat="server"></asp:TextBox>
                    <asp:TextBox ID="txt_horasproyec" runat="server"></asp:TextBox>
                         <asp:GridView ID="gv_proytectotodo" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_proytodo">
                        <Columns>
                            <asp:BoundField DataField="id_Proyeccion" HeaderText="id_Proyeccion" InsertVisible="False" ReadOnly="True" SortExpression="id_Proyeccion" />
                            <asp:BoundField DataField="Sede" HeaderText="Sede" SortExpression="Sede" />
                            <asp:BoundField DataField="Carrera" HeaderText="Carrera" SortExpression="Carrera" />
                            <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" />
                            <asp:BoundField DataField="Sigla_mat" HeaderText="Sigla_mat" SortExpression="Sigla_mat" />
                            <asp:BoundField DataField="CantGrupoTeo" HeaderText="CantGrupoTeo" SortExpression="CantGrupoTeo" />
                            <asp:BoundField DataField="CantGrupoPrac" HeaderText="CantGrupoPrac" SortExpression="CantGrupoPrac" />
                            <asp:BoundField DataField="Gestion" HeaderText="Gestion" SortExpression="Gestion" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sql_ds_proytodo" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_Proyeccion]"></asp:SqlDataSource>
                
               </td>
            </tr>
           
          
        </table>
       
    </form>
</body>
</html>
