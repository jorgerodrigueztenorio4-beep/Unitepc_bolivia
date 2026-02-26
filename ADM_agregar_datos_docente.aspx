<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_agregar_datos_docente.aspx.vb" Inherits="ADM_agregar_datos_docente" MasterPageFile="~/mp2.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server" >
     
     <%--<div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Personales del Docente
                            </div>
   
                            <label for="exampleInputEmail1">Nombres</label>
                          
                            <asp:TextBox ID="txt_nombres" cssclass="form-control" runat="server" placeholder="Ingrese los nombre(s) del Docente"></asp:TextBox>
          
                            <label for="exampleInputEmail1">Primer Apellidos</label>
                                                         <asp:TextBox ID="txt_papellidos" class="form-control" placeholder="Ingrese el primer apellido del Docente"  runat="server"></asp:TextBox>
                                                <label for="exampleInputEmail1">Segundo Apellidos</label>
                                                          <asp:TextBox ID="txt_sapellido" class="form-control" placeholder="Ingrese el Segundo apellido del Docente"  runat="server"></asp:TextBox>
             
                                    <label for="exampleInputEmail1">Nro. de C.I. del Docente</label>
                                                          <asp:TextBox ID="txt_nro_ci" class="form-control" placeholder="Ingrese el Nro. de C.I. del Docente"  runat="server"></asp:TextBox>
                                                        <label>Seleccionar Extensión del C.I.</label>
    <asp:DropDownList ID="ddl_extencion" CssClass="form-control  btn btn-default dropdown-toggle mt-0" runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_extencion" DataTextField="Lugar" DataValueField="abreviado">
        <asp:ListItem Value="0">Seleccione la Extencion del C.I.</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_extencion" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_expedido]"></asp:SqlDataSource>
                   <div>
                                            <label >Genero</label>
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
                                                              <asp:TextBox type="number" ID="txt_telefono" class="form-control" placeholder="Ingrese el nro. de Telefono del Docente"  runat="server"></asp:TextBox>
                                                <label for="exampleInputEmail1">Celular</label>
                                                            <asp:TextBox type="number" ID="txt_celular" class="form-control" placeholder="Ingrese el nro. de Celular del Docente"  runat="server"></asp:TextBox>
                                    <label for="exampleInputEmail1">Email</label>
                                                            <asp:TextBox type="" ID="txtemail" class="form-control" placeholder="Ingrese el E-mail del Docente"  runat="server"></asp:TextBox>
                                          <asp:Button ID="Button1" runat="server" CssClass="form-control btn btn-primary  mt-1" Text="Agregar Datos" />   
                                <asp:SqlDataSource ID="sql_ds_docnete" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_personal(nombres, primerApellido, segundoApellido, email, ci, extension, fechaNacimiento, estadoCivil, direccion, telefono, celular, genero, nacionalidad) VALUES (@nombres, @app, @apm, @email, @ci, @extci, @fn , @ec, @direcion, @telefono, @cel, @genro, @nacionali)" SelectCommand="SELECT * FROM [tb_personal]">
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="txt_nombres" Name="nombres" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_papellidos" Name="app" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_sapellido" Name="apm" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txtemail" Name="email" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_nro_ci" Name="ci" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_extencion" Name="extci" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="txt_fecha_nac" Name="fn" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="ddl_estado_civil" Name="ec" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="txt_direccion" Name="direcion" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_telefono" Name="telefono" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_celular" Name="cel" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_genero" Name="genro" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_nacionalidad" Name="nacionali" PropertyName="SelectedValue" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                                 </div>
           
            </div>

         </div>--%>  
        <div class="col-md-8">
            
            <div class="card card-teal">
              <div class="card-header">
                <h3 class="card-title">Usuarios Asignados Vigentes</h3>
                 </div>
              <div class="card-body">
               
                




                  dfgdfdg






              </div>
          
            </div>
                    </div>

    </form>
</asp:Content>

     
             


