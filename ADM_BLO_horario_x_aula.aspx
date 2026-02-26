<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_BLO_horario_x_aula.aspx.vb" Inherits="ADM_BLO_horario_x_aula" MasterPageFile="~/mp_adm_blo.master" %>

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

                                

                                <asp:DropDownList ID="ddl_bloque" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AppendDataBoundItems="True" AutoPostBack="True">
                                    <asp:ListItem Value="0">Seleccione un Bloque</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques] where id_sede=@id_sede">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_idsde" Name="id_sede" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_aula" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" AutoPostBack="True" DataSourceID="sql_aula" DataTextField="nom_aula_lab" DataValueField="id_nomal">
                                  
                                </asp:DropDownList>
                                    <asp:SqlDataSource ID="sql_aula" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_aula] WHERE ([bloque] = @bloque) and gestion='2-2024'">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                    <asp:GridView ID="gv_horario"  runat="server" CssClass=" table table-striped table-hover  mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_horario" Font-Names="Consolas" Font-Size="10pt" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="nom_aula_lab" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="Docente" HeaderText="Docente" SortExpression="Docente" ReadOnly="True" />
                                        <asp:BoundField DataField="CARDES" HeaderText="CARDES" SortExpression="CARDES" />
                                    </Columns>
                                    <HeaderStyle BackColor="#C2E7BD" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_horario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT th.hora_inicio, th.hora_fin, p.Materia, th.grupo, ta.nom_aula_lab, REPLACE(tp.nombres + ' ' + tp.primerApellido + ' ' + tp.segundoApellido, 'a a a', ' &lt;&lt; SIN DOCENTE &gt;&gt;') AS Docente, tc.CARDES FROM tb_horario AS th INNER JOIN tb_designacion AS td ON th.id_horario = td.id_horario INNER JOIN planes_estudios AS p ON td.id_materia = p.id_plan INNER JOIN tb_personal AS tp ON th.ci_doc = tp.ci INNER JOIN tb_carreras AS tc ON p.codcar = tc.CARSIGLA INNER JOIN tb_aula AS ta ON th.aula = ta.id_nomal WHERE (th.gestion = '2-2024') AND (th.bloque = @bloque) AND (tp.gestion = '2-2024') AND (ta.gestion = '1-2024') AND (th.aula = @dia) ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia = 'Martes' THEN 2 WHEN th.dia = 'Miercoles' THEN 3 WHEN th.dia = 'Jueves' THEN 4 WHEN th.dia = 'Viernes' THEN 5 WHEN th.dia = 'Sabado' THEN 6 END, th.hora_inicio">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_aula" Name="dia" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_aux" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txt_idsde" runat="server" Visible="true"></asp:TextBox>
                            </div>
            </div>
         </div>




     </form>




</asp:Content>


