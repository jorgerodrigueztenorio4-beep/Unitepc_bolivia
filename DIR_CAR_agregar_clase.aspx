<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_agregar_clase.aspx.vb" Inherits="DIR_CAR_agregar_clase" MasterPageFile="~/mp_dir_car.master" %>

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
                <h3 class="card-title">Clases</h3>

                
              </div>
              <div class="card-body">
                  <div class="control-group">
    
    <div class="controls">



          <div class="control-group">
    <label class="control-label" for="inputEmail">Seleccione una Fecha</label>
    <div class="controls">
        <asp:TextBox ID="txt_fecha" CssClass =" form-control mt-1  " type="date" runat="server" AutoPostBack="True"></asp:TextBox>
    </div>
  </div>

          <div class="control-group">
    <label class="control-label" for="inputEmail">Dia de la Fecha Seleccionada</label>
    <div class="controls">
        <asp:Label ID="Label1" CssClass ="control-label" runat="server"></asp:Label>
    </div>
  </div>



      
          </div>
  </div>
                 
               
            
            <asp:GridView ID="gv_clases" CssClass ="table-hover table mt-2 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_clase" Font-Names="Consolas" Font-Size="8pt" GridLines="None">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" SelectText="Agregar" ControlStyle-CssClass ="btn btn-primary " />
                    <asp:BoundField DataField="id_horario" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                    <asp:BoundField DataField="ci_doc" HeaderText="Nro.C.I." SortExpression="ci_doc" />
                    <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                    <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />
                    <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                    <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                    <asp:BoundField DataField="Hras_academica" HeaderText="Hras_academica" ReadOnly="True" SortExpression="Hras_academica" Visible ="false"  />
                    <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                    <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                    <asp:BoundField DataField="SiglaP" HeaderText="Sigla" SortExpression="SiglaP" />
                    <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                    <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" Visible ="false"  />
                    <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" Visible ="false"  />
                    <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                </Columns>
                <HeaderStyle BackColor="Gray" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="sql_ds_clase" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT th.id_horario, th.ci_doc, REPLACE(tp.nombres + ' ' + tp.primerApellido + ' ' + tp.segundoApellido, 'a a a', '--* Sin Asignar Docente *--') AS docente, a.nom_aula_lab, th.hora_inicio, th.hora_fin, DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica, th.dia, th.tipo_clase, p.SiglaP, p.Materia, p.Sis_plan, ISNULL(td.comun, 'No es Comun') AS Expr1, th.grupo FROM tb_designacion AS td INNER JOIN tb_horario AS th ON td.id_horario = th.id_horario INNER JOIN tb_personal AS tp ON th.ci_doc = tp.ci INNER JOIN planes_estudios AS p ON td.id_materia = p.id_plan INNER JOIN tb_aula AS a ON th.aula = a.id_nomal WHERE (td.carrera = @siglacar) AND (th.gestion = '2-2024') AND (tp.gestion = '2-2024') AND (th.sede = @sede) AND (a.gestion = '1-2024') AND (th.dia = @dia) ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia = 'Martes' THEN 2 WHEN th.dia = 'Miercoles' THEN 3 WHEN th.dia = 'Jueves' THEN 4 WHEN th.dia = 'Viernes' THEN 5 WHEN th.dia = 'Sabado' THEN 6 END, th.hora_inicio" InsertCommand="insert into tb_ing_sal (ci_doc ,Materia ,carrera ,aula_o_lab ,id_horario ,sede ,sigla_materia ,tipo_clase ,hra_inicio ,hra_fin ,grupo ,dia ,gestion,horas,hora_registro,hr_ingreso ,hr_salida ,observaciones )
select  th.ci_doc  ,p.Materia ,tc.CARSIGLA  ,ta.nom_aula_lab,th.id_horario,th.sede ,p.SiglaP,th.tipo_clase ,th.hora_inicio ,th.hora_fin,th.grupo ,th.dia ,th.gestion ,td.horas,getdate(),@hrain,@hrafin,'No Asistio a Clases'
from tb_designacion td
join tb_horario th on td.id_horario = th.id_horario 
join tb_aula ta on th.aula = ta.id_nomal
join tb_personal tp on th.ci_doc = tp.ci 
join planes_estudios p on td.id_materia = p.id_plan
join tb_carreras tc on p.codcar = tc.CARSIGLA
where   th.gestion ='2-2024'  and td.horas &lt;&gt;'0'    and tp.gestion ='2-2024'  and ta.gestion ='1-2024' and th.id_horario =@idhora">

                <InsertParameters>
                    <asp:ControlParameter ControlID="txt_fecha_hora" Name="hrain" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="txt_fecha_hora" Name="hrafin" PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="txt_idhr" Name="idhora" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="Label1" Name="dia" PropertyName="Text" />
                    <asp:ControlParameter Name="siglacar" ControlID="txt_sigla_carrera" PropertyName="Text" />
                    <asp:ControlParameter ControlID="txt_id_sede" Name="sede" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
              </div>
        
            </div>
      
                  <asp:TextBox ID="txt_fecha_hora" runat="server" Visible="False"></asp:TextBox>
                   <asp:TextBox ID="txt_idhr" runat="server" Visible="False"></asp:TextBox>
                  <asp:TextBox ID="txt_sigla_carrera" runat="server" Visible="False"></asp:TextBox>
                  <asp:TextBox ID="txt_id_sede" runat="server" Visible="False"></asp:TextBox>
          </div>
          <!-- /.col (LEFT) -->
          
           
            </div>
                    </div>
        
        </div>
     
      </div>
    </section>
  
  </div>
        <div>
           
        </div>
    </form>
</asp:Content>


