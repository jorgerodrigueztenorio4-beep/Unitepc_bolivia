<%@ Page Language="VB" AutoEventWireup="false" CodeFile="info_maquinas.aspx.vb" Inherits="info_maquinas" MasterPageFile="mp1.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <div class="content-fluid">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Informacion de Documentos</h1>
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
          <div class="col-md-6">
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
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Campus</label>
                      <div class="col-sm-8">
                          <asp:DropDownList ID="ddl_campus" CssClass ="custom-select form-control-border" runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_campus" DataTextField="nom_bloque" DataValueField="nom_bloque" AutoPostBack="True">
                              <asp:ListItem Value="0">Campus</asp:ListItem>
                          </asp:DropDownList>
                          <asp:SqlDataSource ID="sql_ds_campus" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques]"></asp:SqlDataSource>
                         </div>
                          </div>



                  <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Departamento</label>
                      <div class="col-sm-8">
                    <asp:TextBox ID="txt_dep" placeholder="departamento" CssClass ="form-control " runat="server"></asp:TextBox>
                         </div>
                          </div>
                      <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Funcionario</label>
                          <div class="col-sm-8">
                    <asp:TextBox ID="txt_funcionario" placeholder="funcionario" CssClass ="form-control " runat="server"></asp:TextBox>
                  </div>
                          </div>
                    <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Tipo de Maquina</label>
                      <div class="col-sm-8">
                          <asp:DropDownList ID="ddl_tipo_maq" CssClass ="custom-select form-control-border" runat="server" AppendDataBoundItems="True">
                              <asp:ListItem Value="0">Seleccione un Tipo de Maquina</asp:ListItem>
                              <asp:ListItem>Laptop</asp:ListItem>
                              <asp:ListItem>Pc Escritorio</asp:ListItem>
                              <asp:ListItem>No tiene</asp:ListItem>
                          </asp:DropDownList>
                         </div>
                          </div>
                      <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Estado</label>
                      <div class="col-sm-8">
                          <asp:DropDownList ID="ddl_est" CssClass ="custom-select form-control-border" runat="server">
                              <asp:ListItem>Estado</asp:ListItem>
                              <asp:ListItem>Bueno</asp:ListItem>
                              <asp:ListItem>Malo</asp:ListItem>
                          </asp:DropDownList>
                         </div>
                          </div>
                       <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Funcionalidad</label>
                      <div class="col-sm-8">
                          <asp:DropDownList ID="ddl_funcionalidad" CssClass ="custom-select form-control-border" runat="server">
                              <asp:ListItem Value="0">Funcionalidad</asp:ListItem>
                              <asp:ListItem>Malo</asp:ListItem>
                              <asp:ListItem>Medio</asp:ListItem>
                              <asp:ListItem>Bueno</asp:ListItem>
                              <asp:ListItem>Excelente</asp:ListItem>
                          </asp:DropDownList>
                         </div>
                          </div>
                  
                   
                      <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">observaciones</label>
                          <div class="col-sm-8">
                    <asp:TextBox ID="txt_obs" placeholder="Observaciones" CssClass ="form-control " runat="server"></asp:TextBox>
                  </div>
                          </div>
                       <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">La maquina pertenece a la u</label>
                      <div class="col-sm-8">
                          <asp:DropDownList ID="ddl_maquina_u" CssClass ="custom-select form-control-border" runat="server">
                              <asp:ListItem Value="0">La Maquina es de la u</asp:ListItem>
                              <asp:ListItem>Si</asp:ListItem>
                              <asp:ListItem>No</asp:ListItem>
                          </asp:DropDownList>
                         </div>
                          </div>

                  

                  
                    <div class="card-footer">
                        <asp:Button ID="btn_registrar" CssClass ="btn btn-primary btn-flat form-control  " runat="server" Text="Registrar Datos" />
                </div>

               </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- DONUT CHART -->
 

            <!-- PIE CHART -->
           
            <!-- /.card -->

          </div>
          <!-- /.col (LEFT) -->
          <div class="col-md-6">
            <!-- LINE CHART -->
            <div class="card card-teal">
              <div class="card-header">
                <h3 class="card-title">Nomina de Maquinas</h3>

              <%--  <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>--%>
              </div>
              <div class="card-body">
                  <asp:GridView ID="gv_maquinas" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_maquinas" Font-Names="Consolas" Font-Size="9pt" DataKeyNames="id_m">
                      <Columns>
                          <asp:CommandField ShowDeleteButton="True" />
                          <asp:BoundField DataField="id_m" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_m" />
                          <asp:BoundField DataField="departamento" HeaderText="departamento" SortExpression="departamento" />
                          <asp:BoundField DataField="funcionario" HeaderText="funcionario" SortExpression="funcionario" />
                          <asp:BoundField DataField="tipo_maquina" HeaderText="tipo de maquina" SortExpression="tipo_maquina" />
                          <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" />
                          <asp:BoundField DataField="funcionalidad" HeaderText="funcionalidad" SortExpression="funcionalidad" />
                          <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" />
                          <asp:BoundField DataField="campus" HeaderText="campus" SortExpression="campus" />
                          <asp:BoundField DataField="maquina_u" HeaderText="Pertenece a la U" SortExpression="maquina_u" />
                          <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" Visible ="false" />
                      </Columns>
                  </asp:GridView>
                  <asp:SqlDataSource ID="sql_ds_maquinas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_info_maquinas(departamento, funcionario, tipo_maquina, estado, funcionalidad, observaciones, campus, maquina_u, fecha_registro) VALUES (@dep, @funcinario, @tipo_maquina, @estado, @funcioanlida, @obs, @campus, @maquinau, getdate())" SelectCommand="SELECT * FROM [tb_info_maquinas] where campus=@campus" DeleteCommand="DELETE FROM tb_info_maquinas WHERE (id_m = @id_m)">
                      <DeleteParameters>
                          <asp:Parameter Name="id_m" />
                      </DeleteParameters>
                      <InsertParameters>
                          <asp:ControlParameter ControlID="txt_dep" Name="dep" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_funcionario" Name="funcinario" PropertyName="Text" />
                          <asp:ControlParameter ControlID="ddl_tipo_maq" Name="tipo_maquina" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="ddl_est" Name="estado" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="ddl_funcionalidad" Name="funcioanlida" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="txt_obs" Name="obs" PropertyName="Text" />
                          <asp:ControlParameter ControlID="ddl_campus" Name="campus" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="ddl_maquina_u" Name="maquinau" PropertyName="SelectedValue" />
                      </InsertParameters>
                      <SelectParameters>
                          <asp:ControlParameter ControlID="ddl_campus" Name="campus" PropertyName="SelectedValue" />
                      </SelectParameters>
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


