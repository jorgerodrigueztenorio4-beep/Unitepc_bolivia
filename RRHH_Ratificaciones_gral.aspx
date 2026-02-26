<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RRHH_Ratificaciones_gral.aspx.vb" Inherits="RRHH_Ratificaciones_gral" MasterPageFile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
       <form id="form1" runat="server">
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-8">
            <!-- general form elements -->
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Lista de Docentes Activos de la Actual Gestión</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                    <asp:Button ID="Button1" runat="server" Text="Buscar Ratificados" />
                      <asp:GridView ID="gv_final" runat="server" Font-Names="Consolas" Font-Size="9pt"></asp:GridView>
                    <asp:SqlDataSource ID="sql_plan" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [planes_estudios]"></asp:SqlDataSource>
                   
                  

                  </div>
                              
                
                <!-- /.card-body -->

           
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
          <div class="col-md-4">
            <!-- Form Element sizes -->
            <div class="card card-teal">
              <div class="card-header">
                <h3 class="card-title">Lista de Docentes Ratificados para la Siguiente Gestión</h3>
              </div>
              <div class="card-body">
                       
                 

                    <asp:SqlDataSource ID="sql_ds_ratificados" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select ci_doc  from tb_ratificados 
group by ci_doc "></asp:SqlDataSource>

                 






                






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


