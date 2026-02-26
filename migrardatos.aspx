<%@ Page Language="VB" AutoEventWireup="false" CodeFile="migrardatos.aspx.vb" Inherits="migrardatos" MasterPageFile="~/mp_rr_hh.master" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form id="form1" runat="server">
     <section class="content">
      <div class="container-fluid">
          <asp:Button ID="Button1" runat="server" Text="Migrar" />
          <asp:TextBox ID="txt_id_horario" runat="server"></asp:TextBox>
          <asp:TextBox ID="txt_sede" runat="server"></asp:TextBox>
          <asp:TextBox ID="txt_gestion" runat="server"></asp:TextBox>
          <asp:TextBox ID="txt_tipo_clase" runat="server"></asp:TextBox>
          <asp:TextBox ID="txt_hrainicio" runat="server"></asp:TextBox>
          <asp:TextBox ID="txt_hrafin" runat="server"></asp:TextBox>
          <asp:TextBox ID="txt_cidoc" runat="server"></asp:TextBox>
          <asp:TextBox ID="txt_grupo" runat="server"></asp:TextBox>
          <asp:TextBox ID="txt_dia" runat="server"></asp:TextBox>
          <asp:TextBox ID="txt_bloque" runat="server"></asp:TextBox>
          <asp:TextBox ID="txt_aula" runat="server"></asp:TextBox>
          <asp:TextBox ID="txt_designado" runat="server"></asp:TextBox>
          
        <div class="row">
          <!-- left column -->
          <div class="col-md-8">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Horarios</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
               
                <div class="card-body">
                   
                    <asp:GridView ID="gv_registro" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ulrtimo">
                        <Columns>
                            <asp:BoundField DataField="Current_Identity" HeaderText="Current_Identity" ReadOnly="True" SortExpression="Current_Identity" />
                        </Columns>
                    </asp:GridView>

                    <asp:SqlDataSource ID="sql_ulrtimo" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="
SELECT IDENT_CURRENT ('tb_horario') AS Current_Identity;  
"></asp:SqlDataSource>

                    <asp:GridView ID="gv_horario" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horario" Font-Names="Consolas" Font-Size="8pt">
                        <Columns>
                            <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                            <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
                            <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                            <asp:BoundField DataField="nombre_clase" HeaderText="nombre_clase" SortExpression="nombre_clase" />
                            <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                            <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                            <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                            <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                            <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                            <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                            <asp:BoundField DataField="link_clase" HeaderText="link_clase" SortExpression="link_clase" />
                            <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
                            <asp:BoundField DataField="aula" HeaderText="aula" SortExpression="aula" />
                            <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" />
                            <asp:BoundField DataField="ci_usuario" HeaderText="ci_usuario" SortExpression="ci_usuario" />
                            <asp:BoundField DataField="designado" HeaderText="designado" SortExpression="designado" />
                            <asp:BoundField DataField="causa_suspension" HeaderText="causa_suspension" SortExpression="causa_suspension" />
                            <asp:BoundField DataField="fecha_reemplazo" HeaderText="fecha_reemplazo" SortExpression="fecha_reemplazo" />
                            <asp:BoundField DataField="estado_clase" HeaderText="estado_clase" SortExpression="estado_clase" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_horario] WHERE ([gestion] = @gestion)" InsertCommand="INSERT INTO tb_horario(sede, gestion, tipo_clase, hora_inicio, hora_fin, ci_doc, grupo, dia, bloque, aula, designado,fecha_registro,estado_clase) VALUES (@sede, '1-2026', @tipoclase, @hrainicio, @hrafin, '0', @grupo, @dia, @bloque, @aula, @designado,getdate(),'migradopara1-2026')" DeleteCommand="DELETE FROM tb_horario WHERE (id_horario = @id_horario)">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="txt_id_horario" Name="id_horario" PropertyName="Text" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_tipo_clase" Name="tipoclase" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_hrainicio" Name="hrainicio" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_hrafin" Name="hrafin" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_grupo" Name="grupo" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_dia" Name="dia" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_bloque" Name="bloque" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_designado" Name="designado" PropertyName="Text" />
                            <asp:ControlParameter ControlID="txt_aula" Name="aula" PropertyName="Text" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="2-2025" Name="gestion" Type="String" />
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
          <div class="col-md-4">
            <!-- Form Element sizes -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Designacion</h3>
              </div>
                <asp:TextBox ID="txt_id_designacion" runat="server"></asp:TextBox>
                <asp:TextBox ID="txt_id_horario_desig" runat="server"></asp:TextBox>
                <asp:TextBox ID="txt_idmateria" runat="server"></asp:TextBox>
                <asp:TextBox ID="txt_txt_idsede" runat="server"></asp:TextBox>
                <asp:TextBox ID="txt_planest" runat="server"></asp:TextBox>
                <asp:TextBox ID="txt_horas" runat="server"></asp:TextBox>
                <asp:TextBox ID="txt_comun" runat="server"></asp:TextBox>
                <asp:TextBox ID="txt_carrera" runat="server"></asp:TextBox>
                <asp:GridView ID="gv_designacion" runat="server" AutoGenerateColumns="False" DataSourceID="sql_designacion" Font-Names="Consolas" Font-Size="8pt">
                    <Columns>
                        <asp:BoundField DataField="id_designacion" HeaderText="id_designacion" InsertVisible="False" ReadOnly="True" SortExpression="id_designacion" />
                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" SortExpression="id_horario" />
                        <asp:BoundField DataField="id_materia" HeaderText="id_materia" SortExpression="id_materia" />
                        <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion" />
                        <asp:BoundField DataField="id_sede" HeaderText="id_sede" SortExpression="id_sede" />
                        <asp:BoundField DataField="plan_est" HeaderText="plan_est" SortExpression="plan_est" />
                        <asp:BoundField DataField="horas" HeaderText="horas" SortExpression="horas" />
                        <asp:BoundField DataField="comun" HeaderText="comun" SortExpression="comun" />
                        <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="sql_designacion" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_designacion, id_horario, id_materia, fecha_creacion, id_sede, plan_est, horas, comun, carrera FROM tb_designacion WHERE (id_horario = @idhorario)" InsertCommand="INSERT INTO tb_designacion(id_horario, id_materia, id_sede, plan_est, horas, comun, carrera,fecha_creacion) VALUES (@idhorario, @idmateria, @id_sede, @planest, @horas, @comun, @carrera,getdate())" DeleteCommand="DELETE FROM tb_designacion WHERE (id_horario = @idhorario)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="txt_id_horario" Name="idhorario" PropertyName="Text" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txt_id_horario_desig" Name="idhorario" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_idmateria" Name="idmateria" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_txt_idsede" Name="id_sede" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_planest" Name="planest" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_horas" Name="horas" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_comun" Name="comun" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_carrera" Name="carrera" PropertyName="Text" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txt_id_horario" Name="idhorario" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>

              <!-- /.card-body -->
            </div>
         
          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
            </form>
</asp:Content>

