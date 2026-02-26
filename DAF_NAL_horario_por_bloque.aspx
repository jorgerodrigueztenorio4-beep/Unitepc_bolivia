<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_NAL_horario_por_bloque.aspx.vb" Inherits="DAF_NAL_horario_por_bloque" MasterPageFile="mp_daf_nacional.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form id="form1" runat="server">
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFD166" class="text-md-center  rounded text-bold " role="alert">
                               Seleccione el Bloque y el Dia
                            </div>

                                <div class="input-group mb-1">
                                    <asp:DropDownList ID="ddl_sede"  CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True" AutoPostBack="True">
                                        <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                    </asp:DropDownList>
                                

                                    <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                

                                <asp:DropDownList ID="ddl_bloque" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AutoPostBack="True" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione un Bloque</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques] where id_sede=@id_sede">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="id_sede" PropertyName="SelectedValue" />
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
                                </div>
                                    <asp:GridView ID="gv_horario"  runat="server" CssClass=" table table-striped table-hover  mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_horario">
                                    <Columns>
                                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="Hora de Fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Aula/Lab." SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="Docente" HeaderText="Docente" SortExpression="Docente" ReadOnly="True" />
                                        <asp:BoundField DataField="CARDES" HeaderText="Carrera" SortExpression="CARDES" />
                                    </Columns>
                                    <HeaderStyle BackColor="#C2E7BD" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.hora_inicio ,th.hora_fin ,p.Materia,th.grupo,ta.nom_aula_lab,replace((tp.nombres +' '+ tp.primerApellido +' '+tp.segundoApellido ),'a a a',' &lt;&lt; SIN DOCENTE &gt;&gt;') as Docente ,tc.CARDES
from tb_horario th
join tb_designacion td on th.id_horario = td.id_horario 
join planes_estudios p on td.id_materia = p.id_plan
join tb_personal tp on th.ci_doc = tp.ci 
join tb_carreras tc on p.codcar =tc.CARSIGLA  
join tb_aula ta on th.aula = ta.id_nomal
where th.gestion ='1-2024' and th.bloque =@bloque and th.dia =@dia and tp.gestion ='1-2024' and ta.gestion='1-2024'
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END , hora_inicio ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_dia" Name="dia" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_idsde" runat="server" Visible="False"></asp:TextBox>
                            </div>
            </div>
         </div>




     </form>




</asp:Content>


