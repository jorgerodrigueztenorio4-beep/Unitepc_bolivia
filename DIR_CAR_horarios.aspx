<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_horarios.aspx.vb" Inherits="DIR_CAR_horarios" MasterPageFile="~/mp_dir_car.master" EnableEventValidation="false" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
      
   
          <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3>Horario por gestion</h3>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            
              <li class="breadcrumb-item active"> <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label></li>
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
            <div class="card card-indigo">
            <%--  <div class="card-header">
                <h3 class="card-title">Horario 2-2025</h3>

                
              </div>--%>
              <div class="card-body">
                  <div class="row g-3">
                      <div class="col-md-6">
                          <asp:DropDownList ID="ddl_Gestion" CssClass =" form-control mt-1 " runat="server" AutoPostBack="True">
                              <asp:ListItem>Seleccione una gestion</asp:ListItem>
                      <asp:ListItem>2-2025</asp:ListItem>
                      <asp:ListItem>1-2026</asp:ListItem>
                  </asp:DropDownList>
                      </div>
                      <div class="col-md-6">
                          <asp:TextBox ID="txt_username" runat="server" Visible="false"></asp:TextBox>
                          <asp:Button ID="Button1" CssClass ="btn btn-outline-primary  form-control mt-1  " runat="server" Text="Exportar a Excel" Visible="False" />
                      </div>
                  </div>
                  
               
                                <asp:TextBox ID="txt_idhora" runat="server" Visible="False"></asp:TextBox>
                             
                     <asp:GridView ID="gv_horarios_v" CssClass="table table-hover mt-1"
                runat="server" AutoGenerateColumns="False" DataSourceID="sql_virtuales"
                Font-Size="9pt" DataKeyNames="id_horario" Font-Names="Consolas" GridLines="None" AllowPaging="True">
                
                <Columns>
             
                    <asp:BoundField DataField="id_horario" HeaderText="Id." InsertVisible="False" SortExpression="id_horario" Visible="true" />
                    <asp:BoundField DataField="ci_doc" HeaderText="C.I. del Docente" SortExpression="ci_doc" ReadOnly="True" />
                    <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente">
                        <ItemStyle BackColor="#FFE6E6" />
                    </asp:BoundField>
                    <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula o Lab." SortExpression="nom_aula_lab" />
                    <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                    <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                    <asp:BoundField DataField="dia" HeaderText="Día" SortExpression="dia" />
                    <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase">
                        <ItemStyle BackColor="#E6FFE7" />
                    </asp:BoundField>
                    <asp:BoundField DataField="SiglaP" HeaderText="Sigla" SortExpression="SiglaP" />
                    <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                    <asp:BoundField DataField="Sis_plan" HeaderText="Plan" SortExpression="Sis_plan" />
                    <asp:BoundField DataField="Column1" HeaderText="Común" SortExpression="Column1" ReadOnly="True">
                        <ItemStyle BackColor="#E6F1FF" />
                    </asp:BoundField>
                    <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                    <asp:BoundField DataField="gestion" HeaderText="Gestión" SortExpression="Gestion" />
                </Columns>
                
                <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
            </asp:GridView>
                                <asp:SqlDataSource ID="sql_virtuales" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,replace((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ),'a a a','--* Sin Asignar Docente *--')as docente,a.nom_aula_lab , th.hora_inicio ,th.hora_fin,th.dia,th.tipo_clase  ,p.SiglaP,p.Materia,p.Sis_plan,isnull(td.comun,'No es Comun') ,th.grupo ,th.gestion
from tb_designacion td
 join tb_horario th on td.id_horario = th.id_horario 
 join tb_personal tp on th.ci_doc = tp.ci 
 join planes_estudios p on td.id_materia = p.id_plan
 join tb_aula a on th.aula = a.id_nomal  
where td.carrera =@carrera 
and th.gestion =@gestion 
and tp.gestion =@gestion 
and th.sede =@sede  
and a.gestion ='1-2024' 

ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END,hora_inicio " DeleteCommand="delete tb_horario where id_horario =@id_hor" UpdateCommand="UPDATE tb_horario SET ci_doc = @ci_doc WHERE (id_horario = @id_horario)">
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="txt_idhora" Name="id_hor" PropertyName="Text" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_sigla_car" Name="carrera" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_Gestion" Name="gestion" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="txt_username" Name="username" PropertyName="Text" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="id_horario" />
                                        <asp:Parameter Name="ci_doc" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_sigla_car" runat="server" Visible="False"></asp:TextBox>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]" DeleteCommand="delete tb_designacion where id_horario =@idhora">
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="txt_idhora" Name="idhora" PropertyName="Text" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_sede" runat="server" Visible="False"></asp:TextBox>
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
    <!-- /.content -->
  </div>
    </form>
</asp:Content>



