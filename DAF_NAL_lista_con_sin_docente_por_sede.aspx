<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_NAL_lista_con_sin_docente_por_sede.aspx.vb" Inherits="DAF_NAL_lista_con_sin_docente_por_sede" MasterPageFile="mp_daf_nacional.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <!-- AREA CHART -->
            <div class="card card-purple">
              <div class="card-header">
                <h3 class="card-title">Seleccionar Sede</h3>

                <div class="card-tools">
                    
                </div>
              </div>
              <div class="card-body">
               <div class="chart">
                    
                
                       <div class="form-group row">
                    <label for="exampleInputEmail1" class="col-sm-4 col-form-label">Seleccione una Sede</label>
                      <div class="col-sm-8">
                          <asp:DropDownList ID="ddl_sede" CssClass ="custom-select form-control-border" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True" AppendDataBoundItems="True">
                              <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                          </asp:DropDownList>
                          <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                         </div>
                          </div>
                  
                    
             
                    <div class="card-footer">
                        <asp:Button ID="btn_registrar" CssClass ="btn btn-primary btn-flat form-control  " runat="server" Text="Extraer Reporte" />
                </div>

               </div>

              </div>
              <!-- /.card-body -->
            </div>
               <div class="card card-teal">
              <div class="card-header">
                <h3 class="card-title">Lista General de la sede Seleccionada</h3>

            
              </div>
              <div class="card-body">
                  <asp:GridView ID="gv_lista" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_listasede" Font-Names="Consolas" Font-Size="9pt">
                      <Columns>
                          <asp:BoundField DataField="id_horario" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                          <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                          <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                          <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />
                          <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                          <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                          <asp:BoundField DataField="Hras_academica" HeaderText="Hras_academica" ReadOnly="True" SortExpression="Hras_academica" Visible ="false"  />
                          <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                          <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                          <asp:BoundField DataField="SiglaP" HeaderText="Sigla" SortExpression="SiglaP" />
                          <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                          <asp:BoundField DataField="Sis_plan" HeaderText="Plan" SortExpression="Sis_plan" />
                          <asp:BoundField DataField="Column1" HeaderText="Comun" ReadOnly="True" SortExpression="Column1" />
                          <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                          <asp:BoundField DataField="codcar" HeaderText="Sigla de la Carrera" SortExpression="codcar" />
                          <asp:BoundField DataField="NombreSede" HeaderText="Sede" SortExpression="NombreSede" />
                      </Columns>
                      <HeaderStyle BackColor="#6F42C1" ForeColor="White" />
                  </asp:GridView>
                  <asp:SqlDataSource ID="sql_ds_listasede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,replace((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ),'a a a','--* Sin Asignar Docente *--')as docente,a.nom_aula_lab , th.hora_inicio ,th.hora_fin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.dia,th.tipo_clase  ,p.SiglaP,p.Materia,p.Sis_plan,isnull(td.comun,'No es Comun') ,th.grupo  ,p.codcar ,s.NombreSede 
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan
 join tb_aula a on th.aula = a.id_nomal  
 join tb_sedes s on th.sede = s.idSede 
where th.gestion ='1-2024' and tp.gestion ='1-2024' and th.sede =@sede and a.gestion ='1-2024'
ORDER BY p.codcar,docente,  CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END,hora_inicio ">
                      <SelectParameters>
                          <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
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
           
            <!-- /.card -->

            <!-- BAR CHART -->
            
            <!-- /.card -->

            <!-- STACKED BAR CHART -->
            
            <!-- /.card -->

          </div>
          <!-- /.col (RIGHT) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>



    </form>



</asp:Content>


