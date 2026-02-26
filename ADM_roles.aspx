<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_roles.aspx.vb" Inherits="ADM_roles" MasterPageFile="~/mp2.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server" >
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
<div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Roles del Sistema
                            </div>
    	<div class="row">
                
                            <div class="col-md-6 p-3 mb-2 bg-white text-white border   ">
                              <div style="background-color:#FFFACD" class="text-md-center   text-bold " role="alert">
                                Ingrese un Rol
                            </div>
                                <asp:TextBox ID="txt_rol" placeholder="Ingrese nombre del Rol" CssClass=" form-control mt-1" runat="server"></asp:TextBox>
                                <asp:Button ID="btn_agregar" CssClass=" form-control btn btn-primary mt-1" runat="server" Text="Agregar Rol" />
                                </div>
                  <div class="col-md-6 p-3 mb-2 bg-white text-white border   ">
                              <div style="background-color:#FFFACD" class="text-md-center   text-bold " role="alert">
                               Lista de Roles
                            </div>
                      <asp:GridView ID="gv_roles" runat="server" CssClass ="table table-hover mt-1" AutoGenerateColumns="False" DataSourceID="sql_roles">
                          <Columns>
                              <asp:BoundField DataField="id_rol" HeaderText="id_rol" InsertVisible="False" ReadOnly="True" SortExpression="id_rol" />
                              <asp:BoundField DataField="rol" HeaderText="rol" SortExpression="rol" />
                              <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion" />
                          </Columns>
                              </asp:GridView>

                                <asp:SqlDataSource ID="sql_roles" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_roles(rol, fecha_creacion) VALUES (@nombrerol, GETDATE())" SelectCommand="SELECT * FROM [tb_roles]">
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="txt_rol" Name="nombrerol" PropertyName="Text" />
                                    </InsertParameters>
                              </asp:SqlDataSource>

                                </div>
            </div>
         </div>
         </form>
</asp:Content>


