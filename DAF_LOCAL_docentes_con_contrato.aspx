<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_LOCAL_docentes_con_contrato.aspx.vb" Inherits="DAF_LOCAL_docentes_con_contrato" MasterPageFile="mp_daf_local.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
          <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Materias Con/Sin Docente</h1>
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
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Datos</h3>

                
              </div>
              <div class="card-body">
              <div class="input-group mb-1">
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control    mt-1 " runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True"></asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]
where idSede=@sede">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_idsde" Name="sede" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_carrera" CssClass="form-control   mt-1 " runat="server" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True"></asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
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
          <div class="col-md-6">
            <!-- LINE CHART -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Resultados</h3>

               
              </div>
              <div class="card-body">
              <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small card -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>
    <asp:Label ID="lbl_cantc"  runat="server" Text="0"></asp:Label>
                </h3>

                <p>Total Materias</p>
              </div>
                 <h3>
    <asp:Label ID="Label1"  runat="server" Text="100"></asp:Label>
                     <sup style="font-size: 20px">%</sup>
                </h3>
              <div class="icon">
                <i class="fas fa-chart-pie"></i>
              </div>
            <a href="#" class="small-box-footer">
                <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small card -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>
                    <asp:Label ID="lbl_con_mat" runat="server" Text="0"></asp:Label>
                    

                </h3>

                <p>Materias con Docente</p>
              </div>
                 <h3>
                    <asp:Label ID="lbl_coonpor" runat="server" Text="0"></asp:Label>
                    <sup style="font-size: 20px">%</sup>

                </h3>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="#" class="small-box-footer">
                <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small card -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>
                    <asp:Label ID="lbl_sin_mat" runat="server" Text="0"></asp:Label>
                </h3>

                <p>Materias Sin Docente</p>
              </div>
                 <h3>
                    <asp:Label ID="lbl_sinpor" runat="server" Text="0"></asp:Label>
                    <sup style="font-size: 20px">%</sup>

                </h3>
              <div class="icon">
                <i class="fas fa-user-plus"></i>
              </div>
              <a href="#" class="small-box-footer">
              <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <%--<div class="col-lg-3 col-6">
            <!-- small card -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>65</h3>

                <p>Unique Visitors</p>
              </div>
              <div class="icon">
                <i class="fas fa-chart-pie"></i>
              </div>
              <a href="#" class="small-box-footer">
                
                  <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>--%>
          <!-- ./col -->
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




    

          
                             
              
    	

                                   <asp:GridView ID="gv_con_docente" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_con_docente" Visible="False">
            <Columns>
                <asp:BoundField DataField="Expr1" HeaderText="Expr1" ReadOnly="True" SortExpression="Expr1" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="sql_ds_con_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT COUNT(th.gestion) AS Expr1 FROM tb_horario AS th INNER JOIN tb_designacion AS td ON th.id_horario = td.id_horario INNER JOIN planes_estudios AS p ON td.id_materia = p.id_plan INNER JOIN tb_personal AS tp ON th.ci_doc = tp.ci WHERE (th.sede = @sede) AND (p.codcar = @carrera) AND (tp.gestion = '2-2024') AND (tp.ci &lt;&gt; '0')">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>


        <%-- ///////////////////////// sin docente--%>
             <asp:GridView ID="gv_sin_docente" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_sin_docente" Visible="False">
                 <Columns>
                     <asp:BoundField DataField="Expr1" HeaderText="Expr1" ReadOnly="True" SortExpression="Expr1" />
                 </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="sql_ds_sin_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT COUNT(th.gestion) AS Expr1 FROM tb_horario AS th INNER JOIN tb_designacion AS td ON th.id_horario = td.id_horario INNER JOIN planes_estudios AS p ON td.id_materia = p.id_plan INNER JOIN tb_personal AS tp ON th.ci_doc = tp.ci WHERE (th.sede = @sede) AND (p.codcar = @carrera) AND (tp.gestion = '2-2024') AND (tp.ci = '0')">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
            
            
                <asp:GridView ID="gv_docentes_c_c" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_concontrato" Visible="False">
                                    <Columns>
                                        <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_concontrato" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select COUNT (th.gestion) from tb_horario th
join tb_designacion td on th.id_horario = td.id_horario
join planes_estudios p on td.id_materia = p.id_plan 
join tb_personal tp on th.ci_doc = tp.ci 
where th.sede ='1' and p.codcar =@sigcar  and tp.gestion ='2-2024' ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="sigcar" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
            
            
            
            
            <%-- ////////////////////// --%>
                        
          



        <asp:TextBox ID="txt_idsde" runat="server"></asp:TextBox>


    </form>

</asp:Content>


