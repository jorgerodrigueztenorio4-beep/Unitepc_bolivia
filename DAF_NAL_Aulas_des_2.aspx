<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_NAL_Aulas_des_2.aspx.vb" Inherits="DAF_NAL_Aulas_des_2" MasterPageFile="~/mp_daf_nacional.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                                Aulas
                            </div>
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" AutoPostBack="True" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione un Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddl_bloque"  CssClass="form-control btn btn-default dropdown-toggle mt-1"  runat="server" AutoPostBack="True" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione un bloque</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques] WHERE ([id_sede] = @id_sede)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="id_sede" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:GridView ID="gv_aulas" runat="server" CssClass ="table table-hover mt-1 " DataSourceID="sql_ds_aulas" AutoGenerateColumns="False" Font-Size="9pt" Font-Names="Consolas">
                                    <Columns>
                                        <asp:CommandField ButtonType="Button" SelectText="Detalle" ShowSelectButton="True" ControlStyle-CssClass="btn btn-primary mt-1 " />
                                        <asp:BoundField DataField="id_nomal" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_nomal" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula o Lab." SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="cant_clases" HeaderText="Cantidad de Periodos" ReadOnly="True" SortExpression="cant_clases" />
                                        <asp:BoundField DataField="capacidad" HeaderText="Capacidad de Estudiantes en el Aula" SortExpression="capacidad" />
                                    </Columns>
                                    <HeaderStyle BackColor="#3C8E51" ForeColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_aulas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select id_nomal,nom_aula_lab,count(nom_aula_lab ) as cant_clases,ta.capacidad   from tb_horario th
join tb_aula ta on th.aula = ta.id_nomal 
where th.sede=@sede and th.bloque=@bloque and th.gestion ='1-2024' and ta.gestion ='1-2024'
group by nom_aula_lab,id_nomal,capacidad 
">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_id_horario" runat="server" Visible="False"></asp:TextBox>
                                </div>
            <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
              

                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                                Descripcion
                            </div>
                <asp:Label ID="lbl_sede" CssClass =" mt-1 form-control  " role="alert"  runat="server" Text=""></asp:Label>
 <asp:Label ID="lbl_bloque" CssClass ="mt-1 form-control "  runat="server" Text=""></asp:Label>
                <asp:Label ID="lbl_aula" CssClass ="mt-1 form-control  "  runat="server" Text=""></asp:Label>
                
               
                <asp:GridView ID="gv_detalle" runat="server" CssClass ="table table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_detalle" Font-Size="9pt" Font-Names="Consolas">
                    <Columns>
                        <asp:BoundField DataField="Hras_academica" HeaderText="Horas Academicas" ReadOnly="True" SortExpression="Hras_academica" />
                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                        <asp:BoundField DataField="cantidad" HeaderText="Cantidad de Periodos Instalados" SortExpression="cantidad" />
                        <asp:BoundField DataField="porcien" HeaderText="Aprovechamiento del Aula (%)" SortExpression="porcien" ReadOnly="True" />
                    </Columns>
                              <HeaderStyle BackColor="#3C8E51" ForeColor="White" />
                              </asp:GridView>
                                <asp:SqlDataSource ID="sql_detalle" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select  sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45) AS Hras_academica,th.dia , tp.cantidad,(convert(varchar(50),(((sum(DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45))*100)/tp.cantidad))+'/100') as porcien
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_aula a on th.aula = a.id_nomal 
join tb_cant_prediodos tp on th.sede = tp.sede
where a.id_nomal =@aula and tp.sede=@sede and th.gestion ='1-2024'  and a.gestion ='1-2024'
group by th.dia ,tp.cantidad
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END 

">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_id_horario" Name="aula" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                              </asp:SqlDataSource>
                                </div>
            </div>
         </div>
         </form> 

</asp:Content>


