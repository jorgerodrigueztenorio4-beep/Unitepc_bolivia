<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_Datos_docentes_ret.aspx.vb" Inherits="RR_HH_Datos_docentes_ret" MasterPageFile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
      <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white  rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                               Lista de Docentes Contrato de RETENCION
                            </div>
                                <asp:GridView ID="gv_fac" CssClass ="table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_fac" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="NombreSede" HeaderText="NombreSede" SortExpression="NombreSede" />
                                        <asp:BoundField DataField="CARDES" HeaderText="CARDES" SortExpression="CARDES" />
                                        <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                                        <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" ReadOnly="True" SortExpression="Apellidos" />
                                        <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" />
                                        <asp:BoundField DataField="extension" HeaderText="extension" SortExpression="extension" />
                                        <asp:BoundField DataField="nit" HeaderText="nit" SortExpression="nit" />
                                        <asp:BoundField DataField="nroCuenta" HeaderText="nroCuenta" SortExpression="nroCuenta" />
                                        <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" />
                                        <asp:BoundField DataField="pago" HeaderText="pago" SortExpression="pago" />
                                        <asp:BoundField DataField="CARSIGLA" HeaderText="CARSIGLA" SortExpression="CARSIGLA" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Sis_plan" SortExpression="Sis_plan" />
                                        <asp:BoundField DataField="SiglaP" HeaderText="SiglaP" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Hras_academica" ReadOnly="True" SortExpression="Hras_academica" />
                                        <asp:BoundField DataField="carga_mensual" HeaderText="carga_mensual" ReadOnly="True" SortExpression="carga_mensual" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_fac" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="Select ts.NombreSede ,tc.CARDES,tp.nombres ,(tp.primerApellido +' '+tp.segundoApellido ) as Apellidos,tp.ci ,tp.extension,tf.nit,tf.nroCuenta ,tp.direccion,tco.pago ,tc.CARSIGLA,p.Materia ,p.Sis_plan ,p.SiglaP ,th.grupo,th.tipo_clase, DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica ,((DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45) * 20) as carga_mensual 
from tb_designacion td
inner join tb_horario th on td.id_horario = th.id_horario 
inner join tb_personal tp on  th.ci_doc = tp.ci 
inner join tb_sedes ts on th.sede = ts.idSede 
inner join planes_estudios p on td.id_materia = p.id_plan
inner join tb_carreras tc on p.codcar = tc.CARSIGLA   
inner join tb_datos_financieros tf on tp.ci = tf.ci 
inner join tb_contratos tco on tp.ci = tco.ci 

where tco.tipoContrato ='Retencion' and td.comun is null"></asp:SqlDataSource>
                                </div>
            </div>
         </div>
          </form>

</asp:Content>


