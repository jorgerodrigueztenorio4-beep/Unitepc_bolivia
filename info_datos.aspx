<%@ Page Language="VB" AutoEventWireup="false" CodeFile="info_datos.aspx.vb" Inherits="info_datos" MasterPageFile="mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server"  >
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
          <div class="col-md-12">
            <!-- AREA CHART -->
            <div class="card card-purple">
              <div class="card-header">
                <h3 class="card-title">Lista de Datos Grabados por Sede</h3>

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
            
                   <asp:GridView ID="gv_datos" runat="server" CssClass ="table table-hover " AutoGenerateColumns="False" DataSourceID="sql_ds_datos_info" Font-Names="Consolas" Font-Size="10pt" GridLines="None">
                       <Columns>
                           <asp:BoundField DataField="id_info" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_info" />
                           <asp:BoundField DataField="sede" HeaderText="Sede" SortExpression="sede" />
                           <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                           <asp:BoundField DataField="nro_ci" HeaderText="C.I." SortExpression="nro_ci" />
                           <asp:BoundField DataField="extencion" HeaderText="Extencion" SortExpression="extencion" />
                           <asp:BoundField DataField="cel_per" HeaderText="Nro. Personal" SortExpression="cel_per" />
                           <asp:BoundField DataField="cel_corp" HeaderText="Nro. Corporativo" SortExpression="cel_corp" />
                           <asp:BoundField DataField="email" HeaderText="E-.mail" SortExpression="email" />
                           <asp:BoundField DataField="cargo" HeaderText="Cargo" SortExpression="cargo" />
                       </Columns>
                       <HeaderStyle BackColor="#6600CC" ForeColor="White" />
                       </asp:GridView>
                 
                 
                 




                  
                    
             
                       <asp:SqlDataSource ID="sql_ds_datos_info" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_info_correo] WHERE ([sede] = @sede)">
                           <SelectParameters>
                               <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" Type="Int32" />
                           </SelectParameters>
                       </asp:SqlDataSource>
                 
                 
                 




                  
                    
             
                

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
          
          <!-- /.col (RIGHT) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
        </form>
</asp:Content>


