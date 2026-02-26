<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_comunes_todo.aspx.vb" Inherits="RR_HH_comunes_todo" MasterPageFile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form id="form1" runat="server">
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                               Lista de Materias Comunes Gral.
                            </div>
                                <asp:GridView ID="gv_comunes" CssClass ="table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_comunes" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="NombreSede" HeaderText="Sede" SortExpression="NombreSede" />
                                        <asp:BoundField DataField="CARDES" HeaderText="Carrera" SortExpression="CARDES" />
                                        <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                                        <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" ReadOnly="True" SortExpression="Apellidos" />
                                        <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" />
                                        <asp:BoundField DataField="extension" HeaderText="extension" SortExpression="extension" />
                                        <asp:BoundField DataField="nit" HeaderText="nit" SortExpression="nit" />
                                        <asp:BoundField DataField="nroCuenta" HeaderText="Nro. de Cuenta" SortExpression="nroCuenta" />
                                        <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion" />
                                        <asp:BoundField DataField="pago" HeaderText="Pago" SortExpression="pago" />
                                        <asp:BoundField DataField="CARSIGLA" HeaderText="CARSIGLA" SortExpression="CARSIGLA" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="Sis_plan" HeaderText="Tipo de Plan" SortExpression="Sis_plan" />
                                        <asp:BoundField DataField="SiglaP" HeaderText="Sigla" SortExpression="SiglaP" />
                                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="Hras_academica" HeaderText="Hora Academica" ReadOnly="True" SortExpression="Hras_academica" />
                                        <asp:BoundField DataField="horas" HeaderText="Horas Mes" SortExpression="horas" />
                                        <asp:BoundField DataField="comun" HeaderText="Comun" SortExpression="comun" />
                                        <asp:BoundField DataField="tipoContrato" HeaderText="Tipo de Contrato" SortExpression="tipoContrato" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" BorderColor="#C3E6CB" ForeColor="#155724" HorizontalAlign="Center" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_comunes" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="Select ts.NombreSede ,tc.CARDES,tp.nombres ,(tp.primerApellido +' '+tp.segundoApellido ) as Apellidos,tp.ci ,tp.extension,tf.nit,tf.nroCuenta ,tp.direccion,tco.pago ,tc.CARSIGLA,p.Materia ,p.Sis_plan ,p.SiglaP ,th.grupo,th.tipo_clase, DATEDIFF(SS, th.hora_inicio, th.hora_fin) / 60 / 45 AS Hras_academica ,td.horas,td.comun,tco .tipoContrato  
from tb_designacion td
join tb_horario th on td.id_horario = th.id_horario 
join tb_personal tp on  th.ci_doc = tp.ci 
join tb_sedes ts on th.sede = ts.idSede 
left join planes_estudios p on td.id_materia = p.id_plan
left join tb_carreras tc on p.codcar = tc.CARSIGLA   
left join tb_datos_financieros tf on tp.ci = tf.ci 
left join tb_contratos tco on tp.ci = tco.ci 
where td.comun ='C' order by td.id_horario ,td.id_designacion "></asp:SqlDataSource>
                                </div>
            </div>
         </div>

     </form>

</asp:Content>


