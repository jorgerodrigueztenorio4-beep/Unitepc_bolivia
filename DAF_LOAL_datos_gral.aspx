<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_LOAL_datos_gral.aspx.vb" Inherits="DAF_LOAL_datos_gral" MasterPageFile="mp_daf_local.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">

     <form runat ="server">

           <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Horario General</h1>
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
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Horarios</h3>

                
              </div>
              <div class="card-body">
                 <asp:GridView ID="gv_horatrios_gral" runat="server" CssClass ="table table-hover mt-1  " AutoGenerateColumns="False" DataSourceID="sql_ds_todo" Font-Size="9pt" Font-Names="Consolas" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_horario"  />
                                        <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Horas Academicas" ReadOnly="True" SortExpression="Hras_academica" />
                                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="SiglaP" HeaderText="Sigla" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Plan" SortExpression="Sis_plan" />
                                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="nom_bloque" HeaderText="Bloque" SortExpression="nom_bloque" />
                                        <asp:BoundField DataField="CARDES" HeaderText="Carrera" SortExpression="CARDES" />
                                        <asp:BoundField DataField="NombreSede" HeaderText="Sede" SortExpression="NombreSede" />
                                    </Columns>
                                    <HeaderStyle BackColor="#409756" ForeColor="White" />
                                </asp:GridView>

                                <asp:SqlDataSource ID="sql_ds_todo" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente, th.hora_inicio ,th.hora_fin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.grupo,th.tipo_clase,p.SiglaP,p.Materia ,p.Sis_plan,th.dia ,a.nom_aula_lab,tb.nom_bloque  ,c.CARDES ,ts.NombreSede 
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
  join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan 
 join tb_aula a on th.aula = a.id_nomal 
join tb_sedes ts on th.sede = ts.idSede 
join tb_bloques tb on th.bloque  = tb.id_bloque 
join tb_carreras c on p.codcar = c.CARSIGLA 
where th.gestion ='1-2024'  and tp.gestion ='1-2024'  and a.gestion ='1-2024' and th.sede ='1'
ORDER BY   ts.NombreSede , CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END ,th.hora_inicio,c.CARDES " UpdateCommand="UPDATE tb_aula SET nom_aula_lab = @nom_aula_lab WHERE (id_nomal = @id_nomal)">
                                    <UpdateParameters>
                                        <asp:Parameter Name="nom_aula_lab" />
                                        <asp:Parameter Name="id_nomal" />
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
       
            </div>
        

          </div>
         
        </div>
       
      </div>
    </section>
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
   
         </form>
</asp:Content>


