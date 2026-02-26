<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DocentesExamenes.aspx.vb" Inherits="DocentesExamenes" MasterPageFile="mp_docentes.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat="server">
     <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>ChartJS</h1>
          </div>
              </div>
      </div><!-- /.container-fluid -->
    </section>

       <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
            <!-- AREA CHART -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Materias y Grupos del Docente</h3>

               
              </div>
              <div class="card-body">
                <div class="chart">
                    <section class="content">
      <div class="card">
        
        <!-- /.card-header -->
        <div class="card-body">
          <div id="jsGrid1"></div>
                               <asp:GridView ID="GridView1" runat="server"
    AutoGenerateColumns="False"
    CssClass="table table-hover text-nowrap"
    DataSourceID="sql_materias_grupos"
    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Font-Size="9pt" GridLines="None">
    <Columns>
     
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="btnSeleccionar" runat="server"
                    CommandName="Select"
                    CssClass="btn btn-primary btn-sm rounded-circle"
                    ToolTip="Realizar Examen">
                    <i class="fas fa-pen"></i>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>

   
        <asp:BoundField DataField="id_horario" HeaderText="Id." />
        <asp:BoundField DataField="Materia" HeaderText="Materia" />
        <asp:BoundField DataField="grupo" HeaderText="Grupo" />
        <asp:BoundField DataField="tipo_clase" HeaderText="Clase" />
        <asp:BoundField DataField="SiglaP" HeaderText="Sigla" />
        <asp:BoundField DataField="gestion" HeaderText="Gestion" />
    </Columns>
</asp:GridView>

                    <asp:SqlDataSource ID="sql_materias_grupos" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString2 %>" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString2.ProviderName %>" SelectCommand="select th.id_horario  ,p.Materia, th.grupo,th.tipo_clase  ,p.SiglaP,th.gestion
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan 
left join tb_aula a on th.aula = a.id_nomal 
where th.ci_doc ='3791089'  and th.gestion='1-2025' and tp.gestion='1-2025' and a.gestion='1-2024'
ORDER BY p.Materia
"></asp:SqlDataSource>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </section>
                   
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- DONUT CHART -->
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">Donut Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- PIE CHART -->
            <div class="card card-danger">
              <div class="card-header">
                <h3 class="card-title">Pie Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <canvas id="pieChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col (LEFT) -->
          <div class="col-md-6">
            <!-- LINE CHART -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Line Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                <div id="alertMensaje" runat="server" class="alert alert-warning alert-dismissible fade show" role="alert" style="display:none;">
    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close" onclick="document.getElementById('alertMensaje').style.display='none';">
        <span aria-hidden="true">&times;</span>
    </button>
</div>

                  <canvas id="lineChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- BAR CHART -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Materias y Grupos del Docente</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- STACKED BAR CHART -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Stacked Bar Chart</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="stackedBarChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

          </div>
          <!-- /.col (RIGHT) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
        </form>
</asp:Content>



