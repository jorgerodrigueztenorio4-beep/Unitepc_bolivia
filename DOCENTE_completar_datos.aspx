<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DOCENTE_completar_datos.aspx.vb" Inherits="DOCENTE_completar_datos" MasterPageFile="~/mp_docentes.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Personales del Docente
                            </div>
                                  <asp:Label ID="lbl_existe" role="alert" CssClass=" form-control  alert alert-warning mt-1 text-md-center" runat="server" Text="Los Datos del Docente ya estan Registrados en el Sistema Si requiere modificar algun dato Solicite a su dir de carrera " Visible ="false" ></asp:Label>
                                <asp:TextBox ID="txt_ci" runat="server" Visible="False"></asp:TextBox>
                                <asp:GridView ID="gv_datos" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_datos" DataKeyNames="ci" Visible="False">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                        <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                                        <asp:BoundField DataField="primerApellido" HeaderText="primerApellido" SortExpression="primerApellido" />
                                        <asp:BoundField DataField="segundoApellido" HeaderText="segundoApellido" SortExpression="segundoApellido" />
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                        <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" />
                                        <asp:BoundField DataField="extension" HeaderText="extension" SortExpression="extension" />
                                        <asp:TemplateField HeaderText="fechaNacimiento" SortExpression="fechaNacimiento">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" Type="date" runat="server" Text='<%# Bind("fechaNacimiento") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("fechaNacimiento") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="estadoCivil" HeaderText="estadoCivil" SortExpression="estadoCivil" />
                                        <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" />
                                        <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                                        <asp:BoundField DataField="celular" HeaderText="celular" SortExpression="celular" />
                                        <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero" />
                                        <asp:BoundField DataField="nacionalidad" HeaderText="nacionalidad" SortExpression="nacionalidad" />
                                        <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" />
                                    </Columns>
                                </asp:GridView>

                                  
                          
                            <asp:TextBox ID="txt_nombres" cssclass="form-control mt-1 " runat="server" placeholder="Ingrese los nombre(s) del Docente"></asp:TextBox>
          
                           
                                                         <asp:TextBox ID="txt_papellidos" class="form-control mt-1 " placeholder="Ingrese el primer apellido del Docente"  runat="server"></asp:TextBox>
                                               
                                                          <asp:TextBox ID="txt_sapellido" class="form-control mt-1 " placeholder="Ingrese el Segundo apellido del Docente"  runat="server"></asp:TextBox>
             
                                  
                                                          <asp:TextBox ID="txt_nro_ci" class="form-control mt-1 " placeholder="Ingrese el Nro. de C.I. del Docente"  runat="server"></asp:TextBox>
                                                      
    <asp:DropDownList ID="ddl_extencion" CssClass="form-control  btn btn-default dropdown-toggle mt-1" runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_extencion" DataTextField="Lugar" DataValueField="abreviado">
        <asp:ListItem Value="0">Seleccione la Extencion del C.I.</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_extencion" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_expedido]"></asp:SqlDataSource>
                   <div>
                                         
                        <asp:DropDownList ID="ddl_genero" CssClass="form-control  btn btn-default dropdown-toggle mt-1" runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_sexo" DataTextField="sexo" DataValueField="id_sexo">
                            <asp:ListItem Value="0">Seleccione el Genero del Docente</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="sql_ds_sexo" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sexo]"></asp:SqlDataSource>
                    </div>
                                       
    <asp:DropDownList ID="ddl_nacionalidad" CssClass="form-control  btn btn-default dropdown-toggle mt-1" runat="server">
        <asp:ListItem>Seleccione la Nacionalidad</asp:ListItem>
        <asp:ListItem>Boliviano</asp:ListItem>
        <asp:ListItem>Extranjero</asp:ListItem>
                                </asp:DropDownList>
                         
                            <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                                              <asp:TextBox ID="txt_fecha_nac" type="date"   class="form-control datetimepicker-input mt-1" runat="server"></asp:TextBox>                        
                            </div>
                                          
    <asp:DropDownList ID="ddl_estado_civil" CssClass="form-control  btn btn-default dropdown-toggle mt-1" runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_estado_civil" DataTextField="est_civil" DataValueField="id_est">
        <asp:ListItem Value="0">Seleccione el estado Civil del Docente</asp:ListItem>
                                </asp:DropDownList>
                                              <asp:SqlDataSource ID="sql_ds_estado_civil" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_est_civil]"></asp:SqlDataSource>
                                             
                                                          <asp:TextBox ID="txt_direccion" class="form-control mt-1 " placeholder="Direccion del Docente"  runat="server"></asp:TextBox>
                                          
                                                              <asp:TextBox type="number" ID="txt_telefono" class="form-control mt-1 " placeholder="Ingrese el nro. de Telefono del Docente"  runat="server"></asp:TextBox>
                                               
                                                            <asp:TextBox type="number" ID="txt_celular" class="form-control mt-1 " placeholder="Ingrese el nro. de Celular del Docente"  runat="server"></asp:TextBox>
                                   
                                                            <asp:TextBox type="" ID="txtemail" class="form-control mt-1 " placeholder="Ingrese el E-mail del Docente"  runat="server"></asp:TextBox>
                                     

                                <asp:SqlDataSource ID="sql_ds_datos" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_personal] WHERE ([ci] = @ci)  and fechaNacimiento is null and estadoCivil is null" UpdateCommand="UPDATE tb_personal SET nombres = @nombre, primerApellido = @pap, segundoApellido = @sap, email = @email, ci = @ci, extension = @extencion, fechaNacimiento = @fechanac, estadoCivil = @estciv, direccion = @dir, telefono = @telf, celular = @cel, genero = @genero, nacionalidad = @nacional, fecha_actualizacion = GETDATE(), gestion = '2-2022' WHERE (ci = @ci)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="txt_nro_ci" Name="ci" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_nombres" Name="nombre" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_papellidos" Name="pap" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_sapellido" Name="sap" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txtemail" Name="email" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_extencion" Name="extencion" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="txt_fecha_nac" Name="fechanac" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="ddl_estado_civil" Name="estciv" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="txt_direccion" Name="dir" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_telefono" Name="telf" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_celular" Name="cel" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_genero" Name="genero" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_nacionalidad" Name="nacional" PropertyName="SelectedValue" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:Button ID="Button1" CssClass="btn-primary form-control mt-1 " runat="server" Text="Registrar Datos" />
                                </div>
            </div>
         </div>
   </form>
</asp:Content>


