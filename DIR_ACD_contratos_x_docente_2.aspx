<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_contratos_x_docente_2.aspx.vb" Inherits="DIR_ACD_contratos_x_docente" MasterPageFile="~/mp_dir_academico.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                               Lista de Datos Generales por Docente 
                            </div>

                                  <asp:DropDownList ID="ddl_docente" runat="server" CssClass="form-control btn btn-outline-info dropdown-toggle mt-1" DataSourceID="sql_docente" DataTextField="docente" DataValueField="ci" AutoPostBack="True"></asp:DropDownList>


                                     <asp:SqlDataSource ID="sql_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT nombres + ' ' + primerApellido + ' ' + segundoApellido AS docente, ci FROM tb_personal order by docente"></asp:SqlDataSource>


                            <asp:GridView ID="gv_horarios_v" CssClass=" table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_virtuales" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="NombreSede" HeaderText="NombreSede" SortExpression="NombreSede"  />
                                        <asp:BoundField DataField="CARDES" HeaderText="CARDES" SortExpression="CARDES" />
                                        <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                                              <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" ReadOnly="True" />
                                        <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" />
                                        <asp:BoundField DataField="extension" HeaderText="extension" SortExpression="extension" />
                                        <asp:BoundField DataField="nit" HeaderText="nit" SortExpression="nit" />
                                        <asp:BoundField DataField="nroCuenta" HeaderText="nroCuenta" SortExpression="nroCuenta" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" >
                                        </asp:BoundField>
                                      
                                        <asp:BoundField DataField="pago" HeaderText="pago" SortExpression="pago" />
                                        <asp:BoundField DataField="CARSIGLA" HeaderText="CARSIGLA" SortExpression="CARSIGLA" />
                                  
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia"  />
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" />
                                        <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Hras_academica" SortExpression="Hras_academica" ReadOnly="True" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="carga_mensual" HeaderText="carga_mensual" SortExpression="carga_mensual" ReadOnly="True" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" >
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tipoContrato" HeaderText="tipoContrato" SortExpression="tipoContrato" />
                                        <asp:BoundField DataField="banco" HeaderText="banco" SortExpression="banco" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_virtuales" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="Select ts.NombreSede ,tc.CARDES,tp.nombres ,(tp.primerApellido +' '+tp.segundoApellido ) as Apellidos,tp.ci ,tp.extension,tf.nit,tf.nroCuenta ,tp.direccion,tco.pago ,tc.CARSIGLA,p.Materia ,p.Sis_plan ,p.SiglaP ,th.grupo,th.dia,th.hora_inicio ,th.hora_fin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica ,((DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45) * 20) as carga_mensual  ,th.tipo_clase ,tco.tipoContrato ,TF.banco 
from tb_designacion td
left join tb_horario th on td.id_horario = th.id_horario 
left join tb_personal tp on  th.ci_doc = tp.ci 
left join tb_sedes ts on th.sede = ts.idSede 
left join planes_estudios p on td.id_materia = p.id_plan
left join tb_carreras tc on p.codcar = tc.CARSIGLA   
Left join tb_datos_financieros tf on tp.ci = tf.ci 
Left join tb_contratos tco on tp.ci = tco.ci 
where th.gestion = '2-2022' and tp.gestion ='2-2022' and tf.gestion ='2-2022' and tp.ci =@ci
order by SiglaP">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_docente" Name="ci" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                               
                                </div>
            </div>
         </div>

    </form>
</asp:Content>



