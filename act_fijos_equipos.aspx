<%@ Page Language="VB" AutoEventWireup="false" CodeFile="act_fijos_equipos.aspx.vb" Inherits="act_fijos_equipos" MasterPageFile="~/mp_activos.master" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <script>
        (function () {
            'use strict'

            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')

            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }

                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    </script>
    <form runat ="server" class ="" >
     <div class="content">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Formulario 1</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
           <%--   <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">General Form</li>--%>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-4">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Datos para el formulario 1</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
          
                <div class="card-body">
                     <div  class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Ingrese su nro de Ci</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_ci" CssClass="form-control small  "  runat="server" AutoPostBack="True"></asp:TextBox>
 <asp:Label ID="lbl_funcionario" CssClass="form-control mt-1 bg-gradient-green  " runat="server" Text=""></asp:Label>
                       
                    </div>
                  </div>
                      <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Ingrese su Cargo</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_cargo"   CssClass="form-control small  " runat="server"></asp:TextBox>
                   
                    </div>
                  </div>
                      <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Tipo de Bien</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_tipo_bien"   CssClass="form-control small  " runat="server"></asp:TextBox>
                       
                    </div>
                  </div>
                          <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Marca</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_marca"    CssClass="form-control small  " runat="server"></asp:TextBox>
                       
                    </div>
                  </div>
                       <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Modelo</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_modelo"   CssClass="form-control small  " runat="server"></asp:TextBox>
                      
                    </div>
                  </div>
                       <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Nro de Serie</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_nro_serie"   CssClass="form-control small  " runat="server"></asp:TextBox>
                       
                    </div>
                  </div>
                 <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">descripcion del Bien</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_desc_bien"   CssClass="form-control small  " runat="server"></asp:TextBox>
                       
                    </div>
                  </div>
                       <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Medidas</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_medidas"   CssClass="form-control small  " runat="server"></asp:TextBox>
                       
                    </div>
                  </div>
                       <div class="form-group row has ">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Accesorios</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_accesorios"   CssClass="form-control small  " runat="server"></asp:TextBox>
                       
                    </div>
                  </div>
                       <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Descripcion del Estado Fisico</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_est_fisico"   CssClass="form-control small  " runat="server"></asp:TextBox>
                       
                    </div>
                  </div>
                       <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Estado Funcional</label>
                    <div class="col-sm-8">
                        
                        <asp:DropDownList ID="ddl_estado_funcional" runat="server">
                            <asp:ListItem>Estado funcional del Bien</asp:ListItem>
                            <asp:ListItem>Malo</asp:ListItem>
                            <asp:ListItem>Regular</asp:ListItem>
                            <asp:ListItem>Bueno</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                  </div>
                       <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label" style="left: -1px; top: 0px">Seleccione una Foto</label>
                    <div class="col-sm-8">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                       
                    </div>
                  </div>
                       <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Sede</label>
                    <div class="col-sm-8">
                        <asp:DropDownList ID="ddl_sede" runat="server" AutoPostBack="True" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
                       
                        <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes] ORDER BY [NombreSede]"></asp:SqlDataSource>
                       
                    </div>
                  </div>
                       <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Bloque</label>
                    <div class="col-sm-8">
                        <asp:DropDownList ID="ddl_bloque" runat="server" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque"></asp:DropDownList>
                        <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques] WHERE ([id_sede] = @id_sede) ORDER BY [nom_bloque]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_sede" Name="id_sede" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                  </div>
   <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Oficina o departamento</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_of_dep"   CssClass="form-control small  " runat="server"></asp:TextBox>
                       
                    </div>
                  </div>
                    <asp:TextBox ID="txt_img_guarda" runat="server" Width="1045px"></asp:TextBox>




               
              
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <asp:Button ID="Button1" CssClass ="btn btn-primary form-control " runat="server" Text="Insertar Detalles al Sistema" />
                </div>
            </div>
            <!-- /.card -->

            <!-- general form elements -->
            
            <!-- /.card -->

            <!-- Input addon -->
            
            <!-- /.card -->
            <!-- Horizontal Form -->
            
            <!-- /.card -->

          </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-8">
            <!-- Form Element sizes -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Lista de Equipos /Muebles y Enceres</h3>
              </div>
              <div class="card-body">
                  <asp:GridView ID="gv_bien" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_bien" Font-Names="Consolas" Font-Size="9pt">
                      <Columns>
                          <asp:BoundField DataField="id_equipos" HeaderText="id_equipos" InsertVisible="False" ReadOnly="True" SortExpression="id_equipos" Visible ="false"  />
                          <asp:BoundField DataField="ci_funcionario" HeaderText="ci_funcionario" SortExpression="ci_funcionario" Visible ="false"  />
                          <asp:BoundField DataField="nombre_funcionario" HeaderText="nombre_funcionario" SortExpression="nombre_funcionario" Visible ="false"  />
                          <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
                          <asp:BoundField DataField="tipo_bien" HeaderText="Tipo de Bien" SortExpression="tipo_bien" />
                          <asp:BoundField DataField="marca" HeaderText="marca" SortExpression="marca" />
                          <asp:BoundField DataField="modelo" HeaderText="modelo" SortExpression="modelo" />
                          <asp:BoundField DataField="numero_serie" HeaderText="numero_serie" SortExpression="numero_serie" />
                          <asp:BoundField DataField="descripcion_del_bien" HeaderText="descripcion del Bien" SortExpression="descripcion_del_bien" />
                          <asp:BoundField DataField="medidas" HeaderText="Medidas" SortExpression="medidas" />
                          <asp:BoundField DataField="accesorios" HeaderText="Accesorios" SortExpression="accesorios" />
                          <asp:BoundField DataField="estado_fisico" HeaderText="Estado Fisico" SortExpression="estado_fisico" />
                          <asp:BoundField DataField="estado_funcional" HeaderText="Estado Funcional" SortExpression="estado_funcional" />
                          <asp:BoundField DataField="foto_bien" HeaderText="Foto" SortExpression="foto_bien" />
                          <asp:BoundField DataField="sede" HeaderText="Sede" SortExpression="sede" />
                          <asp:BoundField DataField="bloque" HeaderText="Bloque" SortExpression="bloque" />
                          <asp:BoundField DataField="oficina_departamento" HeaderText="Oficina o Departamento" SortExpression="oficina_departamento" />
                          <asp:BoundField DataField="fecha_registro" HeaderText="Fecha de Registro" SortExpression="fecha_registro" />
                      </Columns>
                  </asp:GridView>

                 






                  <asp:SqlDataSource ID="sql_ds_bien" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_inv_equipos(ci_funcionario, nombre_funcionario, cargo, tipo_bien, marca, modelo, numero_serie, descripcion_del_bien, medidas, accesorios, estado_fisico, estado_funcional, foto_bien, sede, bloque, oficina_departamento, fecha_registro) VALUES (@ci, @nombre, @cargo, @tipo_bien, @marca, @modelo, @nroserie, @descripcion, @medidas, @accesorios, @est_fisico, @est_funcional, @foto, @sede, @bloque, @ofdep, GETDATE())" SelectCommand="SELECT * FROM [tb_inv_equipos] where ci_funcionario=@ci">
                      <InsertParameters>
                          <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                          <asp:ControlParameter ControlID="lbl_funcionario" Name="nombre" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_cargo" Name="cargo" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_tipo_bien" Name="tipo_bien" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_marca" Name="marca" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_modelo" Name="modelo" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_nro_serie" Name="nroserie" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_desc_bien" Name="descripcion" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_medidas" Name="medidas" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_accesorios" Name="accesorios" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_est_fisico" Name="est_fisico" PropertyName="Text" />
                          <asp:ControlParameter ControlID="ddl_estado_funcional" Name="est_funcional" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="txt_img_guarda" Name="foto" PropertyName="Text" />
                          <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="txt_of_dep" Name="ofdep" PropertyName="Text" />
                      </InsertParameters>
                      <SelectParameters>
                          <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                      </SelectParameters>
                  </asp:SqlDataSource>

                 






              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            
            <!-- /.card -->

            <!-- general form elements disabled -->
            
            <!-- /.card -->
            <!-- general form elements disabled -->
            
            <!-- /.card -->
          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
        </form>
     
</asp:Content>

