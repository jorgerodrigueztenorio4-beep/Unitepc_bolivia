<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADMIN_BLO_lista_aulas.aspx.vb" Inherits="ADMIN_BLO_lista_aulas" MasterPageFile="~/mp_adm_blo.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
         <h3>Lista de aulas y eliminacion</h3>
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white">
                                                              <asp:DropDownList ID="ddl_bloque" runat="server" CssClass="form-control  mt-1" DataSourceID="sql_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AutoPostBack="True" AppendDataBoundItems="True">
                                      <asp:ListItem Value="0">Seleccione un bloque</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="sql_bloque" ConnectionString='<%$ ConnectionStrings:unitepc_boliviaConnectionString %>' SelectCommand="SELECT * FROM [tb_bloques] where id_sede=@sede">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txt_idsde" Name="sede" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_ambiente"  CssClass ="form-control mt-1"  runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_ambiente" DataTextField="nombre" DataValueField="id_ambiente" AutoPostBack="True">
                                    <asp:ListItem Value="0">Seleccione el Tipo de Ambiente</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_ambiente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_ambiente]"></asp:SqlDataSource>
                     <asp:GridView ID="gv_aulas" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_aulas" Font-Size="10pt" DataKeyNames="id_nomal" Font-Names="Consolas" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="id_nomal" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_nomal" Visible ="false"  />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Nombre del Ambiente" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad"  />
                                        <asp:BoundField DataField="dimenciones" HeaderText="Superficie" SortExpression="dimenciones" />
                                        <asp:BoundField DataField="nombre" HeaderText="Tipo de Ambiente" SortExpression="nombre" />
                                        <asp:BoundField DataField="gestion" HeaderText="Gestion" SortExpression="gestion"  Visible ="false"  />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_aulas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select id_nomal,nom_aula_lab ,capacidad ,dimenciones ,am.nombre,a.gestion    from tb_aula a
join tb_ambiente am on a.tipo_ambiente= am.id_ambiente 
where Sede =@sede  and bloque =@bloque and gestion='1-2024' and tipo_ambiente =@amb order by am.nombre , nom_aula_lab " DeleteCommand="DELETE FROM tb_aula WHERE (id_nomal = @id_nomal)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id_nomal" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_idsde" Name="sede" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_ambiente" Name="amb" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </div>
            
                         
            </div>

         </div>
          <asp:TextBox ID="txt_idsde" runat="server" Visible="False"></asp:TextBox>
         </form> 

 

</asp:Content>


