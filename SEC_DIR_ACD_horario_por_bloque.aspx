<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SEC_DIR_ACD_horario_por_bloque.aspx.vb" Inherits="SEC_DIR_ACD_horario_por_bloque" MasterPageFile="~/mp_sec_dir_academico.master" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form id="form1" runat="server">
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Horarios por Bloque
                            </div>


                                 <div class="input-group mb-1">
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control  btn btn-outline-default border-dark mt-1 "  runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede">
                                    <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_bloque" CssClass="form-control  btn btn-outline-default border-dark mt-1 "  runat="server" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AutoPostBack="True">
                                </asp:DropDownList>

                                <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_bloque, nom_bloque, id_sede FROM tb_bloques WHERE (id_sede = @idsede)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="idsede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                     <asp:Button ID="Button1" CssClass =" btn btn-primary form-control  mt-1 " runat="server" Text="Exportar a Excel" />
                                     </div>
                                <asp:GridView ID="GridView1" runat="server" CssClass ="table table-hover  mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_horario" Font-Size="9pt" Font-Names="Consolas">
                                    <Columns>
                                        <asp:BoundField DataField="nombre" HeaderText="Docente" ReadOnly="True" SortExpression="nombre" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="CARDES" HeaderText="Carrera" SortExpression="CARDES" />
                                    </Columns>
                                    <HeaderStyle BackColor="#009900" Font-Bold="True" ForeColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (pe.nombres +' '+pe.primerApellido +' '+pe.segundoApellido ) as nombre,p.Materia,h.hora_inicio ,h.hora_fin ,h.grupo  ,h.dia,a.nom_aula_lab  ,c.CARDES   from tb_horario h
join tb_designacion d on d.id_horario = h.id_horario 
join planes_estudios p on d.id_materia = p.id_plan 
join tb_personal pe on h.ci_doc = pe.ci 
join tb_aula a on h.aula = a.id_nomal 
join tb_carreras c on p.codcar = c.CARSIGLA 
where h.gestion ='2-2022' and pe.gestion ='2-2022' and a.gestion ='2-2022' and h.sede =@sede and h.bloque =@bloque
ORDER BY CASE WHEN h.dia = 'Lunes' THEN 1 WHEN h.dia='Martes' THEN 2 WHEN h.dia='Miercoles' THEN 3 WHEN h.dia='Jueves' THEN 4 WHEN h.dia='Viernes' THEN 5  WHEN h.dia='Sabado' THEN 6  END,h.hora_inicio ,h.grupo">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
            </div>
         </div>

     </form>

</asp:Content>

