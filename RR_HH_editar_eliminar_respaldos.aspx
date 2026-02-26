<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_editar_eliminar_respaldos.aspx.vb" Inherits="RR_HH_editar_eliminar_respaldos" MasterPageFile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
      <form runat ="server" >

         <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-4">
            <h1>Eliminar Respaldos</h1>
          </div>
          <div class="col-sm-4">
            <ol class="breadcrumb float-sm-right">
              
              <li class="breadcrumb-item active">
                  <asp:Label ID="lbl_cargo" runat="server" Text="Label"></asp:Label></li>
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
                <h3 class="card-title">Seleccione Sede,Carrera,Docente y Fechas para Buscar el Respaldo a Eliminar
                </h3>

                
              </div>
              <div class="card-body">
                  <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True" AutoPostBack="True">
                      <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                  </asp:DropDownList>
                  <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
             <asp:DropDownList ID="ddl_carrera" runat="server" CssClass="form-control btn btn-default dropdown-toggle mt-1"  AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA">
                                    <asp:ListItem Value="0">Seleccione una Carrera</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras] order by cardes"></asp:SqlDataSource>
                               <asp:DropDownList ID="ddl_docente" CssClass="form-control btn btn-default dropdown-toggle mt-1"  runat="server" DataSourceID="sql_ds_docente" DataTextField="docente" DataValueField="ci_doc" Font-Size="10pt">
                                   <asp:ListItem Value="0">Seleccione un Docente</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente ,ci_doc from tb_horario th
join tb_designacion td on th.id_horario = td.id_horario
join planes_estudios p on td.id_materia = p.id_plan 
join tb_personal tp on th.ci_doc = tp.ci 
where th.sede =@sede and p.codcar =@sigcar   and th.gestion ='2-2025' and tp.gestion ='2-2025'    group by nombres ,primerApellido,segundoApellido,ci_doc order by docente">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="sigcar" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                  <div class="input-group mb-1">
                   <asp:TextBox ID="txt_fini" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txt_ffin" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                      </div>
                                <asp:Button ID="Button1" CssClass =" form-control  btn btn-primary mt-1 " runat="server" Text="Buscar clases" />


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
                <h3 class="card-title">Lista de Respaldos en Base a la Fecha y Docente</h3>

               
              </div>
              <div class="card-body">
                    
                    <div class="row">
                        <asp:GridView ID="GridView1" runat="server" CssClass ="table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_horas" Font-Size="10pt" ShowFooter="True" Font-Names="Consolas" GridLines="None" DataKeyNames="id_ing_sal">
                     <Columns>
                         <asp:CommandField ButtonType="Button" ControlStyle-CssClass ="btn  btn-flat btn-danger  btn-sm " SelectText="Eliminar11" ShowDeleteButton="True" >
<ControlStyle CssClass="btn  btn-flat btn-danger  btn-sm "></ControlStyle>
                         </asp:CommandField>
                         <asp:BoundField DataField="id_ing_sal" HeaderText="Id." SortExpression="id_ing_sal" InsertVisible="False" ReadOnly="True" />
                         <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                         <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                         <asp:BoundField DataField="tema_avance" HeaderText="Tema de Avance" SortExpression="tema_avance" />
                         <asp:BoundField DataField="carrera" HeaderText="Carrera" SortExpression="carrera" />
                         <asp:BoundField DataField="cant_est" HeaderText="Cant. de Est." SortExpression="cant_est" />
                         <asp:BoundField DataField="hr_ingreso" HeaderText="Hra. de Ingreso" SortExpression="hr_ingreso" />
                         <asp:BoundField DataField="hr_salida" HeaderText="Hra. de Salida" SortExpression="hr_salida" />
                         <asp:BoundField DataField="Horas_ejecutas" HeaderText="Horas Ejecutas" ReadOnly="True" SortExpression="Horas_ejecutas" />
                         <asp:BoundField DataField="Hras_programadas" HeaderText="Hras Programadas" SortExpression="Hras_programadas" ReadOnly="True" />
                         <asp:BoundField DataField="hra_inicio" HeaderText="Hra de Inicio" SortExpression="hra_inicio" />
                         <asp:BoundField DataField="hra_fin" HeaderText="Hra de Fin" SortExpression="hra_fin" />
                         <asp:BoundField DataField="observaciones" HeaderText="Observaciones" SortExpression="observaciones" />
                     </Columns>
                              <HeaderStyle BackColor="#9966FF" ForeColor="White" />
                              </asp:GridView>
                            <asp:SqlDataSource ID="sql_ds_horas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT ti.id_ing_sal ,ci_doc, Materia, tema_avance, carrera, cant_est, hr_ingreso, hr_salida, CONVERT (integer, ROUND(CONVERT (decimal, DATEDIFF(SS, hr_ingreso, hr_salida)) / 60 / 45, 0)) AS Horas_ejecutas, ISNULL(DATEDIFF(SS, hra_inicio, hra_fin) / 60 / 45, '0') AS Hras_programadas, hra_inicio, hra_fin, observaciones FROM tb_ing_sal AS ti WHERE (ci_doc = @ci) AND (carrera = @carrera) AND (sede = @sede) AND (hr_ingreso BETWEEN @fechaini AND @fecha_fin + 1) AND (observaciones = 'con respaldo' or observaciones = 'con respaldo directo') ORDER BY id_ing_sal" InsertCommand="INSERT INTO tb_ajustes(ci_doc, fecha_ini, fecha_fin, carrera, ajuste, modificado_por, fecha_ajuste, sede, tipo_clase) VALUES (@cidoc, @feha_ini, @fecha_fin, @carrera, @ajuste, @modpor, GETDATE(), @sede, @tipoclase)" DeleteCommand="DELETE FROM tb_ing_sal WHERE (id_ing_sal = @id_ing_sal)">
                                  <DeleteParameters>
                                      <asp:ControlParameter ControlID="txt_id_ingsal" Name="id_ing_sal" PropertyName="Text" />
                                  </DeleteParameters>
                                  <InsertParameters>
                                      <asp:ControlParameter ControlID="ddl_docente" Name="cidoc" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_fini" Name="feha_ini" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_ffin" Name="fecha_fin" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_ajuste" Name="ajuste" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_idus" Name="modpor" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="ddl_tipo_clase" Name="tipoclase" PropertyName="SelectedValue" />
                                  </InsertParameters>
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="ddl_docente" Name="ci" PropertyName="SelectedValue" />
                                      <asp:ControlParameter Name="carrera" ControlID="ddl_carrera" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" Type="String" />
                                      <asp:ControlParameter ControlID="txt_fini" Name="fechaini" PropertyName="Text" Type="DateTime" />
                                      <asp:ControlParameter ControlID="txt_ffin" Name="fecha_fin" PropertyName="Text" Type="DateTime" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                        <asp:GridView ID="gv_respaldos" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_respaldos">
                            <Columns>
                                <asp:BoundField DataField="id_respaldo" HeaderText="id_respaldo" InsertVisible="False" ReadOnly="True" SortExpression="id_respaldo" />
                                <asp:BoundField DataField="respaldo" HeaderText="respaldo" SortExpression="respaldo" />
                                <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                <asp:BoundField DataField="id_ing_sal" HeaderText="id_ing_sal" SortExpression="id_ing_sal" />
                                <asp:BoundField DataField="fecha_clase" HeaderText="fecha_clase" SortExpression="fecha_clase" />
                                <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" />
                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource ID="sql_ds_respaldos" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_respaldos] WHERE ([id_ing_sal] = @id_ing_sal)" DeleteCommand="DELETE FROM tb_respaldos WHERE (id_ing_sal = @id_ing_sal)">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="txt_id_ingsal" Name="id_ing_sal" PropertyName="Text" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txt_id_ingsal" Name="id_ing_sal" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:TextBox ID="txt_id_ingsal" runat="server"></asp:TextBox>
   <asp:TextBox ID="txt_doc" runat="server" Visible="False"></asp:TextBox>

                    <div class="col-sm-6">
                      <div class="form-group">
                        <label></label>
                        <%--<input type="text" class="form-control" placeholder="Enter ..." disabled>--%>
                      </div>
                    </div>
                  </div>
                  

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
    </section>
    <!-- /.content -->
  </div>

    </form>
</asp:Content>


