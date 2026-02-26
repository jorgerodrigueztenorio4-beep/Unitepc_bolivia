<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_envio_ing.aspx.vb" Inherits="RR_HH_envio_ing" MasterPageFile="~/mp_rr_hh.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
        <asp:DropDownList ID="ddl_sede" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
        <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
    <asp:DropDownList ID="ddl_carrera" runat="server" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>
        <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
        <asp:TextBox ID="txt_inicio" type="date" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_fin" type="date" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Buscar" />
        <asp:GridView ID="gv_lista" runat="server" AutoGenerateColumns="False" DataSourceID="sql_lista">
            <Columns>
                <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                <asp:BoundField DataField="horas" HeaderText="horas" ReadOnly="True" SortExpression="horas" />
                <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sql_lista" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="Select ti.ci_doc ,ti.carrera ,sum(convert(integer,round((((convert(decimal,datediff (SS,TI.hr_ingreso   ,TI.hr_salida ))/60)/45)),0))) AS horas,iif(ti.tipo_clase='Teorico','T','P')  
FROM tb_ing_sal ti  
where TI.carrera =@carrera and TI.hr_ingreso BETWEEN @tfi and @ffin+1  and ti.sede =@sede
group by ti.ci_doc, ti.carrera, ti.tipo_clase 
order by ti.ci_doc ">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txt_inicio" Name="tfi" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="txt_fin" Name="ffin" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="gv_servicio" runat="server">
        </asp:GridView>
        </form>
</asp:Content>



