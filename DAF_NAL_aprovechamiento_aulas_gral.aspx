<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_NAL_aprovechamiento_aulas_gral.aspx.vb" Inherits="DAF_NAL_aprovechamiento_aulas_gral" MasterPageFile="~/mp_daf_nacional.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- jquery validation -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Quick Example <small>jQuery Validation</small></h3>
              </div>
           

              <form id="quickForm" runat="server">
                <div class="card-body">
                
    
            <asp:DropDownList ID="ddl_sede" CssClass ="form-control " runat="server" DataSourceID="sql_ds_sedes" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True"></asp:DropDownList>
            <asp:SqlDataSource ID="sql_ds_sedes" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
            <asp:Button ID="Button1"  CssClass ="btn btn-primary mt-2 " runat="server" Text="Ver Aprovechamiento" />
                    <asp:Button ID="Button2"  CssClass ="btn btn-success  mt-2 " runat="server" Text="Exportar a Excel" />
            <asp:SqlDataSource ID="sql_ds_aulas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" ProviderName="<%$ ConnectionStrings:unitepc_boliviaConnectionString.ProviderName %>" SelectCommand="select id_nomal,nom_aula_lab,count(nom_aula_lab ) as cant_clases,ta.capacidad ,tb.nom_bloque   from tb_horario th
join tb_aula ta on th.aula = ta.id_nomal 
join tb_bloques tb on th.bloque = tb.id_bloque 
where th.sede=@sede and th.gestion ='1-2026' and ta.gestion ='1-2024'
group by nom_aula_lab,id_nomal,capacidad ,tb.nom_bloque 
order by nom_aula_lab">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
                    <asp:Button ID="Button3" runat="server" Text="Button" />
                    <asp:TextBox ID="txt_vacio" runat="server"></asp:TextBox>
            <asp:GridView ID="gv_resultados" CssClass ="table table-hover m-1 " runat="server" Font-Names="Consolas" Font-Size="10pt" GridLines="None">
                <HeaderStyle BackColor="#7900F2" ForeColor="White" />
                    </asp:GridView>
            <asp:TextBox ID="txt_id_aula" runat="server" Visible="False"></asp:TextBox>
              <asp:SqlDataSource ID="sql_detalle" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select  sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45) AS Hras_academica,th.dia , tp.cantidad,(convert(varchar(50),(((sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45))*100)/tp.cantidad))) as porcien
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_aula a on th.aula = a.id_nomal 
join tb_cant_prediodos tp on th.sede = tp.sede
where a.id_nomal =@aula and tp.sede=@sede and th.gestion ='1-2026'  and a.gestion ='1-2024' and td.horas &lt;&gt;'0'
group by th.dia ,tp.cantidad
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END 

">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_id_aula" Name="aula" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                              </asp:SqlDataSource>

              <asp:SqlDataSource ID="sql_manana" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select  sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45) AS Hras_academica,th.dia , tp.cantidad,(convert(varchar(50),(((sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45))*100)/'8'))) as porcien,a.nom_aula_lab 
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_aula a on th.aula = a.id_nomal 
join tb_cant_prediodos tp on th.sede = tp.sede
where a.id_nomal =@aula and tp.sede=@sede and th.gestion ='1-2026'  and a.gestion ='1-2024' and th.hora_inicio &gt;='06:45' and th.hora_fin &lt;='12:45'  and td.horas &lt;&gt;'0'
group by th.dia ,tp.cantidad,a.nom_aula_lab 
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END 

">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_id_aula" Name="aula" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                              </asp:SqlDataSource>

              <asp:SqlDataSource ID="sql_tarde" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select  sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45) AS Hras_academica,th.dia , tp.cantidad ,(convert(varchar(50),(((sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45))*100)/'8'))) as porcien
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_aula a on th.aula = a.id_nomal 
join tb_cant_prediodos tp on th.sede = tp.sede
where a.id_nomal =@aula and tp.sede=@sede and th.gestion ='1-2026'  and a.gestion ='1-2024'  and th.hora_inicio &gt;='12:45' and th.hora_fin &lt;='18:45' and td.horas &lt;&gt;'0'
group by th.dia ,tp.cantidad
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END 

">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_id_aula" Name="aula" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                              </asp:SqlDataSource>

              <asp:SqlDataSource ID="sql_noche" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select  sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45) AS Hras_academica,th.dia , tp.cantidad,(convert(varchar(50),(((sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45))*100)/'5'))) as porcien
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_aula a on th.aula = a.id_nomal 
join tb_cant_prediodos tp on th.sede = tp.sede
where a.id_nomal =@aula and tp.sede=@sede and th.gestion ='1-2026'  and a.gestion ='1-2024'  and th.hora_inicio &gt;='18:45' and th.hora_fin &lt;='22:00'  and td.horas &lt;&gt;'0'
group by th.dia ,tp.cantidad
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END 

">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_id_aula" Name="aula" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                              </asp:SqlDataSource>

                    <asp:SqlDataSource ID="sql_ds_dias" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_dias_semana]"></asp:SqlDataSource>

        </div>
  
               
                
                </div>
                <!-- /.card-body -->
              
              </form>
            </div>
            <!-- /.card -->
            </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-6">

          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>





</asp:Content>


