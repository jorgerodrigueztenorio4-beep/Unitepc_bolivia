<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_BLO_subir_aulas2.aspx.vb" Inherits="ADM_BLO_subir_aulas2" MasterPageFile="~/mp_adm_blo.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
      <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                               Datos del Aula
                            </div>
                                  <asp:DropDownList ID="ddl_bloque" runat="server" CssClass="form-control  mt-1" DataSourceID="sql_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AutoPostBack="True" AppendDataBoundItems="True">
                                      <asp:ListItem Value="0">Seleccione un bloque</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="sql_bloque" ConnectionString='<%$ ConnectionStrings:unitepc_boliviaConnectionString %>' SelectCommand="SELECT * FROM [tb_bloques] where id_sede=@sede">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txt_idsde" Name="sede" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_ambiente"  CssClass ="form-control mt-1"  runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_ambiente" DataTextField="nombre" DataValueField="id_ambiente">
                                    <asp:ListItem Value="0">Seleccione el Tipo de Ambiente</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_ambiente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_ambiente]"></asp:SqlDataSource>
                    <asp:TextBox ID="txt_nom_aula_lab" placeholder="Nombre del Aula o Lab." CssClass ="form-control mt-1" runat="server"></asp:TextBox>
                    <asp:DropDownList ID="ddl_capacidad" CssClass ="form-control mt-1" runat="server">
                        <asp:ListItem Value="0">Capacidad</asp:ListItem>
                        <asp:ListItem Value="5"></asp:ListItem>
                        <asp:ListItem Value="10"></asp:ListItem>
                        <asp:ListItem Value="15"></asp:ListItem>
                        <asp:ListItem Value="20"></asp:ListItem>
                        <asp:ListItem Value="25"></asp:ListItem>
                        <asp:ListItem Value="30"></asp:ListItem>
                        <asp:ListItem Value="35"></asp:ListItem>
                        <asp:ListItem Value="40"></asp:ListItem>
                        <asp:ListItem Value="45"></asp:ListItem>
                        <asp:ListItem Value="50"></asp:ListItem>
                        <asp:ListItem Value="55"></asp:ListItem>
                        <asp:ListItem Value="60"></asp:ListItem>
                        <asp:ListItem Value="65"></asp:ListItem>
                        <asp:ListItem Value="70"></asp:ListItem>
                    </asp:DropDownList>
                                 <asp:DropDownList ID="ddl_capbs" CssClass ="form-control mt-1" runat="server">
                        <asp:ListItem Value="0">Capacidad Bioseguridad</asp:ListItem>
                        <asp:ListItem Value="5"></asp:ListItem>
                        <asp:ListItem Value="10"></asp:ListItem>
                        <asp:ListItem Value="15"></asp:ListItem>
                        <asp:ListItem Value="20"></asp:ListItem>
                        <asp:ListItem Value="25"></asp:ListItem>
                        <asp:ListItem Value="30"></asp:ListItem>
                        <asp:ListItem Value="35"></asp:ListItem>
                        <asp:ListItem Value="40"></asp:ListItem>
                        <asp:ListItem Value="45"></asp:ListItem>
                        <asp:ListItem Value="50"></asp:ListItem>
                        <asp:ListItem Value="55"></asp:ListItem>
                        <asp:ListItem Value="60"></asp:ListItem>
                        <asp:ListItem Value="65"></asp:ListItem>
                        <asp:ListItem Value="70"></asp:ListItem>
                    </asp:DropDownList>
                                <asp:TextBox ID="txt_dimencion" CssClass ="form-control mt-1 " placeholder="Dimencion Ancho X Largo" runat="server"></asp:TextBox>
                               <%-- <asp:Label ID="Label1" runat="server" Text="Seleccione una fotos del Aula" Font-Bold="True"></asp:Label>--%>
                           <%--     <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />--%>
                    <asp:Button ID="btn_agregar" runat="server" CssClass ="form-control btn btn-primary mt-1 " Text="Grabar Datos"  />



                                </div>
            
                            <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                               Aulas
                            </div>
                                <asp:GridView ID="gv_aulas" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_aulas" Font-Size="11pt" DataKeyNames="id_nomal">
                                    <Columns>
                                        <asp:BoundField DataField="id_nomal" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_nomal" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Nombre del Ambiente" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad"  />
                                        <asp:BoundField DataField="dimenciones" HeaderText="Superficie" SortExpression="dimenciones" />
                                        <asp:BoundField DataField="nombre" HeaderText="Tipo de Ambiente" SortExpression="nombre" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_aulas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select id_nomal,nom_aula_lab ,capacidad ,dimenciones ,am.nombre   from tb_aula a
join tb_ambiente am on a.tipo_ambiente= am.id_ambiente 
where Sede =@sede  and bloque =@bloque and gestion='1-2024' order by am.nombre , nom_aula_lab " DeleteCommand="DELETE FROM tb_aula WHERE (id_nomal = @id_nomal)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id_nomal" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_idsde" Name="sede" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </div>
            </div>
         </div>
          <asp:TextBox ID="txt_idsde" runat="server" Visible="False"></asp:TextBox>
          <asp:GridView ID="gv_ultimo" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_ultimo" Visible="False">
              <Columns>
                  <asp:BoundField DataField="Expr1" HeaderText="Expr1" ReadOnly="True" SortExpression="Expr1" />
              </Columns>
          </asp:GridView>
          <asp:TextBox ID="txt_img_guarda" runat="server" Visible="False"></asp:TextBox>
          <asp:SqlDataSource ID="sql_ds_ultimo" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT ident_current('tb_aula') AS Expr1" InsertCommand="INSERT INTO tb_aula(nom_aula_lab, bloque, capacidad, Sede, ultima_actualizacion, foto, gestion, dimenciones, tipo_ambiente, capacidad_bs) VALUES (@nomaula, @bloque, @capacidad, @sede, GETDATE(), @foto, '1-2024', @dimencion, @amb, @cbs)">
              <InsertParameters>
                  <asp:ControlParameter ControlID="txt_nom_aula_lab" Name="nomaula" PropertyName="Text" />
                  <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                  <asp:ControlParameter ControlID="ddl_capacidad" Name="capacidad" PropertyName="SelectedValue" />
                  <asp:ControlParameter ControlID="txt_idsde" Name="sede" PropertyName="Text" />
                  <asp:ControlParameter ControlID="txt_img_guarda" Name="foto" PropertyName="Text" />
                  <asp:ControlParameter ControlID="txt_dimencion" Name="dimencion" PropertyName="Text" />
                  <asp:ControlParameter ControlID="ddl_ambiente" Name="amb" PropertyName="SelectedValue" />
                  <asp:ControlParameter ControlID="ddl_capbs" Name="cbs" PropertyName="SelectedValue" />
              </InsertParameters>
          </asp:SqlDataSource>
          </form>
</asp:Content>


