<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_habilitar_horarios.aspx.vb" Inherits="RR_HH_habilitar_horarios" MasterPageFile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
      <div class=" content-wrapper ">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Habilitar y Deshabilitar el Cargado de Horarios</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">General Form</li>
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
          <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Datos</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
                <form id="form1" runat="server">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Seleccione una Sede</label>
                      <asp:DropDownList ID="ddl_sede" CssClass ="custom-select form-control-border" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True" AppendDataBoundItems="True">
                          <asp:ListItem Value="0">Seleccione un Sede</asp:ListItem>
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                   
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Seleccione una carrera</label>
                      <asp:DropDownList ID="ddl_carrera" runat="server"  CssClass ="custom-select form-control-border"  DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True" AppendDataBoundItems="True">
                          <asp:ListItem Value="0">Seleccione una Carrera</asp:ListItem>
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                       <asp:GridView ID="gv1" runat="server" CssClass ="table table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_detalle" Font-Names="Consolas" Font-Size="10pt" GridLines="None">
                      <Columns>
                          <asp:BoundField DataField="id_habilitados" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_habilitados" />
                          <asp:BoundField DataField="carrera" HeaderText="Sigla de la Carrera" SortExpression="carrera" />
                          <asp:BoundField DataField="habilitacion" HeaderText="Estado" SortExpression="habilitacion" />
                          <asp:BoundField DataField="SEDE" HeaderText="Id. Sede" SortExpression="SEDE" />
                          <asp:BoundField DataField="fecha_modificacion" HeaderText="Fecha de Cierre" SortExpression="fecha_modificacion" />
                      </Columns>
                           <HeaderStyle BackColor="#CC99FF" />
                  </asp:GridView>
                  <asp:SqlDataSource ID="sql_ds_detalle" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select * from tb_habilitaciones_horarios h
where h.SEDE=@sede and h.carrera=@carera" UpdateCommand="UPDATE tb_habilitaciones_horarios SET habilitacion = @habilitacion1, fecha_modificacion = GETDATE() WHERE (id_habilitados = @id_habilitados1)">
                      <SelectParameters>
                          <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="ddl_carrera" Name="carera" PropertyName="SelectedValue" />
                      </SelectParameters>
                      <UpdateParameters>
                          <asp:ControlParameter ControlID="ddl_estado" Name="habilitacion1" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="txt_id_habilitado" Name="id_habilitados1" PropertyName="Text" />
                      </UpdateParameters>
                  </asp:SqlDataSource>
                  <asp:DropDownList ID="ddl_estado" CssClass="custom-select form-control-border" runat="server" Visible="False">
                      <asp:ListItem>Seleccione una opcion</asp:ListItem>
                      <asp:ListItem>HABILITADO</asp:ListItem>
                      <asp:ListItem>NO HABILITADO</asp:ListItem>
                  </asp:DropDownList>
                  <asp:TextBox ID="txt_id_habilitado" runat="server" Visible="False"></asp:TextBox>
                  <asp:Button ID="Button1" CssClass ="btn btn-primary mt-1 " runat="server" Text="Actualizar" Visible="False" />
                
                       <div class="timeline-footer">
                 
                  </div>

                    
         
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
          
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
          </form>
  </div>
</asp:Content>


