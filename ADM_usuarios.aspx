<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_usuarios.aspx.vb" Inherits="ADM_usuarios" MasterPageFile="~/mp2.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    
     <form runat ="server">
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
<div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Designar Usuario y Roles
                            </div>
    	<div class="row">
                
                            <div class="col-md-6 p-3 mb-2 bg-white text-white border   ">
                              <div style="background-color:#FFFACD" class="text-md-center   text-bold " role="alert">
                                Seleccione un Usuario y un Rol
                            </div>
                                <asp:DropDownList ID="ddl_usuario" CssClass="form-control  btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_usuarios" DataTextField="personal" DataValueField="ci" AppendDataBoundItems="True" AutoPostBack="True">
                                    <asp:ListItem Value="0">Seleccione una Persona</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_usuarios" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT (nombres + ' ' + primerApellido + ' ' + segundoApellido+'---------'+ci) AS personal, ci FROM tb_personal order by personal"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_rol" CssClass="form-control  btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_rol" DataTextField="rol" DataValueField="id_rol" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione un Rol</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control  btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddl_carrera" CssClass="form-control  btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_carera" DataTextField="CARDES" DataValueField="CARSIGLA" AppendDataBoundItems="True" AutoPostBack="True">
                                    <asp:ListItem>Seleccione una Carrera</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_carera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                <asp:TextBox ID="txt_nomcar" runat="server" Visible="False"></asp:TextBox>
                                 <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                
                                 <asp:SqlDataSource ID="sql_rol" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_roles]"></asp:SqlDataSource>
                                <asp:Label ID="Label1" runat="server" Text="Usuario"></asp:Label>
                                <asp:TextBox ID="txt_usuario" CssClass="form-control mt-1 " runat="server"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" Text="Contraseña"></asp:Label>
                                <asp:TextBox ID="txt_contraseña" CssClass="form-control mt-1 " runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary mt-1 form-control " Text="Registrar Usuario y Contraseña" />


                                <asp:SqlDataSource ID="sql_ds_usuario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_usuarios(ci_usuario, nombre_usuario, password, rol, fecha_creacion, sigla_carrera, nombre_carrera, sede) VALUES (@ci, @usuario, @contraseña, @rol, GETDATE(), @siglacar, @nombrecar, @sede)" SelectCommand="SELECT * FROM [tb_usuarios]">
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="ddl_usuario" Name="ci" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="txt_usuario" Name="usuario" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_contraseña" Name="contraseña" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_rol" Name="rol" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="siglacar" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="txt_nomcar" Name="nombrecar" PropertyName="Text" />
                                        
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </InsertParameters>
                                </asp:SqlDataSource>

                                 </div>
               <div class="col-md-6 p-3 mb-2 bg-white text-white border   ">
                              <div style="background-color:#FFFACD" class="text-md-center   text-bold " role="alert">
                                Seleccione un Usuario y un Rol
                            </div>
                                </div>
            </div>
         </div>
        </form>
</asp:Content>


