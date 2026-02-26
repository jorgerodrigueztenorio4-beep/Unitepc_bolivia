<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_materias_con_docente.aspx.vb" Inherits="RR_HH_materias_con_docente" MasterPageFile="mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">

     <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border  rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Lista de Materias Con y Sin docente por Sede y Carrera
                            </div>
                                <div class="input-group mb-1">
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control  btn btn-default  mt-1 "  runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True"></asp:DropDownList>
                                    <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_carrera" CssClass="form-control  btn btn-default  mt-1 "  runat="server" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True"></asp:DropDownList>
                                    <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                    </div>
                            </div>
            </div>
         </div>


     <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Materias Con Docente</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                     <div class="col-lg-12 col-6">
            <!-- small card -->
            <div class="small-box bg-primary ">
              <div class="inner">
                <h3>
    <asp:Label ID="lbl_cantc"  runat="server" Text="0"></asp:Label>
                </h3>

                <p>Materias con Docente</p>
              </div>
                 
              <div class="icon">
                <i class="fas fa-chart-pie"></i>
              </div>
         
            </div>
          </div>
                    <asp:GridView ID="gv_con_doc" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_con_mat" Font-Names="Consolas" Font-Size="9pt">
                        <Columns>
                            <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                            <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                            <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                            <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                            <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                            <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                            <asp:BoundField DataField="gestion" HeaderText="Gestion" SortExpression="gestion" />
                        </Columns>
                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sql_ds_con_mat" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select h.hora_inicio ,h.hora_fin ,h.grupo ,h.ci_doc ,p.Materia,h.dia ,h.gestion   from tb_horario h
join tb_designacion d on h.id_horario = d.id_horario 
join planes_estudios p on d.id_materia = p.id_plan 
where h.ci_doc &lt;&gt;'0' and h.gestion ='2-2023' and h.sede =@sede and p.codcar =@car">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddl_carrera" Name="car" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
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
          <div class="col-md-6">
            <!-- Form Element sizes -->
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">Materias Sin Docente</h3>
              </div>
              <div class="card-body">
                   <div class="col-lg-12 col-6">
            <!-- small card -->
            <div class="small-box bg-danger  ">
              <div class="inner">
                <h3>
    <asp:Label ID="lbl_sin_doc"  runat="server" Text="0"></asp:Label>
                </h3>

                <p>Materias Sin Docente</p>
              </div>
                 
              <div class="icon">
                <i class="fas fa-chart-pie"></i>
              </div>
         
            </div>
          </div>
                <asp:GridView ID="gv_sin_mat" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_sin_mat" Font-Names="Consolas" Font-Size="9pt">
                        <Columns>
                            <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                            <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                            <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                            <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                            <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                            <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                            <asp:BoundField DataField="gestion" HeaderText="Gestion" SortExpression="gestion" />
                        </Columns>
                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="sql_ds_sin_mat" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select h.hora_inicio ,h.hora_fin ,h.grupo ,h.ci_doc ,p.Materia,h.dia ,h.gestion   from tb_horario h
join tb_designacion d on h.id_horario = d.id_horario 
join planes_estudios p on d.id_materia = p.id_plan 
where h.ci_doc ='0' and h.gestion ='2-2023' and h.sede =@sede and p.codcar =@car">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="ddl_carrera" Name="car" PropertyName="SelectedValue" />
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
         </form>
</asp:Content>


