<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_lista_docentes.aspx.vb" Inherits="DIR_CAR_lista_docentes" MasterPageFile="~/mp_dir_car.master" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server">
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-5 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Buscar al Docente por Nombre,Apellidos,C.I.
                            </div>
                                <asp:TextBox ID="txt_buscar" CssClass ="form-control m-1" placeholder="Ingrese Nombre o C.I." runat="server" AutoPostBack="True"></asp:TextBox>
                                <asp:GridView ID="gv_busqueda" CssClass ="table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_busqueda" Font-Size="9pt">
                                    <Columns>
                                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" ControlStyle-CssClass="btn btn-primary mt-1 " >
<ControlStyle CssClass="btn btn-primary mt-1 " Font-Size="9pt"></ControlStyle>
                                        </asp:CommandField>
                                        <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                                        <asp:BoundField DataField="primerApellido" HeaderText="primerApellido" SortExpression="primerApellido" />
                                        <asp:BoundField DataField="segundoApellido" HeaderText="segundoApellido" SortExpression="segundoApellido" />
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                        <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" BorderColor="#C3E6CB" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:TextBox ID="txt_comparar" runat="server" Visible="False"></asp:TextBox>
                                <asp:SqlDataSource ID="sql_ds_busqueda" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT nombres, primerApellido, segundoApellido, email, ci FROM tb_personal WHERE (nombres LIKE '%' + @nombres + '%') OR (primerApellido LIKE '%' + @primerApellido + '%') OR (segundoApellido LIKE '%' + @segundoApellido + '%') OR (ci LIKE '%' + @ci + '%')">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_buscar" Name="nombres" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="txt_buscar" Name="primerApellido" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="txt_buscar" Name="segundoApellido" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="txt_buscar" Name="ci" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_ci" runat="server" Visible="False"></asp:TextBox>
                                </div>
                <div class="col-md-7 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Personales del Docente
                            </div>
                     <asp:Label ID="lbl_notificacion" role="alert" CssClass=" form-control  alert alert-danger mt-1 text-md-center" runat="server" Text="Al Docente Seleccionado le falta Completar sus Datos en el Sistema" Visible ="false" ></asp:Label>
                    <asp:GridView ID="gv_seleccionado" CssClass="table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_docente_selec" Font-Size="9pt">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="nombres" HeaderText="Nombres" SortExpression="nombres" />
                            <asp:BoundField DataField="primerApellido" HeaderText="Primer Apellido" SortExpression="primerApellido" />
                            <asp:BoundField DataField="segundoApellido" HeaderText="Segundo Apellido" SortExpression="segundoApellido" />
                            <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                            <asp:BoundField DataField="ci" HeaderText="C.I." SortExpression="ci" />
                            <asp:BoundField DataField="extension" HeaderText="Extension" SortExpression="extension" />
                            <asp:BoundField DataField="fechaNacimiento" HeaderText="Fecha de Nacimiento" SortExpression="fechaNacimiento" />
                            <asp:BoundField DataField="estadoCivil" HeaderText="Estado Civil" SortExpression="estadoCivil" />
                            <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion" />
                            <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
                            <asp:BoundField DataField="celular" HeaderText="Celular" SortExpression="celular" />
                            <asp:BoundField DataField="genero" HeaderText="Genero" SortExpression="genero" />
                            <asp:BoundField DataField="nacionalidad" HeaderText="Nacionalidad" SortExpression="nacionalidad" />
                        </Columns>
                              <HeaderStyle BackColor="#D4EDDA" BorderColor="#C3E6CB" ForeColor="#155724" />
                              </asp:GridView>

                    <div class="alert mt-1  " style="background-color:#d1ecf1"  role="alert">
  Revisar el Correo electronico del Docente ya que a ese correo se enviaran sus accesos.
</div>

                              <asp:SqlDataSource ID="sql_ds_docente_selec" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id, nombres, primerApellido, segundoApellido, email, ci, extension, fechaNacimiento, estadoCivil, direccion, telefono, celular, genero, nacionalidad FROM tb_personal WHERE (ci = @ci)">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                    </div>
            </div>
         </div>
    </form>
</asp:Content>

