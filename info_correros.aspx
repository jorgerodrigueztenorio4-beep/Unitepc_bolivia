<%@ Page Language="VB" AutoEventWireup="false" CodeFile="info_correros.aspx.vb" Inherits="info_correros" MasterPageFile="mp1.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    

    <div class=" container-fluid ">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Informacion</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Cerrar Sesion</a></li>
                         </ol>
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
                <h3 class="card-title">Datos</h3>

                <div class="card-tools">
                    
                </div>
              </div>
              <div class="card-body">
               <div class="chart">
                       <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Sede</label>
                      <div class="col-sm-8">
                          <asp:DropDownList ID="ddl_sede" CssClass ="custom-select form-control-border" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True"></asp:DropDownList>
                          <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>"></asp:SqlDataSource>
                         </div>
                          </div>
                  <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Nro de C.I</label>
                      <div class="col-sm-8">
                    <asp:TextBox ID="txt_ci" required placeholder="Ingrese el Número de C.I." CssClass ="form-control " runat="server" AutoPostBack="True"></asp:TextBox>
                         </div>
                          </div>
                      <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Extencion del C.I.</label>
                      <div class="col-sm-8">
                          <asp:DropDownList ID="ddl_ext"  CssClass ="custom-select form-control-border"  runat="server" DataSourceID="sql_ds_extencion" DataTextField="Lugar" DataValueField="abreviado"></asp:DropDownList>
                          <asp:SqlDataSource ID="sql_ds_extencion" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_expedido]"></asp:SqlDataSource>
                         </div>
                          </div>
                     <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">E-mail</label>
                      <div class="col-sm-8">
                    <asp:TextBox ID="txt_correo" required placeholder="Ingrese su Correo Personal o Corpotarivo" CssClass ="form-control " runat="server"></asp:TextBox>
                         </div>
                          </div>
                    <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Telf. o Cel. Personal</label>
                      <div class="col-sm-8">
                    <asp:TextBox ID="txt_celper" placeholder="Ingrese su Nro de Telf./Cel. Personal" CssClass ="form-control " runat="server"></asp:TextBox>
                         </div>
                          </div>
                     <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Telf. o Cel. Corporativo</label>
                      <div class="col-sm-8">
                    <asp:TextBox ID="txt_celcorp"  placeholder="Ingrese su Nro de Telf./Cel. Corporativo" CssClass ="form-control " runat="server"></asp:TextBox>
                         </div>
                          </div>
                    <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Cargo</label>
                      <div class="col-sm-8">
                    <asp:TextBox ID="txt_cargo" required placeholder="Cargo Actual" CssClass ="form-control " runat="server"></asp:TextBox>
                         </div>
                          </div>




                  
                    
             
                    <div class="card-footer">
                        <asp:Button ID="btn_registrar" CssClass ="btn btn-primary btn-flat form-control  " runat="server" Text="Registrar Informacion" />
                </div>

               </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- DONUT CHART -->
            
            <!-- /.card -->

            <!-- PIE CHART -->
            
            <!-- /.card -->

          </div>
          <!-- /.col (LEFT) -->
          <div class="col-md-8">
            <!-- LINE CHART -->
            <div class="card card-teal">
              <div class="card-header">
                <h3 class="card-title">Datos Registrados</h3>

            
              </div>
              <div class="card-body">
                  <asp:GridView ID="gv_info" runat="server" CssClass ="table table-hover " AutoGenerateColumns="False" DataSourceID="sql_ds_infos" Font-Names="Consolas" Font-Size="10pt" GridLines="None" DataKeyNames="id_info">
                      <Columns>
                          <asp:CommandField ShowEditButton="True" />
                          <asp:BoundField DataField="id_info" HeaderText="id_info" SortExpression="id_info" Visible ="false"  />
                          <asp:BoundField DataField="NombreSede" HeaderText="Sede" SortExpression="NombreSede" ReadOnly="True" />
                          <asp:BoundField DataField="nombres" HeaderText="Nombre Completo" SortExpression="nombres" />
                          <asp:BoundField DataField="nro_ci" HeaderText="C.I." SortExpression="nro_ci"  ReadOnly="True"/>
                          <asp:BoundField DataField="extencion" HeaderText="Extencion" SortExpression="extencion"  ReadOnly="True"/>
                          <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                          
                          <asp:BoundField DataField="cel_per" HeaderText="Nro. Personal" SortExpression="cel_per"  ReadOnly="True"/>
                          <asp:BoundField DataField="cel_corp" HeaderText="Nro. Corporativo" SortExpression="cel_corp"  ReadOnly="True"/>
                          <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo"  ReadOnly="True"/>
                      </Columns>
                  </asp:GridView>
                  <asp:SqlDataSource ID="sql_ds_infos" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_info_correo(sede, nro_ci, extencion, cel_per, cel_corp, email, cargo) VALUES (@sede, @ci, @extencion, @celper, @celcorp, @email, @cargo)" SelectCommand="SELECT c.id_info,s.NombreSede, c.nro_ci, c.email, c.extencion, c.cel_per, c.cel_corp, c.cargo,c.nombres FROM tb_info_correo AS c INNER JOIN tb_sedes AS s ON c.sede = s.idSede WHERE (c.nro_ci = @ci)" UpdateCommand="UPDATE tb_info_correo SET email = @email, nombres = @nombres WHERE (id_info = @id_info)">
                      <InsertParameters>
                          <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="txt_ci"  Name="ci" PropertyName="Text" />
                          <asp:ControlParameter ControlID="ddl_ext" Name="extencion" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="txt_celper" Name="celper" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_celcorp" Name="celcorp" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_correo" Name="email" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_cargo" Name="cargo" PropertyName="Text" />
                      </InsertParameters>
                      <SelectParameters>
                          <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                      </SelectParameters>
                      <UpdateParameters>
                          <asp:Parameter Name="email" />
                          <asp:Parameter Name="nombres" />
                          <asp:Parameter Name="id_info" />
                      </UpdateParameters>
                  </asp:SqlDataSource>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- BAR CHART -->
            
            <!-- /.card -->

            <!-- STACKED BAR CHART -->
            
            <!-- /.card -->

          </div>
          <!-- /.col (RIGHT) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
       
</asp:Content>


