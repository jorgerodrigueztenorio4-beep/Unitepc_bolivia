<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_LOCAL_horario_x_dia.aspx.vb" Inherits="DAF_LOCAL_horario_x_dia" MasterPageFile="~/mp_daf_local.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form id="form1" runat="server">
   
      <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-1">
          <div class="col-sm-12">
            <h1>Horarios por Bloque y Dia</h1>
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
              <div class="card-header">
                <h3 class="card-title">Datos</h3>

                
              </div>
              <div class="card-body">
                  <div class="input-group mb-1">
               <asp:DropDownList ID="ddl_bloque" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AutoPostBack="True"></asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques] WHERE ([id_sede] = @id_sede)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_idsde" PropertyName="Text" Name="id_sede" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_dia" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Seleccione un Dia</asp:ListItem>
                                    <asp:ListItem>Lunes</asp:ListItem>
                                    <asp:ListItem>Martes</asp:ListItem>
                                    <asp:ListItem>Miercoles</asp:ListItem>
                                    <asp:ListItem>Jueves</asp:ListItem>
                                    <asp:ListItem>Viernes</asp:ListItem>
                                    <asp:ListItem>Sabado</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="btn_reporte" CssClass ="btn btn-outline-success mt-1 " runat="server" Text="Extraer el Reporte en Formato Excel" />
                                <asp:Button ID="Button1" CssClass ="btn btn-outline-primary mt-1 " runat="server" Text="Extraer el Reporte en Formato PDF" />
                      </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- DONUT CHART -->
         
            <!-- /.card -->

            <!-- PIE CHART -->
        
            <!-- /.card -->
                <div class="card card-info">
              <div class="card-header">
                <h3 class="card-title">Horarios</h3>

               
              </div>
              <div class="card-body">
                   <asp:GridView ID="gv_horario"  runat="server" CssClass="table table-hover " AutoGenerateColumns="False" DataSourceID="sql_ds_horario" Font-Names="Consolas" Font-Size="10pt" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="ci_doc" HeaderText="Nro.de C.I." SortExpression="ci_doc" />
                                        <asp:BoundField DataField="Docente" HeaderText="Docente" SortExpression="Docente" ReadOnly="True" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="CARDES" HeaderText="Carrea" SortExpression="CARDES" />
                                        <asp:BoundField DataField="gestion" HeaderText="Gestion" SortExpression="gestion" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.ci_doc ,(tp.nombres +' '+ tp.primerApellido +' '+tp.segundoApellido ) as Docente,p.Materia ,th.hora_inicio ,th.hora_fin ,th.grupo,ta.nom_aula_lab,tc.CARDES,th.gestion     from tb_horario th
 join tb_designacion td on th.id_horario = td.id_horario 
join planes_estudios p on td.id_materia = p.id_plan
join tb_personal tp on th.ci_doc = tp.ci 
join tb_carreras tc on p.codcar =tc.CARSIGLA  
join tb_aula ta on th.aula = ta.id_nomal 
where  th.bloque =@bloque and th.dia =@dia  and tp.gestion ='1-2026' AND TA.gestion ='1-2024' and th.gestion ='1-2026'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END , hora_inicio ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_dia" Name="dia" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_idsde" runat="server" Visible="False"></asp:TextBox>
              </div>
              <!-- /.card-body -->
            </div>
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
     </form>

</asp:Content>


