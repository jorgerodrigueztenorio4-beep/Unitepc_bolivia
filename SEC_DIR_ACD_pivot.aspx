<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SEC_DIR_ACD_pivot.aspx.vb" Inherits="SEC_DIR_ACD_pivot" MasterPageFile="~/mp_sec_dir_academico.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
      <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                               Horarios
                            </div>
                                 <div class="input-group mb-1">
                                      <asp:DropDownList ID="ddl_sede"  CssClass="form-control btn btn-default border-dark dropdown-toggle mt-1" runat="server" AutoPostBack="True" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True">
                <asp:ListItem Value="0">Sede</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
            <asp:DropDownList ID="ddl_bloque" runat="server"  CssClass="form-control btn btn-default border-dark dropdown-toggle mt-1" AutoPostBack="True" DataSourceID="sql_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AppendDataBoundItems="True">
                <asp:ListItem Value="0">bloque</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="sql_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques] WHERE ([id_sede] = @id_sede)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_sede" Name="id_sede" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:DropDownList ID="ddl_dia"  CssClass="form-control btn btn-default border-dark dropdown-toggle mt-1" runat="server" AutoPostBack="True">
                
                <asp:ListItem>select dia</asp:ListItem>
                <asp:ListItem>Lunes</asp:ListItem>
                <asp:ListItem>Martes</asp:ListItem>
                <asp:ListItem>Miercoles</asp:ListItem>
                <asp:ListItem>Jueves</asp:ListItem>
                <asp:ListItem>Viernes</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="Button1" CssClass ="btn btn-primary mt-1 form-control " runat="server" Text="Buscar Horario" />
                                     <asp:Button ID="Button2" CssClass ="btn btn-success mt-1 form-control " runat="server" Text="Extraer Reporte" />
                                 </div>
                               
         
            <asp:GridView ID="GridView1" CssClass="table table-hover mt-1 " HeaderStyle-CssClass ="StickyHeader " runat="server" Font-Size="9pt">
                <HeaderStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
            </asp:GridView>

            <asp:SqlDataSource ID="sql_ds_horas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="horario2026" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddl_dia" Name="dia" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

                            </div>
            </div>
         </div>
          </form>








    

</asp:Content>


