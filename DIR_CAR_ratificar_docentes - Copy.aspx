<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_ratificar_docentes - Copy.aspx.vb" Inherits="DIR_CAR_ratificar_docentes" MasterPageFile="~/mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Lista de Docentes Activos de la Actual Gestión</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                    <asp:GridView ID="gv_docentes_actual" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_docentes_actual" GridLines="None" Font-Names="Consolas" Font-Size="10pt">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" ButtonType="Button" SelectText="Ratificar" ControlStyle-CssClass ="btn btn-primary " >
<ControlStyle CssClass="btn btn-primary "></ControlStyle>
                            </asp:CommandField>
                            <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                            <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                        </Columns>
                        <HeaderStyle BackColor="#9933FF" ForeColor="White" />
                    </asp:GridView>
                             
                                     <asp:SqlDataSource ID="sql_ds_docentes_actual" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select ci_doc,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente  from tb_horario th
join tb_designacion td on th.id_horario = td.id_horario
join planes_estudios p on td.id_materia = p.id_plan 
join tb_personal tp on th.ci_doc = tp.ci 
where th.sede =@sede and p.codcar =@carrera   and th.gestion ='1-2024' and tp.gestion ='1-2024'    group by nombres ,primerApellido,segundoApellido,ci_doc order by docente">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="txt_id_sede" Name="sede" PropertyName="Text" />
                                             <asp:ControlParameter ControlID="txt_sigla_carrera" Name="carrera" PropertyName="Text" />
                                         </SelectParameters>
                    </asp:SqlDataSource>
                             
                                     <div class="alert-warning mt-2 text-md-center  rounded " role="alert">
                                      <asp:Label ID="Label3" runat="server" Text="Informacion de la Materia a Ingresar" Visible="false" ></asp:Label>
                            </div> 
                           
                            

                    <div class="bg-warning disabled color-palette" style="font-family: Consolas; font-weight: bold; color: #000000"><span><asp:Label ID="Label1" runat="server" Text="Clase con Registro de ingreso pero sin registro de salida, debe registrar Su Salida para marcar otra vez un nuevo Ingreso" Visible="False" Font-Bold="True" Font-Size="14pt"></asp:Label></span></div>
                 
                 

                  </div>
                              
                
                <!-- /.card-body -->

           
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
          <div class="col-md-6">
            <!-- Form Element sizes -->
            <div class="card card-teal">
              <div class="card-header">
                <h3 class="card-title">Lista de Docentes Ratificados para la Siguiente Gestión</h3>
              </div>
              <div class="card-body">
                  <asp:GridView ID="gv_ratificados" CssClass ="table table-hover mt-1 "  runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_ratificados" Font-Names="Consolas" Font-Size="10pt" GridLines="None">
                      <Columns>
                          <asp:BoundField DataField="ci" HeaderText="C.I." SortExpression="ci" />
                          <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                          <asp:BoundField DataField="CARDES" HeaderText="Carrera" SortExpression="CARDES" />
                          <asp:BoundField DataField="NombreSede" HeaderText="Sede" SortExpression="NombreSede" />
                          <asp:BoundField DataField="gestion" HeaderText="Ratificacion para la Gestion" SortExpression="gestion" />
                      </Columns>
                  </asp:GridView>
                 






                  <asp:SqlDataSource ID="sql_ds_ratificados" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select p.ci ,(p.nombres+' '+p.primerApellido +' '+p.segundoApellido )as docente,c.CARDES ,s.NombreSede,r.gestion    from  tb_ratificados r
join tb_personal p on r.ci_doc= p.ci 
join tb_carreras c on r.carrera= c.CARSIGLA 
join tb_sedes s on r.sede = s.idSede 
where r.sede =@sede and r.carrera =@carrera   and r.gestion ='1-2024' and p.gestion ='1-2024'
order by docente" InsertCommand="INSERT INTO tb_ratificados(ci_doc, carrera, sede, gestion, registro) VALUES (@ci, @car, @sede, '1-2024', GETDATE())">
                      <InsertParameters>
                          <asp:ControlParameter ControlID="txt_ci_doc" Name="ci" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_sigla_carrera" Name="car" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_id_sede" Name="sede" PropertyName="Text" />
                      </InsertParameters>
                      <SelectParameters>
                          <asp:ControlParameter ControlID="txt_id_sede" Name="sede" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_sigla_carrera" Name="carrera" PropertyName="Text" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                 






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
        <asp:TextBox ID="txt_sigla_carrera" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="txt_ciusuario" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="txt_id_sede" runat="server" Visible="False"></asp:TextBox>
        <asp:TextBox ID="txt_ci_doc" runat="server" Visible="False"></asp:TextBox>
    </form>


</asp:Content>


