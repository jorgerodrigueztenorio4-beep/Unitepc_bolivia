<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_contratos_x_docente.aspx.vb" Inherits="DIR_ACD_contratos_x_docente" MasterPageFile="~/mp_dir_academico.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                               Lista General de Docentes con Designacion por  Sede y Carrera
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
                                        <ItemStyle BackColor="#CCCC00" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Hras Acd.Calculado" SortExpression="Hras_academica" ReadOnly="True" >
                                        <ItemStyle BackColor="#33CCCC" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="horas" HeaderText="Horas semanales PE" SortExpression="horas" >
                                        <ItemStyle BackColor="#FF99CC" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" >
                                        <ItemStyle BackColor="#99FFCC" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="tipoContrato" HeaderText="tipoContrato" SortExpression="tipoContrato" >
                                        <ItemStyle BackColor="#FFFFCC" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_virtuales" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="Select ts.NombreSede ,tc.CARDES,tp.nombres ,(tp.primerApellido +' '+tp.segundoApellido ) as Apellidos,tp.ci ,tp.extension,tf.nit,tf.nroCuenta ,tp.direccion,tco.pago ,tc.CARSIGLA,p.Materia ,p.Sis_plan ,p.SiglaP ,th.grupo,th.hora_inicio ,th.hora_fin,DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica ,td.horas  ,th.tipo_clase ,tco.tipoContrato 
from tb_designacion td
left join tb_horario th on td.id_horario = th.id_horario 
left join tb_personal tp on  th.ci_doc = tp.ci 
left join tb_sedes ts on th.sede = ts.idSede 
left join planes_estudios p on td.id_materia = p.id_plan
left join tb_carreras tc on p.codcar = tc.CARSIGLA   
Left join tb_datos_financieros tf on tp.ci = tf.ci 
Left join tb_contratos tco on tp.ci = tco.ci 
where tp.ci =@ci
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



