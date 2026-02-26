<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_imp_horarios_carrera.aspx.vb" Inherits="RR_HH_imp_horarios_carrera" MasterPageFile="~/mp_rr_hh.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form  runat ="server" >
    <div class="">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Horario por Carrera</h1>
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
                <h3 class="card-title">Datos para el Reporte</h3>

                <div class="card-tools">
                    
                </div>
              </div>
              <div class="card-body">
               <div class="chart">
                    
                  <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Sede :</label>
                      <div class="col-sm-8">
                          <asp:DropDownList ID="ddl_sede" CssClass="form-control "  runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True">
                              <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                          </asp:DropDownList>
                          <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes] ORDER BY [NombreSede]"></asp:SqlDataSource>
                         </div>
                          </div>
                    <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Carrera :</label>
                      <div class="col-sm-8">
                          <asp:DropDownList ID="ddl_carrera" CssClass="form-control "  runat="server" AppendDataBoundItems="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True">
                              <asp:ListItem Value="0">Seleccione una Carrera</asp:ListItem>
                          </asp:DropDownList>
                          <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] ORDER BY [CARDES]"></asp:SqlDataSource>
                         </div>
                          </div>
                      <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Docente :</label>
                      <div class="col-sm-8"> 
                         <asp:DropDownList ID="ddl_docente" CssClass="form-control "  runat="server" DataSourceID="sql_ds_docente" DataTextField="docente" DataValueField="ci_doc" Font-Size="10pt" AutoPostBack="True">
                                   <asp:ListItem Value="0">Seleccione un Docente</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente ,ci_doc from tb_horario th
join tb_designacion td on th.id_horario = td.id_horario
join planes_estudios p on td.id_materia = p.id_plan 
join tb_personal tp on th.ci_doc = tp.ci 
where th.sede =@sede and p.codcar =@carrera    and th.gestion ='1-2026' and tp.gestion ='1-2026'    group by nombres ,primerApellido,segundoApellido,ci_doc order by docente">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </div>
                            
                          </div>
                  
                
                    <div class="card-footer">
                        <asp:Button ID="btn_registrar" CssClass ="btn btn-primary btn-flat form-control  " runat="server" Text="Extraer Reporte" />
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
                <h3 class="card-title">Horario</h3>

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
                  <asp:GridView ID="gv_horario" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario" Font-Names="Consolas" Font-Size="8pt" GridLines="None">
                      <Columns>
                          <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                          <asp:BoundField DataField="ci" HeaderText="C.I." SortExpression="ci" />
                          <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                          <asp:BoundField DataField="SiglaP" HeaderText="Sigla" SortExpression="SiglaP" />
                          <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                          <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                          <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                          <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                          <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                          <asp:BoundField DataField="carrera" HeaderText="Carrera" SortExpression="carrera" />
                          <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />
                          <asp:BoundField DataField="nom_bloque" HeaderText="Bloque" SortExpression="nom_bloque" />
                          <asp:BoundField DataField="Comun" HeaderText="Comun" ReadOnly="True" SortExpression="Comun" />
                          <asp:BoundField DataField="Gestion" HeaderText="Gestion" ReadOnly="True" SortExpression="gestion" />
                      </Columns>
                  </asp:GridView>
                  <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select replace((p.nombres+' '+p.primerApellido +' '+p.segundoApellido ),'a a a','--* Sin Asignar Docente *--')as docente ,p.ci ,m.Materia,m.SiglaP ,h.tipo_clase,h.grupo ,h.dia ,h.hora_inicio ,h.hora_fin ,d.carrera   ,a.nom_aula_lab,b.nom_bloque,isnull(d.comun,'NC') as Comun,h.gestion
from tb_horario h
join tb_designacion d on d.id_horario=h.id_horario 
join tb_personal p on h.ci_doc = p.ci
join planes_estudios m on d.id_materia = m.id_plan 
join tb_aula a on h.aula = a.id_nomal 
join tb_bloques b on h.bloque = b.id_bloque 
where h.gestion ='1-2026' and p.gestion ='1-2026' and d.carrera =@carrera and h.sede =@sede and h.ci_doc =@cidoc and a.gestion='1-2024'
ORDER BY docente,m.Materia, CASE WHEN h.dia = 'Lunes' THEN 1 WHEN h.dia='Martes' THEN 2 WHEN h.dia='Miercoles' THEN 3 WHEN h.dia='Jueves' THEN 4 WHEN h.dia='Viernes' THEN 5  WHEN h.dia='Sabado' THEN 6  END,hora_inicio 
">
                      <SelectParameters>
                          <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="ddl_docente" Name="cidoc" PropertyName="SelectedValue" />
                      </SelectParameters>
                  </asp:SqlDataSource>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- BAR CHART -->
           

            <!-- STACKED BAR CHART -->
         

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



