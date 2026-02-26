<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_NAL_Aulas_des.aspx.vb" Inherits="DAF_NAL_Aulas_des" MasterPageFile="~/mp_daf_nacional.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                                <h5>Aulas por sede y bloque</h5>
                                         <div class="input-group mb-1">
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control   mt-1 " runat="server" AutoPostBack="True" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione un Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_bloque" CssClass="form-control   mt-1 " runat="server" AutoPostBack="True" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque"></asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques] WHERE ([id_sede] = @id_sede)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="id_sede" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                    </div>

                                <asp:GridView ID="gv_aulas" runat="server" CssClass="table table-hover mt-1" 
    DataSourceID="sql_ds_aulas" AutoGenerateColumns="False" 
    Font-Size="8pt" Font-Names="Consolas" GridLines="None">
    
    <Columns>

      
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="btnSeleccionar" runat="server" CommandName="Select" 
                    CssClass="btn btn-primary m-1" CausesValidation="False">
                    <i class="fa fa-low-vision"></i>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="id_nomal" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_nomal" />
        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />
        <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" Visible="false" />
        <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad" />
        <asp:BoundField DataField="dimenciones" HeaderText="dimenciones" SortExpression="dimenciones" Visible="false" />
        <asp:BoundField DataField="Sede" HeaderText="Sede" SortExpression="Sede" Visible="false" />
        <asp:BoundField DataField="ultima_actualizacion" HeaderText="ultima_actualizacion" SortExpression="ultima_actualizacion" Visible="false" />
        <asp:BoundField DataField="foto" HeaderText="foto" SortExpression="foto" Visible="false" />
        <asp:BoundField DataField="gestion" HeaderText="Gestion" SortExpression="gestion" />
        <asp:BoundField DataField="tipo_ambiente" HeaderText="tipo_ambiente" SortExpression="tipo_ambiente" Visible="false" />
        <asp:BoundField DataField="ubicacion_piso" HeaderText="ubicacion_piso" SortExpression="ubicacion_piso" Visible="false" />
        <asp:BoundField DataField="capacidad_bs" HeaderText="capacidad_bs" SortExpression="capacidad_bs" Visible="false" />
        <asp:BoundField DataField="estado_aula" HeaderText="estado_aula" SortExpression="estado_aula" Visible="false" />
        <asp:BoundField DataField="nro_pupitres" HeaderText="nro_pupitres" SortExpression="nro_pupitres" Visible="false" />
        <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" Visible="false" />

    </Columns>

    <HeaderStyle BackColor="#009900" ForeColor="White" />
    <SelectedRowStyle BackColor="#EBF9BF" />

</asp:GridView>


                            <%--    <asp:GridView ID="gv_aulas" runat="server" CssClass ="table table-hover mt-1 " DataSourceID="sql_ds_aulas" AutoGenerateColumns="False" Font-Size="8pt" Font-Names="Consolas" GridLines="None">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" ControlStyle-CssClass ="btn btn-primary m-1 " >
<ControlStyle CssClass="btn btn-primary m-1 " Font-Size="8pt"></ControlStyle>
                                        </asp:CommandField>
                                        <asp:BoundField DataField="id_nomal" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_nomal" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab"  />
                                        <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" Visible ="false"  />
                                        <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad" />
                                        <asp:BoundField DataField="dimenciones" HeaderText="dimenciones" SortExpression="dimenciones"  Visible ="false"  />
                                        <asp:BoundField DataField="Sede" HeaderText="Sede" SortExpression="Sede"  Visible ="false"  />
                                        <asp:BoundField DataField="ultima_actualizacion" HeaderText="ultima_actualizacion" SortExpression="ultima_actualizacion"  Visible ="false"  />
                                        <asp:BoundField DataField="foto" HeaderText="foto" SortExpression="foto"  Visible ="false"  />
                                        <asp:BoundField DataField="gestion" HeaderText="Gestion" SortExpression="gestion" />
                                        <asp:BoundField DataField="tipo_ambiente" HeaderText="tipo_ambiente" SortExpression="tipo_ambiente"  Visible ="false"  />
                                        <asp:BoundField DataField="ubicacion_piso" HeaderText="ubicacion_piso" SortExpression="ubicacion_piso"  Visible ="false"  />
                                        <asp:BoundField DataField="capacidad_bs" HeaderText="capacidad_bs" SortExpression="capacidad_bs"  Visible ="false"  />
                                        <asp:BoundField DataField="estado_aula" HeaderText="estado_aula" SortExpression="estado_aula"  Visible ="false"  />
                                        <asp:BoundField DataField="nro_pupitres" HeaderText="nro_pupitres" SortExpression="nro_pupitres"  Visible ="false"  />
                                        <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones"  Visible ="false"  />
                                    </Columns>
                                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                                    <SelectedRowStyle BackColor="#EBF9BF" />
                                </asp:GridView>--%>
                                <asp:SqlDataSource ID="sql_ds_aulas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select * from tb_aula 
where sede=@sede and bloque=@bloque and gestion ='1-2024'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_id_horario" runat="server" Visible="False"></asp:TextBox>
                                </div>
            <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                <h5> Aprovechamiento por dia del Aula</h5>
               

                        
                <asp:GridView ID="gv_detalle" runat="server" CssClass ="table table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_detalle" Font-Size="9pt" Font-Names="Consolas">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" SelectText="Detalle" ControlStyle-CssClass ="btn btn-primary mt-1 " >
<ControlStyle CssClass="btn btn-primary mt-1 "></ControlStyle>
                        </asp:CommandField>
                        <asp:BoundField DataField="Hras_academica" HeaderText="Periodos" ReadOnly="True" SortExpression="Hras_academica" >
                        <ItemStyle BackColor="#FFEEDD" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                        <asp:BoundField DataField="cantidad" HeaderText="Cantidad" SortExpression="cantidad" />
                        <asp:BoundField DataField="porcien" HeaderText="Porciento" SortExpression="Porcien" ReadOnly="True" >
                        <ItemStyle BackColor="#F7E8F9" Font-Bold="True" Font-Size="10pt" />
                        </asp:BoundField>
                    </Columns>
                              <HeaderStyle BackColor="#009900" ForeColor="White" />
                              <SelectedRowStyle BackColor="#EBF9BF" />
                              </asp:GridView>
                                <asp:SqlDataSource ID="sql_detalle" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select  sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45) AS Hras_academica,th.dia , tp.cantidad,(convert(varchar(50),(((sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45))*100)/tp.cantidad))+'/100') as porcien
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_aula a on th.aula = a.id_nomal 
join tb_cant_prediodos tp on th.sede = tp.sede
where a.id_nomal =@aula and tp.sede=@sede and tp.gestion='2-2025' and th.gestion ='2-2025'  and a.gestion ='1-2024'
group by th.dia ,tp.cantidad
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_id_horario" Name="aula" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                              </asp:SqlDataSource>
                <asp:TextBox ID="txt_dia" runat="server" Visible="False"></asp:TextBox>
                                </div>
            <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                                Detalle de clases del Aula Seleccionado
                            </div>
                <asp:GridView ID="gv_det_clases" runat="server" CssClass ="table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_detalle_clases" Font-Names="Consolas" Font-Size="9pt">
                    <Columns>
                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                        <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                        <asp:BoundField DataField="periodos" HeaderText="Periodos" ReadOnly="True" SortExpression="periodos" >
                        <ItemStyle BackColor="#E6F9F9" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                        <asp:BoundField DataField="gestion" HeaderText="Gestion" SortExpression="gestion" />
                    </Columns>
                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="sql_ds_detalle_clases" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select replace((tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido ),'a a a','--* Sin Asignar Docente *--')as docente, th.hora_inicio ,th.hora_fin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS periodos,th.dia,th.tipo_clase  ,p.Materia,th.grupo ,th.gestion 
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_personal tp on th.ci_doc = tp.ci 
inner join planes_estudios p on td.id_materia = p.id_plan 
where th.aula =@aula and th.dia =@dia  and tp.gestion ='2-2025'  and th.gestion ='2-2025'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END ,th.hora_inicio 

">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txt_id_horario" Name="aula" PropertyName="Text" />
                        <asp:ControlParameter ControlID="txt_dia" Name="dia" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </div>

            </div>
         </div>
         </form> 

</asp:Content>


