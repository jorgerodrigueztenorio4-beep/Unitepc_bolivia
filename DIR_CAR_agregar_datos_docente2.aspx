<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_agregar_datos_docente2.aspx.vb" Inherits="DIR_CAR_agregar_datos_docente2" MasterPageFile="~/mp_dir_car2.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server" >
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Personales del Docente
                            </div>
   
                            <label for="exampleInputEmail1">Nombres</label>
                          
                            <asp:TextBox ID="txt_nombres" cssclass="form-control" required runat="server" placeholder="Ingrese los nombre(s) del Docente"></asp:TextBox>
          
                            <label for="exampleInputEmail1">Primer Apellidos</label>
                                                         <asp:TextBox ID="txt_papellidos" required class="form-control" placeholder="Ingrese el primer apellido del Docente"  runat="server"></asp:TextBox>
                                                <label for="exampleInputEmail1">Segundo Apellidos</label>
                                                          <asp:TextBox ID="txt_sapellido" required class="form-control" placeholder="Ingrese el Segundo apellido del Docente"  runat="server"></asp:TextBox>
             
                                    <label for="exampleInputEmail1">Nro. de C.I. del Docente</label>
                                                          <asp:TextBox ID="txt_nro_ci" required class="form-control" placeholder="Ingrese el Nro. de C.I. del Docente"  runat="server"></asp:TextBox>
                                                        <label>Seleccionar Extensión del C.I.</label>
    <asp:DropDownList ID="ddl_extencion" CssClass="form-control  btn btn-default dropdown-toggle mt-0" runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_extencion" DataTextField="Lugar" DataValueField="abreviado">
        <asp:ListItem Value="0">Seleccione la Extencion del C.I.</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_extencion" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_expedido]"></asp:SqlDataSource>
                   <div>
                                          <%--  <label >Genero</label>
                        <asp:DropDownList ID="ddl_genero" CssClass="form-control  btn btn-default dropdown-toggle mt-0" runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_sexo" DataTextField="sexo" DataValueField="id_sexo">
                            <asp:ListItem Value="0">Seleccione el Genero del Docente</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="sql_ds_sexo" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sexo]"></asp:SqlDataSource>
                    </div>
                                        <label >Nacionalidad</label> <br>
    <asp:DropDownList ID="ddl_nacionalidad" CssClass="form-control  btn btn-default dropdown-toggle mt-0" runat="server">
        <asp:ListItem>Seleccione la Nacionalidad</asp:ListItem>
        <asp:ListItem>Boliviano</asp:ListItem>
        <asp:ListItem>Extranjero</asp:ListItem>
                                </asp:DropDownList>
                          <label>Fecha de Nacimiento:</label>
                            <div class="input-group date" id="reservationdate" data-target-input="nearest">
                                                              <asp:TextBox ID="txt_fecha_nac" type="date"   class="form-control datetimepicker-input" runat="server"></asp:TextBox>                        
                            </div>
                                           <label>Estado civil</label>
    <asp:DropDownList ID="ddl_estado_civil" CssClass="form-control  btn btn-default dropdown-toggle mt-1" runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_estado_civil" DataTextField="est_civil" DataValueField="id_est">
        <asp:ListItem Value="0">Seleccione el estado Civil del Docente</asp:ListItem>
                                </asp:DropDownList>
                                              <asp:SqlDataSource ID="sql_ds_estado_civil" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_est_civil]"></asp:SqlDataSource>
                                              <label for="exampleInputEmail1">Dirección</label>
                                                          <asp:TextBox ID="txt_direccion" class="form-control" placeholder="Direccion del Docente"  runat="server"></asp:TextBox>
                                           <label for="exampleInputEmail1">Teléfono</label>
                                                              <asp:TextBox type="number" ID="txt_telefono" class="form-control" placeholder="Ingrese el nro. de Telefono del Docente"  runat="server"></asp:TextBox>--%>
                                                <label for="exampleInputEmail1">Celular</label>
                                                            <asp:TextBox type="number" ID="txt_celular" class="form-control" placeholder="Ingrese el nro. de Celular del Docente"  runat="server"></asp:TextBox>
                                    <label for="exampleInputEmail1">Email</label>
                                                            <asp:TextBox type="mail" required ID="txtemail" class="form-control" placeholder="Ingrese el E-mail del Docente"  runat="server"></asp:TextBox>
                                          <asp:Button ID="Button1" runat="server" CssClass="form-control btn btn-primary  mt-1" Text="Agregar Datos" />  
                 
                           <asp:Label ID="lbl_existe" role="alert" CssClass=" form-control  alert alert-danger mt-1 text-md-center" runat="server" Text="Este Nro. de C.I. ya esta Registrado en el Sistema" Visible ="false" ></asp:Label>
                      
                       <asp:GridView ID="gv_personal" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_docnete" Font-Size="10pt">
                           <Columns>
                               <asp:BoundField DataField="id" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id" />
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
                                <asp:SqlDataSource ID="sql_ds_docnete" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_personal(nombres, primerApellido, segundoApellido, email, ci, extension, celular, fecha_registro, fecha_actualizacion, gestion) VALUES (@nombres, @app, @apm, @email, @ci, @extci, @cel, GETDATE(), GETDATE(), '2-2022')" SelectCommand="SELECT * FROM [tb_personal] where ci=@ci">
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="txt_nombres" Name="nombres" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_papellidos" Name="app" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_sapellido" Name="apm" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txtemail" Name="email" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_nro_ci" Name="ci" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_extencion" Name="extci" PropertyName="SelectedValue" />
                                        <asp:ControlParameter Name="cel" ControlID="txt_celular" PropertyName="Text" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_nro_ci" Name="ci" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                          <asp:SqlDataSource ID="sql_ds_ingreso" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_usuarios(ci_usuario, nombre_usuario, password, rol, fecha_creacion, sede) VALUES (@ci, @usuario, @contraseña, '1', GETDATE(), @sede)" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>">
                                              <InsertParameters>
                                                  <asp:ControlParameter ControlID="txt_nro_ci" Name="ci" PropertyName="Text" />
                                                  <asp:ControlParameter ControlID="txt_nro_ci" Name="usuario" PropertyName="Text" />
                                                  <asp:ControlParameter ControlID="txt_nro_ci" Name="contraseña" PropertyName="Text" />
                                                  <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                                              </InsertParameters>
                                          </asp:SqlDataSource>
                                          <asp:TextBox ID="txt_sede" runat="server" Visible="False"></asp:TextBox>
                                 </div>
           
            </div>

         </div>  

    </form>
</asp:Content>

     
             


