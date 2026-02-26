<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_usuarios.aspx.vb" Inherits="RR_HH_usuarios" MasterPageFile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form  runat ="server" >
    <div class="">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-4">
            <h1>Creacion de Usuarios</h1>
          </div>
         
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-4">
            <!-- AREA CHART -->
            <div class="card card-purple">
              <div class="card-header">
                <h3 class="card-title">Datos de Usuarios</h3>

                <div class="card-tools">
                    
                </div>
              </div>
              <div class="card-body">
               <div class="chart">
                    
                  <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Sede :</label>
                      <div class="col-sm-8">
                         <asp:DropDownList ID="ddl_sede" CssClass ="dropdown-corporate " runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True"></asp:DropDownList>
                                </div>
                          </div>
               
                          <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Tipo de Usuario:</label>
                      <div class="col-sm-8">
                         
                         <asp:DropDownList ID="ddl_tipo_usuario" CssClass ="dropdown-corporate" runat="server" DataSourceID="sql_rol" DataTextField="rol" DataValueField="id_rol" AutoPostBack="True" AppendDataBoundItems="True">
                             <asp:ListItem Value="0">Seleccione un Rol</asp:ListItem>
                          </asp:DropDownList>
                                </div>
                          </div>
                  
                    
                                 
                                  </div>
              </div>
                        </div>
              <div class="card card-purple">
              <div class="card-header">
                <h3 class="card-title">Datos para la Creacion del Usuario</h3>

                <div class="card-tools">
                    
                </div>
              </div>
              <div class="card-body">
               <div class="chart">
                    
                  <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Personal :</label>
                     
                      <div class="col-sm-8">
                         
                           <asp:DropDownList ID="ddl_usuario" CssClass="form-control  btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_usuarios" DataTextField="personal" DataValueField="ci" AppendDataBoundItems="True" AutoPostBack="True" Font-Size="10pt">
                                    <asp:ListItem Value="0">Seleccione una Persona</asp:ListItem>
                                </asp:DropDownList>
                           <asp:HyperLink ID="hl_personal" runat="server" Font-Italic="True" Font-Names="Consolas" Font-Size="8pt" ForeColor="#3333CC" Font-Underline="True" NavigateUrl="~/RR_HH_agregar_personal.aspx">Agregar Nuevo Personal</asp:HyperLink>
                                <asp:SqlDataSource ID="sql_ds_usuarios" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT (nombres + ' ' + primerApellido + ' ' + segundoApellido) AS personal, ci 
FROM tb_personal
group by nombres ,primerApellido, segundoApellido,ci
 order by personal"></asp:SqlDataSource>
                                
                                 




                                </div>
                          </div>
                     <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Carrera:</label>
                      <div class="col-sm-8">
                        

                           <asp:DropDownList ID="ddl_carrera" CssClass ="form-control " runat="server" DataSourceID="sql_ds_carera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True"></asp:DropDownList>



                                </div>
                          </div>
                          <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Usuario :</label>
                      <div class="col-sm-8">
                         
                              <asp:TextBox ID="txt_usuario" CssClass="form-control mt-1 " runat="server"></asp:TextBox>
                             




                                </div>
                          </div>
                  
                      <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Password :</label>
                      <div class="col-sm-8"> 
                                  <asp:TextBox ID="txt_contraseña" CssClass="form-control mt-1 " runat="server"></asp:TextBox>                      
                         </div>
                      </div>
                        <div class="card-footer">
                        <asp:Button ID="btn_registrar" CssClass ="btn btn-primary btn-flat form-control  " runat="server" Text="Crear Usuario" />
                </div>
                                 
                                  </div>
              </div>
                        </div>
                    </div>
           
        
          <div class="col-md-8">
            
            <div class="card card-teal">
              <div class="card-header">
                <h3 class="card-title">Usuarios Asignados Vigentes</h3>
                 </div>
              <div class="card-body">
               
                  <asp:GridView ID="gv_asignaciones" CssClass ="grid-corporate" runat="server" DataSourceID="sql_ds_usuarios_asignados" AutoGenerateColumns="False" DataKeyNames="id_usuario,id_rol" Font-Names="Consolas" Font-Size="9pt" GridLines="None">
                      <Columns>
                          <asp:CommandField ShowDeleteButton="True" />
                          <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" InsertVisible="False" ReadOnly="True" SortExpression="id_usuario" Visible ="false"  />
                          <asp:BoundField DataField="Personal" HeaderText="Personal" ReadOnly="True" SortExpression="Personal" />
                          <asp:BoundField DataField="ci_usuario" HeaderText="Nro.C.I." SortExpression="ci_usuario" />
                          <asp:BoundField DataField="nombre_usuario" HeaderText="Usuario" SortExpression="nombre_usuario" />
                          <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                          <asp:BoundField DataField="NombreSede" HeaderText="Sede" SortExpression="NombreSede" />
                          <asp:BoundField DataField="rol" HeaderText="Rol" SortExpression="rol" />
                          <asp:BoundField DataField="nombre_carrera" HeaderText="Carrera" SortExpression="nombre_carrera" />
                          <asp:BoundField DataField="id_rol" HeaderText="id_rol" SortExpression="rol"  Visible ="false" />
                          <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" />
                          
                      </Columns>
                  </asp:GridView>

              </div>
          
            </div>
                    </div>
                </div>
      
      </div>
    </section>
    <asp:SqlDataSource ID="sql_ds_usuarios_asignados" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_usuarios(ci_usuario, nombre_usuario, password, rol, fecha_creacion, sigla_carrera, nombre_carrera, sede) VALUES (@ci, @usuario, @contraseña, @rol, GETDATE(), @siglacar, @nombrecar, @sede)" SelectCommand="select id_usuario ,(p.nombres +' '+p.primerApellido +' '+p.segundoApellido )as Personal,ci_usuario ,nombre_usuario ,u.password ,s.NombreSede ,r.rol,u.nombre_carrera ,r.id_rol  ,u.estado
from tb_usuarios u
join tb_personal p on u.ci_usuario = p.ci
join tb_sedes s on u.sede =s.idSede   
join tb_roles r on u.rol = r.id_rol 
where sede =@sede  and u.rol=@rol
group by id_usuario ,(p.nombres +' '+p.primerApellido +' '+p.segundoApellido ),ci_usuario ,nombre_usuario ,u.password ,s.NombreSede ,r.rol,u.nombre_carrera ,r.id_rol  ,u.estado
order by Personal " DeleteCommand="DELETE FROM tb_usuarios WHERE (id_usuario = @id_usuario) AND (rol = @id_rol)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="id_usuario" />
                                        <asp:Parameter Name="id_rol" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="ddl_usuario" Name="ci" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="txt_usuario" Name="usuario" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_contraseña" Name="contraseña" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_tipo_usuario" Name="rol" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="siglacar" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="txt_nomcar" Name="nombrecar" PropertyName="Text" />
                                        
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_tipo_usuario" Name="rol" PropertyName="SelectedValue" />

                                    </SelectParameters>
                                </asp:SqlDataSource>


        <asp:SqlDataSource ID="sql_ds_carera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
         <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                
                                 <asp:SqlDataSource ID="sql_rol" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT [id_rol], [rol], [fecha_creacion] FROM [tb_roles]"></asp:SqlDataSource>
                                






        <asp:TextBox ID="txt_nomcar" runat="server" Visible="False"></asp:TextBox>
                                






  </div>
        
   
        </form>
</asp:Content>


