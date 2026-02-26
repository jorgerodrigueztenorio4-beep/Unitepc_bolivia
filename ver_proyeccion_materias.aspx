<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ver_proyeccion_materias.aspx.vb" Inherits="ver_proyeccion_materias" masterpagefile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
      <form runat ="server">

     <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-4">
            <!-- general form elements -->
            <div class="card card-indigo ">
              <div class="card-header">
                <h3 class="card-title">Datos para el Reporte</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
             
                <div class="card-body">
                       

                                <div class="input-group">
                                   <div class="input-group">
                    <label for="exampleInputEmail1">Seleccione una Sede</label>
                    <div class="input-group">
                                        
                        <asp:DropDownList ID="ddl_sede" runat="server" DataSourceID="sql_ds_sede" CssClass ="form-control mt-1 " DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True"></asp:DropDownList>
                                       
                        <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                       
                        </div>
                  </div>
                                    <div class="input-group">
                    <label for="exampleInputEmail1">Seleccione una Carrera</label>
                                        <div class="input-group">
                                           <asp:DropDownList ID="ddl_carrera" runat="server" CssClass ="form-control mt-1 " AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA">
                                          
                                        </asp:DropDownList>
                                            <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                     
                                            </div>
                  </div>
                                </div>




                     <div class="input-group mb-6">
                                    <div class="form-group">
                    <label for="exampleInputEmail1">Fecha de Inicio</label>
                     <asp:TextBox ID="txt_fi" type="date" CssClass ="form-control mt-1 "  runat="server"></asp:TextBox>
                              
                  </div>
                                    <div class="form-group">
                    <label for="exampleInputEmail1">Fecha de Fin</label>
                                         <asp:TextBox ID="txt_ff" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                  </div>
                         
                                </div>
                  
                                <div class="form-group">
                                    <div class="form-group"">
                    <label for="exampleInputEmail1">Cantidad de Dias en el Rango de Fechas</label>
                  </div>
                                    <div class="form-group">
                    <label for="exampleInputEmail1">Lunes</label>
    
                                        <asp:TextBox ID="txt_lunes"  runat="server" Width="50px"></asp:TextBox>
                                        <label for="exampleInputEmail1">Martes</label> 
                                              <asp:TextBox ID="txt_martes"  Width="50px" runat="server"></asp:TextBox>
                               
                                        <label for="exampleInputEmail1">Miercoles</label>
                                         <asp:TextBox ID="txt_miercoles"  Width="50px" runat="server"></asp:TextBox>
                            <br />
                                        <label for="exampleInputEmail1">Jueves</label>
                                            <asp:TextBox ID="txt_jueves" Width="50px"  runat="server"></asp:TextBox>
                               
                                        <label for="exampleInputEmail1">Viernes</label>
                                         <asp:TextBox ID="txt_viernes"  Width="50px" runat="server"></asp:TextBox>
                                
                                        <label for="exampleInputEmail1">Sabado</label>  
                                                   <asp:TextBox ID="txt_sabado"  Width="50px" runat="server"></asp:TextBox> 
                                          <br />
                                      <label for="exampleInputEmail1">Total Dias</label>  
                                          <asp:TextBox ID="TextBox8" Width="50px"  runat="server"></asp:TextBox>
                  </div>
                                       
                                </div>
                    
                             
                              
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <div class="input-group mb-1">
                                    <asp:Button ID="Button2" CssClass="btn btn-primary btn-flat form-control  " runat="server" Text="Procesar" />
                        <asp:Button ID="Button1" runat="server" Text="Calcular" />
                                    
                                </div>
                </div>
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
          <div class="col-md-8">
            <!-- Form Element sizes -->
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Reporte de Clases a Ejecutar</h3>
              </div>
              <div class="card-body">
                  <asp:Button ID="Button3" CssClass ="btn btn-primary  btn-flat form-control " runat="server" Text="Exportar a Excel" />
                  <asp:GridView ID="gv_calculado" CssClass="table table-hover mt-1 " runat="server" Font-Names="Consolas" Font-Size="9pt">
                      <HeaderStyle BackColor="#009900" ForeColor="White" />
                  </asp:GridView>
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


 <asp:TextBox ID="TextBox9"  runat="server" Visible="False"></asp:TextBox>
                                 <asp:TextBox ID="TextBox1"  runat="server" Visible="False"></asp:TextBox>
























    
       <asp:GridView ID="gv_grupo" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_grupo" Visible="False">
              <Columns>
                  <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                  <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                  <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                  <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                  <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
              </Columns>
          </asp:GridView>
                                <asp:GridView ID="gv_horario" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario" Visible="False">
                                    <Columns>
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Hras_academica" ReadOnly="True" SortExpression="Hras_academica" />
                                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                                        <asp:BoundField DataField="codcar" HeaderText="codcar" SortExpression="codcar" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.ci_doc ,iIf((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )='a a a','Sin Docente',(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ))as docente, sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 )AS Hras_academica,th.gestion  ,p.codcar,th.tipo_clase  ,th.dia,p.Materia ,th.grupo ,p.SiglaP 
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_personal tp on th.ci_doc = tp.ci 
inner join planes_estudios p on td.id_materia = p.id_plan 

where  th.sede=@sede  and p.codcar =@carrera and th.gestion ='2-2023' and tp.gestion='2-2023' 
group by th.ci_doc ,tp.nombres ,tp.primerApellido ,tp.segundoApellido   ,th.gestion  ,p.codcar ,th.tipo_clase   ,th.dia,p.Materia ,th.grupo ,p.SiglaP 
ORDER BY  docente,p.SiglaP
">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                    
                   <asp:GridView ID="gv_total" CssClass ="table table-hover mt-1 " runat="server" Font-Names="Consolas" Font-Size="9pt"  AutoGenerateColumns="False" Visible="False">
                      <HeaderStyle BackColor="#28A745" ForeColor="White" />
                      <Columns>
		  <asp:BoundField DataField="Docente" HeaderText="Docente" />
		  <asp:BoundField DataField="C.I." HeaderText="C.I." />
		  <asp:BoundField DataField="Carrera" HeaderText="Carrera" />
		  <asp:BoundField DataField="Horas Programadas" HeaderText="Horas Programadas" />
                          <asp:BoundField DataField="Horas para Ejecutar" HeaderText="Horas para Ejecutar" />
		  <asp:BoundField DataField="Dia" HeaderText="Dia" />
		  <asp:BoundField DataField="Materia" HeaderText="Materia" />
		  <asp:BoundField DataField="Sigla" HeaderText="Sigla" />
                          <asp:BoundField DataField="Tipo de Clase" HeaderText="Tipo de Clase" />
	</Columns>
                  </asp:GridView>
         
          <asp:SqlDataSource ID="sql_ds_grupo" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.ci_doc ,iIf((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )='a a a','Sin Docente',(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ))as docente  ,th.tipo_clase  ,p.Materia  ,p.SiglaP 
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_personal tp on th.ci_doc = tp.ci 
inner join planes_estudios p on td.id_materia = p.id_plan 

where  th.sede=@sede  and p.codcar =@carrera and th.gestion ='2-2023' and tp.gestion='2-2023' 
group by th.ci_doc ,tp.nombres ,tp.primerApellido ,tp.segundoApellido   ,th.gestion  ,p.codcar ,th.tipo_clase   ,p.Materia  ,p.SiglaP 
ORDER BY  docente,p.SiglaP
">
              <SelectParameters>
                  <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                  <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
              </SelectParameters>
          </asp:SqlDataSource>
         </form>
</asp:Content>


