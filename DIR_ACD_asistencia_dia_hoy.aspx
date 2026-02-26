<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_asistencia_dia_hoy.aspx.vb" Inherits="DIR_ACD_asistencia_dia_hoy" MasterPageFile="~/mp_dir_academico.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server"  >
   
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Listdo de Asistencia  a Clases</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Cerrar Sesion</a></li>
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
            <div class="card card-purple">
              <div class="card-header">
                <h3 class="card-title">Lista de todas las Clases del Dia Actual</h3>

                <div class="card-tools">
                    
                </div>
              </div>
              <div class="card-body">
               <div class="chart">
                    <div class="input-group mb-1">
                        <asp:DropDownList ID="ddl_sede" CssClass ="custom-select form-control-border"  runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
                        <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                        <asp:DropDownList ID="ddl_carrera" CssClass ="custom-select form-control-border"  runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>
                        <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                    </div>
                   <asp:GridView ID="gv_clases_todo" runat="server" CssClass ="table table-hover mt-1 " HeaderStyle-CssClass ="DataGridFixedHeader"  AutoGenerateColumns="False" DataSourceID="sql_ds_asistencia_hoy" Font-Size="9pt" Font-Names="Consolas" GridLines="None">
                       <Columns>
                           <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                           <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                           <asp:BoundField DataField="carrera" HeaderText="Carrera" SortExpression="carrera" />
                           <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                           <asp:BoundField DataField="sigla_materia" HeaderText="Sigla de la Materia" SortExpression="sigla_materia" >
                           <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                           </asp:BoundField>
                           <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                           <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                           <asp:BoundField DataField="hra_inicio" HeaderText="Hora de Inicio Programado" SortExpression="hra_inicio" />
                           <asp:BoundField DataField="hra_fin" HeaderText="Hora de Fin Programado" SortExpression="hra_fin" />
                           <asp:BoundField DataField="hr_ingreso" HeaderText="Hra.de Ingreso Ejecutado " SortExpression="hr_ingreso" />
                           <asp:BoundField DataField="hr_salida" HeaderText="Hra.de Salida Ejecutado" SortExpression="hr_salida" />
                           <asp:BoundField DataField="observaciones" HeaderText="Observaciones" SortExpression="observaciones" >
                           <ItemStyle Font-Bold="True" Font-Size="10pt" BackColor="#FEE0E2" />
                           </asp:BoundField>
                       </Columns>
                       <HeaderStyle HorizontalAlign="Center" />
                   </asp:GridView>
                  
                    
             
                 

                   <asp:SqlDataSource ID="sql_ds_asistencia_hoy" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select ci_doc ,(p.nombres +' '+p.primerApellido +' '+p.segundoApellido ) as docente,carrera ,Materia ,sigla_materia,grupo,tipo_clase ,hra_inicio,hra_fin ,hr_ingreso ,hr_salida ,isnull(observaciones ,'Clases en Curso o Por Cursar') as observaciones  from tb_ing_sal i
join tb_personal p on i.ci_doc = p.ci 
where p.gestion ='1-2025' and CONVERT(varchar,hora_registro,103) =CONVERT(varchar,getdate(),103) and sede =@sede and carrera =@carrera

and i.dia =(SELECT (CASE DATENAME(dw,getdate())
    when 'Lunes' then 'Lunes'
     when 'Martes' then 'Martes'
     when 'Miércoles' then 'Miercoles'
     when 'Jueves' then 'Jueves'
     when 'Viernes' then 'Viernes'
     when 'Sábado' then 'Sabado'
     when 'Domingo' then 'Domingo'
END))  
order by hra_inicio
">
                       <SelectParameters>
                           <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                           <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                  
                    
             
                   <asp:TextBox ID="txt_sigla_car" Visible ="false"  runat="server"></asp:TextBox>
                   <asp:TextBox ID="txt_sede" runat="server" Visible ="false" ></asp:TextBox>

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
          <div class="col-md-2">
            <!-- LINE CHART
            <div class="card card-teal">
              <div class="card-header">
                <h3 class="card-title">Lista de Cargos</h3>

            
              </div>
              <div class="card-body">

              </div>
             
            </div> -->
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
    <!-- /.content -->
  
        </form>




</asp:Content>


