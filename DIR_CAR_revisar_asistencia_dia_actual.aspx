<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_revisar_asistencia_dia_actual.aspx.vb" Inherits="DIR_CAR_revisar_asistencia_dia_actual" MasterPageFile="mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Horarios Habilitados para el dia Actual</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                     
                             
                    <asp:GridView ID="GridView1" runat="server" CssClass ="table table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_dia_actual" Font-Names="Consolas" Font-Size="9pt" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="id_ing_sal" HeaderText="id_ing_sal" InsertVisible="False" ReadOnly="True"  Visible ="false"  SortExpression="id_ing_sal" />
                            <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                            <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso"  Visible ="false" />
                            <asp:BoundField DataField="hr_salida" HeaderText="hr_salida" SortExpression="hr_salida"  Visible ="false"  />
                            <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                            <asp:BoundField DataField="tema_avance" HeaderText="tema_avance" SortExpression="tema_avance"  Visible ="false" />
                            <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones"  Visible ="false" />
                            <asp:BoundField DataField="carrera" HeaderText="Carrera" SortExpression="carrera"  Visible ="false"  />
                            <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque"  Visible ="false"  />
                            <asp:BoundField DataField="aula_o_lab" HeaderText="Aula" SortExpression="aula_o_lab" />
                            <asp:BoundField DataField="id_horario" HeaderText="Id.Horario" SortExpression="id_horario" />
                            <asp:BoundField DataField="sede" HeaderText="Sede" SortExpression="sede"  Visible ="false"  />
                            <asp:BoundField DataField="sigla_materia" HeaderText="Sigla de la Materia" SortExpression="sigla_materia" />
                            <asp:BoundField DataField="cant_est" HeaderText="cant_est" SortExpression="cant_est"  Visible ="false" />
                            <asp:BoundField DataField="ip_marcado" HeaderText="ip_marcado" SortExpression="ip_marcado"  Visible ="false" />
                            <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                            <asp:BoundField DataField="hra_inicio" HeaderText="Hora de Inicio Programado" SortExpression="hra_inicio" />
                            <asp:BoundField DataField="hra_fin" HeaderText="Hora de Fin Programado" SortExpression="hra_fin" />
                            <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                            <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                            <asp:BoundField DataField="gestion" HeaderText="Gestion" SortExpression="gestion" />
                            <asp:BoundField DataField="horas" HeaderText="Horas" SortExpression="horas" />
                            <asp:BoundField DataField="hora_registro" HeaderText="hora_registro" SortExpression="hora_registro"  Visible ="false" />
                        </Columns>
                    </asp:GridView>

                   

                    <asp:SqlDataSource ID="sql_ds_dia_actual" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select * from tb_ing_sal 
where CONVERT(varchar,hora_registro,103) =CONVERT(varchar,getdate(),103) and carrera =@carrera and sede=@sede
order by hra_inicio 
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txt_sigla_car" Name="carrera" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                   

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
          
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
          
      </div><!-- /.container-fluid -->
    </section>
        <asp:TextBox ID="txt_sigla_car" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_sede" runat="server"></asp:TextBox>
    </form>
</asp:Content>


