<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_NAL_formato.aspx.vb" Inherits="DAF_NAL_formato" MasterPageFile="~/mp_daf_nacional.master" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
       <form id="form1" runat="server">
       <asp:DropDownList ID="ddl_dia" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1" runat="server" AutoPostBack="True" AppendDataBoundItems="True">
                                    <asp:ListItem>Dia</asp:ListItem>
                                    <asp:ListItem>Lunes</asp:ListItem>
                                    <asp:ListItem>Martes</asp:ListItem>
                                    <asp:ListItem>Miercoles</asp:ListItem>
                                    <asp:ListItem>Jueves</asp:ListItem>
                                    <asp:ListItem>Viernes</asp:ListItem>
                                    <asp:ListItem>Sabado</asp:ListItem>
                                </asp:DropDownList>
    <asp:DropDownList ID="ddl_bloque" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1"  runat="server" DataSourceID="sql_ds_bloque" DataTextField="nombre" DataValueField="id_bloque" AutoPostBack="True">
        <asp:ListItem Value="0">Bloque</asp:ListItem>
           </asp:DropDownList>
           <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (s.NombreSede +'-'+ b.nom_bloque) as nombre , b.id_bloque   from tb_bloques b
join tb_sedes s on b.id_sede = s.idSede 
order by nombre"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="sql_ds_formato"></asp:GridView>
    <asp:SqlDataSource ID="sql_ds_formato" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="aulasrep" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="ddl_dia" Name="dia" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
           </asp:SqlDataSource>
           <asp:TextBox ID="txt_vacio" runat="server"></asp:TextBox>
       </form>
</asp:Content>

