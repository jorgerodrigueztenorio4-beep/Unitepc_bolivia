<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_contratos_carrera.aspx.vb" Inherits="RR_HH_contratos_carrera" MasterPageFile="~/mp_rr_hh.master" %>


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
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AppendDataBoundItems="True" AutoPostBack="True">
                                    <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_carrera" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione una Carrera</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
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
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="Hrs_Total" HeaderText="Hrs_Total" SortExpression="Hrs_Total" />
                                        <asp:BoundField DataField="tipoContrato" HeaderText="tipoContrato" SortExpression="tipoContrato" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_virtuales" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="Select ts.NombreSede ,tc.CARDES,tp.nombres ,(tp.primerApellido +' '+tp.segundoApellido ) as Apellidos,tp.ci ,tp.extension,tf.nit,tf.nroCuenta ,tp.direccion,tco.pago ,tc.CARSIGLA,p.Materia ,p.Sis_plan ,p.SiglaP ,th.grupo,p.Hrs_Total ,tco.tipoContrato 
from tb_designacion td
left join tb_horario th on td.id_horario = th.id_horario 
left join tb_personal tp on  th.ci_doc = tp.ci 
left join tb_sedes ts on th.sede = ts.idSede 
left join planes_estudios p on td.id_materia = p.id_plan
left join tb_carreras tc on p.codcar = tc.CARSIGLA   
Left join tb_datos_financieros tf on tp.ci = tf.ci 
Left join tb_contratos tco on tp.ci = tco.ci 

where tc.CARSIGLA =@car and ts.idSede =@sede">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="car" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                               
                                </div>
            </div>
         </div>

    </form>
</asp:Content>



