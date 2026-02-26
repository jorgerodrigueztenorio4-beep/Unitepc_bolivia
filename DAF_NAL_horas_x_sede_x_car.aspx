<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_NAL_horas_x_sede_x_car.aspx.vb" Inherits="DAF_NAL_horas_x_sede_x_car" MasterPageFile="mp_daf_nacional.master" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
      <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
<h3>Lista de clases con total de horas ejecutadas</h3>
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border  rounded ">
                                                         
                                 <div class="input-group mb-1">
                                     <asp:DropDownList ID="ddl_sede"  CssClass="form-control mt-1 "  runat="server" AutoPostBack="True" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                     <asp:DropDownList ID="ddl_carrera"  CssClass="form-control   mt-1 "  runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                     <div class="input-group mb-1">
<asp:Label ID="Label1" runat="server" Text="Fecha de Inicio"></asp:Label>
                                     <asp:TextBox ID="txt_f_ini" CssClass ="form-control mt-1  " type="date" runat="server"></asp:TextBox>
                                     <asp:Label ID="Label2" runat="server" Text="Fecha de Fin"></asp:Label>
                                     <asp:TextBox ID="txt_f_fin" type="date" CssClass ="form-control mt-1  " runat="server"></asp:TextBox>
                                     </div>
                                     
                                     <asp:Button ID="Button1" runat="server" CssClass ="btn btn-primary form-control  mt-1   " Text="Buscar" />
                                 </div>
                                
                                <asp:GridView ID="gv_dcentes" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_docentes" Visible="False">
                                    <Columns>
                                        <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                    </Columns>
                                </asp:GridView>
                                <asp:GridView ID="gv_ingsal" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_ingsal" Visible="False">
                                    <Columns>
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="horas" HeaderText="horas" SortExpression="horas" ReadOnly="True" />
                                        <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                                    </Columns>
                                </asp:GridView>

                                <asp:SqlDataSource ID="sql_ds_ingsal" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select ci_doc ,isnull((sum((datediff (SS,hr_ingreso   ,hr_salida )/45)/45)),'0')  AS horas  ,carrera   from tb_ing_sal  where hr_ingreso BETWEEN @fi and (@ff+1)  and carrera =@car group by ci_doc ,carrera ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_f_ini" Name="fi" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="txt_f_fin" Name="ff" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="car" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <asp:SqlDataSource ID="sql_ds_docentes" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente ,ci_doc from tb_horario th
join tb_designacion td on th.id_horario = td.id_horario
join planes_estudios p on td.id_materia = p.id_plan 
join tb_personal tp on th.ci_doc = tp.ci 
where th.sede =@sede and p.codcar =@sigcar   and th.gestion ='2-2025' and tp.gestion ='2-2025'    group by nombres ,primerApellido,segundoApellido,ci_doc order by docente">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="sigcar" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </div>
            </div>
         </div>





           <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-6">
            <!-- general form elements -->
            <div class="">
              <div class="card-header">
                <h3 class="card-title">Docentes que Marcaron y los que no Marcaron</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
             
                <div class="card-body">
               
                     <asp:GridView ID="gv_total" CssClass ="table table-hover " runat="server" Font-Names="Consolas" Font-Size="9pt" GridLines="None">
                         <HeaderStyle BackColor="#009900" ForeColor="White" />
                     </asp:GridView>



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
            <div class="">
              <div class="card-header">
                <h3 class="card-title">Detalle</h3>
              </div>
              <div class="card-body">
             
                    <div class="container-fluid">
        <h5 class="mb-2">Informacion de Docentes que marcan y que no marcan por Sede y Carerra</h5>
        <div class="row">
       
          <!-- /.col -->
          <div class="col-md-4 col-sm-6 col-12">
            <div class="info-box">
              <span class="info-box-icon bg-success"><i class="fa fa-user-circle"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Docentes</span>
                <span class="info-box-number"> <asp:Label ID="lbl_totdoc" runat="server" Text=""></asp:Label></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-md-4 col-sm-6 col-12">
            <div class="info-box">
              <span class="info-box-icon bg-warning"><i class="fa fa-calendar-plus" aria-hidden="true"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Doc. que Marcan</span>
                <span class="info-box-number">                    <asp:Label ID="lblmarca" runat="server" Text=""></asp:Label></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-md-4 col-sm-6 col-12">
            <div class="info-box">
              <span class="info-box-icon bg-danger"><i class="fa fa-low-vision"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Doc.Sin Marcar</span>
                <span class="info-box-number">                    <asp:Label ID="lbl_sinm" runat="server" Text=""></asp:Label>    </span>
              </div>
             
            </div>
           
          </div>
         
        </div>
     
     

        
      </div>
          </div>
          
        </div>
      
      </div>
    </section>



          </form>
</asp:Content>

