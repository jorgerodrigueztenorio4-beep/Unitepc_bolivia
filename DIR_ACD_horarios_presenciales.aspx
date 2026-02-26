<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_horarios_presenciales.aspx.vb" Inherits="DIR_ACD_horarios_presenciales" MasterPageFile="~/mp_dir_academico.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                               Lista de Horarios Presenciales
                            </div>
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_carrera" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione una Carrera</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                <asp:GridView ID="gv_horarios_v" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_virtuales" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario"  />
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                              <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Hras_academica" SortExpression="Hras_academica" ReadOnly="True" />
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="link_clase" HeaderText="link_clase" SortExpression="link_clase" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="nom_aula_lab" SortExpression="nom_aula_lab" />
                                  
                                        <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP"  >
                                        <ItemStyle BackColor="#20C997" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" />
                                        <asp:BoundField DataField="tipoContrato" HeaderText="tipoContrato" SortExpression="tipoContrato">
                                        <ItemStyle BackColor="#ffc107" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="nit" HeaderText="nit" SortExpression="nit">
                                        <ItemStyle BackColor="#CCE5FF" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="nroCuenta" HeaderText="nroCuenta" SortExpression="nroCuenta">
                                        <ItemStyle BackColor="#FFF3CD" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_virtuales" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select th.id_horario ,th.ci_doc ,(tp.nombres+' '+tp.primerApellido +' '+tp.segundoApellido )as docente, th.hora_inicio ,th.hora_fin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica,th.dia,p.Materia,th.grupo,th.tipo_clase ,link_clase,a.nom_aula_lab ,p.SiglaP,p.Sis_plan,tc.tipoContrato ,tf.nit ,tf.nroCuenta 
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_personal tp on th.ci_doc = tp.ci 
inner join planes_estudios p on td.id_materia = p.id_plan 
inner join tb_aula a on th.aula = a.id_nomal 
join tb_contratos tc on th.ci_doc = tc.ci 
join tb_datos_financieros tf on th.ci_doc = tf.ci 
where th.tipo_clase ='presencial' and th.sede=@sede  and p.codcar =@car
ORDER BY CASE WHEN th.dia = 'Lunes' THEN 1 WHEN th.dia='Martes' THEN 2 WHEN th.dia='Miercoles' THEN 3 WHEN th.dia='Jueves' THEN 4 WHEN th.dia='Viernes' THEN 5  WHEN th.dia='Sabado' THEN 6  END
">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="car" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_cius" runat="server" Visible="False"></asp:TextBox>
                                </div>
            </div>
         </div>

    </form>
</asp:Content>



