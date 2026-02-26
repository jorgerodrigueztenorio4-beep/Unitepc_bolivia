<%@ Page Language="VB" AutoEventWireup="false" CodeFile="inventario_tecnologico.aspx.vb" Inherits="inventario_tecnologico" MasterPageFile="~/mp_daf_local.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server" >
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-4">
            <!-- general form elements -->
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Registro de Activos Tecnologicos</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                     
                                <asp:TextBox ID="txt_nombre_articulo" placeholder="Nombre y Articulo" CssClass ="form-control " runat="server" AutoPostBack="False" Font-Bold="False" Font-Size="12pt"></asp:TextBox>
                    <asp:TextBox ID="txt_proveedor" placeholder="Proveedor" CssClass ="form-control mt-1  " runat="server"></asp:TextBox>
                    <asp:TextBox ID="txt_ubicacion" placeholder="Ubicacion" CssClass ="form-control mt-1  " runat="server"></asp:TextBox>
                    <asp:TextBox ID="txt_descripcion" placeholder="Descripcion" CssClass ="form-control  mt-1 " runat="server"></asp:TextBox>
                    <asp:TextBox ID="txt_cantidad" placeholder="Cantidad" CssClass ="form-control  mt-1 " runat="server"></asp:TextBox>

                    
                                <asp:Button ID="Button2" runat="server" CssClass="form-control btn btn-primary mt-2" Text="Registrar Articulo" />
                               

              

                  </div>
                              
                
                <!-- /.card-body -->

           
            </div>
         
          </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-8">
            <!-- Form Element sizes -->
            <div class="card card-teal">
              <div class="card-header">
                <h3 class="card-title">Activos Tecnologicos</h3>
              </div>
              <div class="card-body">
                   
                  <asp:GridView ID="gv_activos" CssClass ="table table-hover " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_activos" Font-Names="Consolas" Font-Size="10pt" DataKeyNames="id_articulo">
                      <Columns>
                          <asp:CommandField ShowDeleteButton="True" />
                          <asp:BoundField DataField="id_articulo" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_articulo" />
                          <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" Visible ="false"  />
                          <asp:BoundField DataField="nombre_articulo" HeaderText="Nombre del Articulo" SortExpression="nombre_articulo" />
                          <asp:BoundField DataField="proveedor" HeaderText="Proveedor" SortExpression="proveedor" />
                          <asp:BoundField DataField="ubicacion" HeaderText="Ubicacion" SortExpression="ubicacion" />
                          <asp:BoundField DataField="descripcion" HeaderText="Descripcion" SortExpression="descripcion" />
                          <asp:BoundField DataField="cantidad" HeaderText="Cantidad" SortExpression="cantidad" />
                          <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" />
                          <asp:BoundField DataField="fecha_actualizacion" HeaderText="fecha_actualizacion" SortExpression="fecha_actualizacion" Visible ="false"  />
                      </Columns>
                      <HeaderStyle BackColor="#6610F2" ForeColor="White" />
                  </asp:GridView>
                  




                  <asp:SqlDataSource ID="sql_ds_activos" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_inventario_tec(sede, nombre_articulo, proveedor, ubicacion, descripcion, cantidad, fecha_registro, fecha_actualizacion) VALUES ('3', @nombrarte, @proveedor, @ubicacion, @descripcion, @cant, GETDATE(), getdate())" SelectCommand="SELECT * FROM [tb_inventario_tec] order by id_articulo  desc" DeleteCommand="DELETE FROM tb_inventario_tec WHERE (id_articulo = @id_articulo)">
                      <DeleteParameters>
                          <asp:Parameter Name="id_articulo" />
                      </DeleteParameters>
                      <InsertParameters>
                          <asp:ControlParameter ControlID="txt_nombre_articulo" Name="nombrarte" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_proveedor" Name="proveedor" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_ubicacion" Name="ubicacion" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_descripcion" Name="descripcion" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_cantidad" Name="cant" PropertyName="Text" />
                      </InsertParameters>
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

</form>
</asp:Content>


