<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_intentos_de_marcado.aspx.vb" Inherits="RR_HH_intentos_de_marcado" MasterPageFile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server" >
      <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>ChartJS</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">ChartJS</li>
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
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Area 1</h3>

                
              </div>
              <div class="card-body">
                  <asp:TextBox ID="txt_ci" CssClass =" form-control  form-control-sm " placeholder="Ingrese el Nro de C.I. del Docente" runat="server"></asp:TextBox>
                  <asp:TextBox ID="txt_fecha" CssClass =" form-control  form-control-sm mt-1" type="date"  runat="server"></asp:TextBox>
                  <asp:TextBox ID="txt_fecha_f" CssClass =" form-control  form-control-sm mt-1" type="date"  runat="server"></asp:TextBox>
                  <asp:Button ID="btn_buscar" runat="server" CssClass ="btn btn-primary btn-sm form-control mt-1 " Text="Buscar" />
                    <asp:GridView ID="gv_horario" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario" Font-Size="9pt" Font-Names="Consolas" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" Visible ="false"  />
                                        <asp:BoundField DataField="ci_doc" HeaderText="Nro de C.I." SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" >
                                        <ItemStyle BackColor="#CCE5FF" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" >
                                        <ItemStyle BackColor="#FFF3CD" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Horas Academicas" ReadOnly="True" SortExpression="Hras_academica" Visible ="false"  />
                                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" >
                                        <ItemStyle BackColor="#99FFCC" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="link" HeaderText="Link" ReadOnly="True" SortExpression="link" Visible ="false" />
                                        <asp:BoundField DataField="Aula" HeaderText="Aula" ReadOnly="True" SortExpression="Aula" />
                                        <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion" Visible ="false"  />
                                        <asp:BoundField DataField="SiglaP" HeaderText="Sigla" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" >
                                        <ItemStyle BackColor="#FFFFCC" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" Visible ="false"  />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" HorizontalAlign="Center" />
                                 </asp:GridView>
                                 <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente, th.hora_inicio ,th.hora_fin,th.grupo,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.dia,th.tipo_clase ,isnull(link_clase,'Sin Link') as link,isnull(a.nom_aula_lab,' ') as Aula ,td.fecha_creacion ,p.SiglaP,p.Materia,p.Sis_plan
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan 
left join tb_aula a on th.aula = a.id_nomal 
where th.ci_doc =@ci  and th.gestion='2-2024' and tp.gestion='2-2024' and a.gestion='1-2024'
ORDER BY hora_inicio, CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END" >
                                     <SelectParameters>
                                         <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                                     </SelectParameters>
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
          <div class="col-md-6">
            <!-- LINE CHART -->
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">2.1</h3>

               
              </div>
              <div class="card-body">
                  <asp:GridView ID="gv_marcado" CssClass ="table table-hover mt-1 table-striped " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_marcado" Font-Names="Consolas" Font-Size="10pt" GridLines="None">
                      <Columns>
                          <asp:BoundField DataField="Docente" HeaderText="Docente" ReadOnly="True" SortExpression="Docente" />
                          <asp:BoundField DataField="fecha_intento" HeaderText="Fecha de Intento" SortExpression="fecha_intento" />
                          <asp:BoundField DataField="accion" HeaderText="Accion" SortExpression="accion" />
                      </Columns>
                  </asp:GridView>
                  <asp:SqlDataSource ID="sql_ds_marcado" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT (p.nombres +' '+p.primerApellido +' '+p.segundoApellido ) AS Docente,i.fecha_intento ,i.accion FROM tb_intento_marcado i JOIN tb_personal p ON i.nro_ci = p.ci WHERE p.gestion ='2-2024' AND i.nro_ci =@ci AND fecha_intento BETWEEN @fechaInicio AND @fechaFin +1
order by i.fecha_intento ">
                      <SelectParameters>
                          <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_fecha" Name="fechaInicio" PropertyName="Text" Type="DateTime" />
                          <asp:ControlParameter ControlID="txt_fecha_f" Name="fechaFin" PropertyName="Text" Type="DateTime" />
                      </SelectParameters>
                  </asp:SqlDataSource>
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
        </form>
</asp:Content>


