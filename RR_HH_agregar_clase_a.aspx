<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_agregar_clase_a.aspx.vb" Inherits="RR_HH_agregar_clase_a" MasterPageFile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
        <form id="form1" runat="server">
             <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Subir Clases</h1>
          </div>
        <%--  <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">ChartJS</li>
            </ol>
          </div>--%>
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
                <h3 class="card-title">Seleccionar los Sgtes. Datos para Subir Clases</h3>

                
              </div>
              <div class="card-body">
                    <asp:DropDownList ID="ddl_sede" CssClass ="form-control mt-1 " runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
                  <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                  <asp:DropDownList ID="ddl_carrera" CssClass ="form-control mt-1 " runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>
                  <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                  
               <asp:TextBox ID="txt_fecha" type="date" runat="server" CssClass ="form-control mt-1 " AutoPostBack="True"></asp:TextBox>
            <asp:Label ID="Label1" runat="server"  Visible="false"></asp:Label>
                  <asp:TextBox ID="txt_fecha_hora" runat="server" Visible="true" ></asp:TextBox>
           
                     <asp:TextBox ID="txt_idhr" runat="server" ></asp:TextBox>
                  <asp:GridView ID="gv_clases" 
    CssClass="table-hover table" 
    runat="server" 
    AutoGenerateColumns="False" 
    DataSourceID="sql_ds_clase" 
    Font-Names="Consolas" 
    Font-Size="8pt" 
    GridLines="None">

    <Columns>

        <asp:CommandField ShowSelectButton="True" 
            SelectText="Agregar" 
            ControlStyle-CssClass="btn btn-primary small" />

        <asp:BoundField DataField="id_horario" HeaderText="Id." ReadOnly="True" />

        <asp:TemplateField HeaderText="Docente">
            <ItemTemplate>
                <b>Docente: <%# Eval("docente") %></b><br />
                C.I. :<%# Eval("ci_doc") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" />

    
        <asp:TemplateField HeaderText="Horario">
            <ItemTemplate>
                <%# Eval("hora_inicio", "{0:HH:mm}") %> - 
                <%# Eval("hora_fin", "{0:HH:mm}") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="dia" HeaderText="Día" />
        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo" />

    
        <asp:TemplateField HeaderText="Materia">
            <ItemTemplate>
                <b><%# Eval("Materia") %></b> - 
                <%# Eval("SiglaP") %><br />
                Grupo: <%# Eval("grupo") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="gestion" HeaderText="Gestión" />

    </Columns>

    <HeaderStyle BackColor="Gray" ForeColor="White" />
</asp:GridView>



            <asp:SqlDataSource ID="sql_ds_clase" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT th.id_horario, th.ci_doc, REPLACE(tp.nombres + ' ' + tp.primerApellido + ' ' + tp.segundoApellido, 'a a a', '--* Sin Asignar Docente *--') AS docente, a.nom_aula_lab, th.hora_inicio, th.hora_fin, th.dia, th.tipo_clase, p.SiglaP, p.Materia, p.Sis_plan, ISNULL(td.comun, 'No es Comun') AS Expr1, th.grupo, th.gestion
 FROM tb_designacion AS td INNER JOIN tb_horario AS th ON td.id_horario = th.id_horario INNER JOIN tb_personal AS tp ON th.ci_doc = tp.ci INNER JOIN planes_estudios AS p ON td.id_materia = p.id_plan INNER JOIN tb_aula AS a ON th.aula = a.id_nomal WHERE (td.carrera = @siglacar) AND (th.gestion = '1-2026') AND (tp.gestion = '1-2026') AND (th.sede = @sede) AND (a.gestion = '1-2024') AND (th.dia = @dia)
 ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia = 'Martes' THEN 2 WHEN th.dia = 'Miercoles' THEN 3 WHEN th.dia = 'Jueves' THEN 4 WHEN th.dia = 'Viernes' THEN 5 WHEN th.dia = 'Sabado' THEN 6 END, th.hora_inicio" InsertCommand="insert into tb_ing_sal (ci_doc ,Materia ,carrera ,aula_o_lab ,id_horario ,sede ,sigla_materia ,tipo_clase ,hra_inicio ,hra_fin ,grupo ,dia ,gestion,horas,hora_registro,hr_ingreso ,hr_salida ,observaciones )
select  th.ci_doc  ,p.Materia ,tc.CARSIGLA  ,ta.nom_aula_lab,th.id_horario,th.sede ,p.SiglaP,th.tipo_clase ,th.hora_inicio ,th.hora_fin,th.grupo ,th.dia ,th.gestion ,td.horas,getdate(),@hrain,@hrafin,'No Asistio a Clases'
from tb_designacion td
join tb_horario th on td.id_horario = th.id_horario 
join tb_aula ta on th.aula = ta.id_nomal
join tb_personal tp on th.ci_doc = tp.ci 
join planes_estudios p on td.id_materia = p.id_plan
join tb_carreras tc on p.codcar = tc.CARSIGLA
where   th.gestion ='1-2026'  and td.horas &lt;&gt;'0'    and tp.gestion ='1-2026'  and ta.gestion ='1-2024' and th.id_horario =@idhora">

                <InsertParameters>
                    <asp:ControlParameter ControlID="txt_fecha_hora" Name="hrain" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="txt_fecha_hora" Name="hrafin" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="txt_idhr" Name="idhora" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="dia" PropertyName="Text" />
                    <asp:ControlParameter Name="siglacar" ControlID="ddl_carrera" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
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
        <div>
           
        </div>
             
                
                  <asp:TextBox ID="txt_sigla_carrera" runat="server" Visible ="false" ></asp:TextBox>
                  <asp:TextBox ID="txt_id_sede" runat="server" Visible ="false" ></asp:TextBox>
    </form>
</asp:Content>


