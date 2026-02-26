<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_habilitar_respaldos.aspx.vb" Inherits="RR_HH_habilitar_respaldos" MasterPageFile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
      <form runat ="server" >

         <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Habilitar Respaldos</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              
              <li class="breadcrumb-item active">
                  <asp:Label ID="lbl_cargo" runat="server" Text="Label"></asp:Label></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-8">
            <!-- AREA CHART -->
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Lista de Carreras para Habilitar
                </h3>

                
              </div>
              <div class="card-body">
                  <asp:DropDownList ID="ddl_sede" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True" AutoPostBack="True">
                      <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                  </asp:DropDownList>
                  <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                  <asp:GridView ID="gv_habilitar" runat="server" CssClass="table table-hover mt-2 " AutoGenerateColumns="False" DataKeyNames="id_respaldos" DataSourceID="sql_ds_habilitar" GridLines="None" Font-Names="Consolas" Font-Size="10pt">
                      <Columns>
                          <asp:CommandField ShowEditButton="True" />
                          <asp:BoundField DataField="id_respaldos" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_respaldos" />
                          <asp:BoundField DataField="sede" HeaderText="Cod.Sede" ReadOnly="True" SortExpression="sede" />
                          <asp:BoundField DataField="carrera" HeaderText="Sigla de la Carrera" ReadOnly="True" SortExpression="carrera" />
                          <asp:TemplateField HeaderText="Fecha de Bloqueo" SortExpression="fecha_bloqueo">
                              <EditItemTemplate>
                                  <asp:TextBox ID="TextBox1"  runat="server" Text='<%# Bind("fecha_bloqueo") %>'></asp:TextBox>
                              </EditItemTemplate>
                              <ItemTemplate>
                                  <asp:Label ID="Label1" runat="server" Text='<%# Bind("fecha_bloqueo") %>'></asp:Label>
                              </ItemTemplate>
                          </asp:TemplateField>
                      </Columns>
                      <HeaderStyle BackColor="#9955FF" ForeColor="White" />
                  </asp:GridView>
                  <asp:SqlDataSource ID="sql_ds_habilitar" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloqueo_respaldos] WHERE ([sede] = @sede)" UpdateCommand="UPDATE tb_bloqueo_respaldos SET fecha_bloqueo = @fecha_bloqueo WHERE (id_respaldos = @id_respaldos)">
                      <SelectParameters>
                          <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" Type="Int32" />
                      </SelectParameters>
                      <UpdateParameters>
                          <asp:Parameter Name="fecha_bloqueo" Type="DateTime" />
                          <asp:Parameter Name="id_respaldos" />
                      </UpdateParameters>
                  </asp:SqlDataSource>
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
          <div class="col-md-4">
            <!-- LINE CHART -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">.</h3>

               
              </div>
              <div class="card-body">
                    <h4 >.</h4>
                    <div class="row">
                         
                    <div class="col-sm-6">
                      <div class="form-group">
                        <label></label>
                        <%--<input type="text" class="form-control" placeholder="Enter ..." disabled>--%>
                      </div>
                    </div>
                  </div>
                  

              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- BAR CHART 
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Bar Chart</h3>

               
              </div>
              <div class="card-body">
              
              </div>
            /.card-body -->
            </div>
            <!-- /.card -->

            <!-- STACKED BAR CHART 
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Stacked Bar Chart</h3>

              
              </div>
              <div class="card-body">
                
              </div>
           /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col (RIGHT) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

    </form>
</asp:Content>


