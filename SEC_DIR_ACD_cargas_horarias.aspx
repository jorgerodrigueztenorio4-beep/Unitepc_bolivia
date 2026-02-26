<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SEC_DIR_ACD_cargas_horarias.aspx.vb" Inherits="SEC_DIR_ACD_cargas_horarias" MasterPageFile="~/mp_sec_dir_academico.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
    <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                               Lista de Carga Horaria
                            </div>
                                <div class="input-group mb-1">
                                     <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True" Font-Size="9pt"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                     <asp:DropDownList ID="ddl_carrera" CssClass="form-control btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True" Font-Size="9pt"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                    </div>

                                <asp:GridView ID="gv_carga" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_carga" Font-Size="9pt">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" ButtonType="Button" ControlStyle-CssClass ="  btn-outline-primary mt-0 " >
<ControlStyle CssClass="  btn-outline-primary mt-0 "></ControlStyle>
                                        </asp:CommandField>
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="total" HeaderText="total" ReadOnly="True" SortExpression="total" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" />
                                    <SelectedRowStyle BackColor="#99FF66" />
                                </asp:GridView>


                                <asp:SqlDataSource ID="sql_ds_carga" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select h.ci_doc, p.Materia  ,(sum(cast(d.horas as int))*20 ) as total  from tb_horario h
join tb_designacion d on d.id_horario = h.id_horario 
join planes_estudios p on d.id_materia = p.id_plan 
where h.gestion ='2-2022' and h.sede =@sede and d.carrera =@carrera
group by rollup ( h.ci_doc,p.Materia )">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_cidoc" runat="server" Visible="False"></asp:TextBox>

                                </div>
            
                            <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                               Detalles
                            </div>
                                <asp:GridView ID="gv_tipo_contrato" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_contrato" DataKeyNames="ci" Font-Size="9pt">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" ReadOnly="True" />
                                        <asp:BoundField DataField="tipoContrato" HeaderText="tipoContrato" SortExpression="tipoContrato" />
                                        <asp:BoundField DataField="tipoPago" HeaderText="tipoPago" SortExpression="tipoPago" ReadOnly="True" />
                                        <asp:BoundField DataField="pago" HeaderText="pago" SortExpression="pago" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_contrato" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT [ci], [tipoContrato], [tipoPago], [pago] FROM [tb_contratos] WHERE ([ci] = @ci)" UpdateCommand="UPDATE tb_contratos SET tipoContrato = @tipoContrato, pago = @pago WHERE (ci = @ci)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_cidoc" Name="ci" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="tipoContrato" />
                                        <asp:Parameter Name="ci" />
                                        <asp:Parameter Name="pago" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="gv_detalle" runat="server" CssClass ="table table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_detalleselec" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="total" HeaderText="total" ReadOnly="True" SortExpression="total" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_detalleselec" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select h.ci_doc, (cast(d.horas as int)*20 )as total,tipo_clase  ,p.Materia,(pe.nombres +' '+pe.primerApellido +' '+pe.segundoApellido ) as docente
from tb_horario h
join tb_designacion d on d.id_horario = h.id_horario 
join planes_estudios p on d.id_materia = p.id_plan 
join tb_personal pe on h.ci_doc = pe.ci 
where h.gestion ='2-2022' and h.ci_doc =@ci and pe.gestion ='2-2022'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_cidoc" Name="ci" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </div>
            </div>
         </div>

         </form>
</asp:Content>


