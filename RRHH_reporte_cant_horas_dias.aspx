<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RRHH_reporte_cant_horas_dias.aspx.vb" Inherits="RRHH_reporte_cant_horas_dias" MasterPageFile="mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">

     <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-4">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Quick Example</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
             
                <div class="card-body">
                       
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
                    <asp:Button ID="Button1" runat="server" CssClass ="btn btn-flat btn-primary mt-1 " Text="calcular" />
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
                    
                                <div class="input-group mb-6">
                                   <div class="form-group">
                    <label for="exampleInputEmail1">Seleccione una Sede</label>
                    <div class="input-group">
                                        
                        <asp:DropDownList ID="ddl_sede" runat="server" DataSourceID="sql_ds_sede" CssClass ="form-control mt-1 " DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
                                       
                        <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                       
                        </div>
                  </div>
                                    <div class="form-group">
                    <label for="exampleInputEmail1">Seleccione una Carrera</label>
                                        <div class="input-group">
                                           <asp:DropDownList ID="ddl_carrera" runat="server" CssClass ="form-control mt-1 " AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA">
                                          
                                        </asp:DropDownList>
                                            <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                     
                                            </div>
                  </div>
                                </div>
                             
                              
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <div class="input-group mb-1">
                                    <asp:Button ID="Button2" CssClass="btn btn-success btn-flat form-control  " runat="server" Text="Registrar Nuevo Nivel" />
                                    
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
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Different Height</h3>
              </div>
              <div class="card-body">
                  <asp:GridView ID="gv_total" runat="server"></asp:GridView>
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


 <asp:TextBox ID="TextBox9"  runat="server"></asp:TextBox>
                                 <asp:TextBox ID="TextBox1"  runat="server"></asp:TextBox>


     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
       <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Horario
                            </div>
                                <asp:GridView ID="gv_horario" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Hras_academica" ReadOnly="True" SortExpression="Hras_academica" />
                                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                                        <asp:BoundField DataField="codcar" HeaderText="codcar" SortExpression="codcar" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.ci_doc ,iIf((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )='a a a','Sin Docente',(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ))as docente, sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 )AS Hras_academica,th.gestion  ,p.codcar 
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_personal tp on th.ci_doc = tp.ci 
inner join planes_estudios p on td.id_materia = p.id_plan 
where  th.sede=@sede  and p.codcar =@carrera and th.gestion ='2-2023' and tp.gestion='2-2023' 
group by th.ci_doc ,tp.nombres ,tp.primerApellido ,tp.segundoApellido   ,th.gestion  ,p.codcar   
ORDER BY  docente">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
                 <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Marcacion
                            </div>
                     <asp:GridView ID="gv_marcado" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_marcado">
                         <Columns>
                             <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                             <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                             <asp:BoundField DataField="horas" HeaderText="horas" ReadOnly="True" SortExpression="horas" />
                         </Columns>
                              </asp:GridView>
                              <asp:SqlDataSource ID="sql_ds_marcado" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="Select ti.ci_doc ,ti.carrera ,sum(((datediff (SS,TI.hr_ingreso   ,TI.hr_salida )/60)/45)) AS horas
FROM tb_ing_sal ti
where TI.carrera =@carrera and  TI.hr_ingreso BETWEEN @ffi and (@ffin )
group by ti.ci_doc ,ti.carrera
order by ti.ci_doc">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_fi" Name="ffi" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_ff" Name="ffin" PropertyName="Text" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                            </div>
            </div>
           </div>
         </form>
</asp:Content>


