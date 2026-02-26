<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_horas_por_dia.aspx.vb" Inherits="RR_HH_horas_por_dia" MasterPageFile="mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
       <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Programar Horario
                            </div>
                                  <div class="input-group mb-1">
                                     <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True" AppendDataBoundItems="True">
                                         <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                     </asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                     <asp:DropDownList ID="ddl_bloque"  CssClass="form-control btn btn-default dropdown-toggle mt-1"  runat="server" AutoPostBack="True" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques] WHERE ([id_sede] = @id_sede)">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="ddl_sede" Name="id_sede" PropertyName="SelectedValue" Type="Int32" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>
                                      <asp:DropDownList ID="ddl_ambiente" runat="server" DataSourceID="sql_ambiente" DataTextField="nombre" CssClass="form-control btn btn-default dropdown-toggle mt-1"  DataValueField="id_ambiente" AppendDataBoundItems="True" AutoPostBack="True">
                                          <asp:ListItem Value="0">Seleccione Ambiente</asp:ListItem>
                                      </asp:DropDownList>
                                      <asp:SqlDataSource ID="sql_ambiente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_ambiente]"></asp:SqlDataSource>
                                      </div>
                                <asp:GridView ID="gv_horas" runat="server" AutoGenerateColumns="False" DataSourceID="sql_programacion">
                                    <Columns>
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" ReadOnly="True" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="Hora_fin" HeaderText="Hora_fin" ReadOnly="True" SortExpression="Hora_fin" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_programacion" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select h.dia, min(h.hora_inicio) as hora_inicio ,max(h.hora_fin ) as Hora_fin  
from tb_horario h
join tb_aula a on h.aula = a.id_nomal 
join tb_ambiente am on a.tipo_ambiente = am.id_ambiente 
where h.gestion ='2-2022'   and h.sede =@sede and h.bloque =@bloque and am.id_ambiente =@ambi
group by  h.dia
ORDER BY CASE WHEN h.dia = 'Lunes' THEN 1 WHEN h.dia='Martes' THEN 2 WHEN h.dia='Miercoles' THEN 3 WHEN h.dia='Jueves' THEN 4 WHEN h.dia='Viernes' THEN 5  WHEN h.dia='Sabado' THEN 6  END
">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_ambiente" Name="ambi" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
            </div>
         </div>
           </form>

</asp:Content>


