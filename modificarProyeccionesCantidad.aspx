<%@ Page Language="VB" AutoEventWireup="false" CodeFile="modificarProyeccionesCantidad.aspx.vb" Inherits="modificarProyeccionesCantidad" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="ddl_sede" runat="server" AutoPostBack="True" DataSourceID="sqlDsSede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
            <asp:SqlDataSource ID="sqlDsSede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
            <asp:DropDownList ID="ddl_carrera" runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>
            <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
            <asp:DropDownList ID="ddl_materias" runat="server" DataSourceID="sql_materias" DataTextField="Materia" DataValueField="id_plan" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="sql_materias" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [planes_estudios] WHERE (([codcar] = @codcar) AND ([Sis_plan] = @Sis_plan))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_carrera" Name="codcar" PropertyName="SelectedValue" Type="String" />
                    <asp:Parameter DefaultValue="N" Name="Sis_plan" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="gv_materias" runat="server" AutoGenerateColumns="False" DataKeyNames="id_plan" DataSourceID="sqlPlanestudios">
                <Columns>
                    <asp:BoundField DataField="id_plan" HeaderText="id_plan" InsertVisible="False" ReadOnly="True" SortExpression="id_plan" />
                    <asp:BoundField DataField="codcar" HeaderText="codcar" SortExpression="codcar" />
                    <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                    <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                    <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" />
                    <asp:BoundField DataField="Hrs_teoricas" HeaderText="Hrs_teoricas" SortExpression="Hrs_teoricas" />
                    <asp:BoundField DataField="Hrs_practicas" HeaderText="Hrs_practicas" SortExpression="Hrs_practicas" />
                    <asp:BoundField DataField="Hrs_Total" HeaderText="Hrs_Total" SortExpression="Hrs_Total" />
                    <asp:BoundField DataField="Creditos" HeaderText="Creditos" SortExpression="Creditos" />
                    <asp:BoundField DataField="Sede_id" HeaderText="Sede_id" SortExpression="Sede_id" />
                    <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlPlanestudios" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [planes_estudios] WHERE ([id_plan] = @id_plan)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_materias" Name="id_plan" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:TextBox ID="txt_semestre" runat="server"></asp:TextBox>
            <asp:TextBox ID="txt_sigla_mat" runat="server"></asp:TextBox>
            <asp:TextBox ID="txt_cantTeorico" placeholder="Cantidad Teorica" runat="server"></asp:TextBox>
            <asp:TextBox ID="txt_cantPractico" placeholder="Cantidad Practica" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Agregar" />
        </div>
        <div>

            <%--        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_proyecciones" DataKeyNames="id_Proyeccion">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="id_Proyeccion" HeaderText="id_Proyeccion" SortExpression="id_Proyeccion" ReadOnly="True" />
                    <asp:BoundField DataField="Carrera" HeaderText="Carrera" SortExpression="Carrera"  ReadOnly="True" />
                    <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" ReadOnly="True"  />
                    <asp:BoundField DataField="Sigla_mat" HeaderText="Sigla_mat" SortExpression="Sigla_mat"  ReadOnly="True" />
                    <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia"  ReadOnly="True" />
                    <asp:BoundField DataField="CantGrupoTeo" HeaderText="CantGrupoTeo" SortExpression="CantGrupoTeo" />
                    <asp:BoundField DataField="CantGrupoPrac" HeaderText="CantGrupoPrac" SortExpression="CantGrupoPrac" />
                </Columns>
            </asp:GridView>--%>
            <asp:GridView
                ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                DataSourceID="sql_ds_proyecciones"
                DataKeyNames="id_Proyeccion"
                CssClass="table table-striped table-hover table-bordered table-sm"
                HeaderStyle-CssClass="table-dark text-center"
                RowStyle-CssClass="align-middle"
                AlternatingRowStyle-CssClass="table-light">

                <Columns>


                    <asp:CommandField
                        ShowEditButton="True"
                        EditText="✏️ Editar"
                        ControlStyle-CssClass="btn btn-sm btn-warning" />

                    <asp:BoundField DataField="id_Proyeccion" HeaderText="ID" ReadOnly="True" />

                    <asp:BoundField DataField="Carrera" HeaderText="Carrera" ReadOnly="True" />

                    <asp:BoundField DataField="Semestre" HeaderText="Sem." ItemStyle-HorizontalAlign="Center" ReadOnly="True" />

                    <asp:BoundField DataField="Sigla_mat" HeaderText="Sigla" ReadOnly="True" />

                    <asp:BoundField DataField="Materia" HeaderText="Materia" ReadOnly="True" />

                    <asp:BoundField
                        DataField="CantGrupoTeo"
                        HeaderText="Cantidad Estudiantes Teóricos"
                        ItemStyle-HorizontalAlign="Center" />

                    <asp:BoundField
                        DataField="CantGrupoPrac"
                        HeaderText="Cantidad Estudiantes Prácticos"
                        ItemStyle-HorizontalAlign="Center" />

                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="sql_ds_proyecciones" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select id_Proyeccion  ,Carrera,p.Semestre ,Sigla_mat ,m.Materia ,CantGrupoTeo ,CantGrupoPrac  from tb_Proyeccion p 
join planes_estudios  m on p.Sigla_mat = m.SiglaP 
where sede=@sede
and Carrera =@carrera"
                UpdateCommand="update tb_Proyeccion 
set CantGrupoTeo =@CantGrupoTeo , CantGrupoPrac =@CantGrupoPrac
where id_Proyeccion=@id_Proyeccion " InsertCommand="INSERT INTO tb_Proyeccion(Sede, Carrera, Semestre, Sigla_mat, CantGrupoTeo, CantGrupoPrac, Gestion) VALUES (@sede, @carrera, @semestre, @sigla, @cmt, @cmp, '1-2026')">
                <InsertParameters>
                    <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="txt_semestre" Name="semestre" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_sigla_mat" Name="sigla" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_cantTeorico" Name="cmt" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_cantPractico" Name="cmp" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CantGrupoTeo" />
                    <asp:Parameter Name="CantGrupoPrac" />
                    <asp:Parameter Name="id_Proyeccion" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
