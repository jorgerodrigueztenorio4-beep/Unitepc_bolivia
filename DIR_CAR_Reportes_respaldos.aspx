<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_Reportes_respaldos.aspx.vb" Inherits="DIR_CAR_Reportes_respaldos" MasterPageFile="mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server"  >
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

      <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    
        </div> 
    
 
     <asp:TextBox ID="txt_siglacar" runat="server" Visible="False"></asp:TextBox>
         <asp:TextBox ID="txt_sede"  Visible ="false"  runat="server"></asp:TextBox>
    <asp:TextBox ID="txt_idus"  Visible ="false"  runat="server"></asp:TextBox>
         <asp:TextBox ID="txt_id_cargo"  Visible ="false"  runat="server"></asp:TextBox>


          <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Reporte de Respaldos</h1>
          </div>
           <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
             
              <li class="breadcrumb-item active"><asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label></li>
            </ol>
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
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Datos</h3>

                
              </div>
              <div class="card-body">
                     <asp:DropDownList ID="ddl_docente" CssClass="form-control btn btn-default dropdown-toggle mt-1"  runat="server" DataSourceID="sql_ds_docente" DataTextField="docente" DataValueField="ci_doc" Font-Size="10pt">
                                   <asp:ListItem Value="0">Seleccione un Docente</asp:ListItem>
                                </asp:DropDownList>
                <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente ,ci_doc from tb_horario th
join tb_designacion td on th.id_horario = td.id_horario
join planes_estudios p on td.id_materia = p.id_plan 
join tb_personal tp on th.ci_doc = tp.ci 
where th.sede =@sede and p.codcar =@sigcar and th.gestion='2-2025' and tp.gestion='2-2025' group by nombres ,primerApellido,segundoApellido,ci_doc order by docente">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_siglacar" Name="sigcar" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                
                                <asp:TextBox ID="txt_fini" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txt_ffin" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" CssClass =" form-control  btn btn-primary mt-1 " runat="server" Text="Buscar clases" />
                                 <asp:Button ID="Button2" CssClass =" form-control  btn-info mt-1 " runat="server" Text="Extraer Reporte" />
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
            <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Resultado</h3>

               
              </div>
              <div class="card-body">
                 <asp:GridView ID="GridView1" runat="server" CssClass ="table table-hover " AutoGenerateColumns="False" DataSourceID="sql_ds_horas" Font-Size="8pt" ShowFooter="True" Font-Names="Consolas" GridLines="None" DataKeyNames="ci_doc">
                     <Columns>
                         <asp:BoundField DataField="ci_doc" HeaderText="Nro. de C.I." SortExpression="ci_doc" />
                         <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                         <asp:BoundField DataField="tema_avance" HeaderText="Tema Avance" SortExpression="tema_avance" />
                         <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" Visible ="false"  />
                         <asp:BoundField DataField="cant_est" HeaderText="Cant. de Est." SortExpression="cant_est" />
                         <asp:BoundField DataField="hr_ingreso" HeaderText="Hra.de Ingreso" SortExpression="hr_ingreso" />
                         <asp:BoundField DataField="hr_salida" HeaderText="Hra.de Salida" SortExpression="hr_salida" />
                         <asp:BoundField DataField="Horas_ejecutas" HeaderText="Horas Ejecutas" ReadOnly="True" SortExpression="Horas_ejecutas" />
                         <asp:BoundField DataField="Hras_programadas" HeaderText="Hras. Programadas" ReadOnly="True" SortExpression="Hras_programadas" />
                         <asp:BoundField DataField="hra_inicio" HeaderText="Hra.de Inicio" SortExpression="hra_inicio" />
                         <asp:BoundField DataField="hra_fin" HeaderText="Hra.de Fin" SortExpression="hra_fin" />
                         <asp:BoundField DataField="observaciones" HeaderText="Observaciones" SortExpression="observaciones" />
                                <asp:TemplateField HeaderText="Acciones">
    <ItemTemplate>
        <button type="button" class="btn btn-primary btn-sm"
            onclick='abrirModal("<%# Eval("ci_doc") %>")'>
            Ver
        </button>
    </ItemTemplate>
</asp:TemplateField>


                         <asp:CommandField ShowSelectButton="True" />
                                


                     </Columns>
                              <HeaderStyle BackColor="#6A03F5" Font-Size="9pt" ForeColor="White" />
                              </asp:GridView>
                              <asp:SqlDataSource ID="sql_ds_horas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="Select ti.ci_doc ,ti.Materia ,ti.tema_avance ,ti.carrera ,cant_est ,hr_ingreso ,hr_salida ,convert(integer,round((((convert(decimal,datediff (SS,TI.hr_ingreso   ,TI.hr_salida ))/60)/45)),0)) AS Horas_ejecutas,isnull(DATEDIFF(SS, ti.hra_inicio ,ti.hra_fin) / 60 / 45,'0') AS Hras_programadas,ti.hra_inicio ,ti.hra_fin ,ti.observaciones 
FROM tb_ing_sal ti
where TI.ci_doc =@ci and TI.carrera =@carrera and ti.sede =@sede and  TI.hr_ingreso BETWEEN @fechaini and (@fecha_fin+1)  and gestion ='2-2025'
order by TI.id_ing_sal ,ti.hr_ingreso">
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="ddl_docente" Name="ci" PropertyName="SelectedValue" />
                                      <asp:ControlParameter Name="carrera" ControlID="txt_siglacar" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_fini" Name="fechaini" PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="txt_ffin" Name="fecha_fin" PropertyName="Text" Type="DateTime" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
   
           
   
                              <asp:TextBox ID="txt_sumas" runat="server" Visible="False"></asp:TextBox>
  

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

           <!-- Modal -->

     


    </section>
         <!-- Aquí es el modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Large modal</button>

<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <asp:Label ID="lblCiDoc" runat="server" Text="" ClientIDMode="Static"></asp:Label>
    </div>
  </div>
</div>
                
            
<script>
    function abrirModal(ciDoc) {
        document.getElementById("lblCiDoc").innerText = ciDoc;
        $('#miModal').modal('show');
    }
</script>


        </form>
     </asp:Content>



