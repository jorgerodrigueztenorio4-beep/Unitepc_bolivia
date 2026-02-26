<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_SEDE_actualiza_contrato_doc.aspx.vb" Inherits="DIR_ACD_SEDE_actualiza_contrato_doc" MasterPageFile="mp_dir_academico_sedes.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">

        <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white  rounded ">
                                  
                              <div style="background-color:#ffe7ae" class="text-md-center  rounded text-bold " role="alert">
                                Datos para el Contrato
                         
                            </div>

                                    <asp:TextBox ID="txt_buscar" CssClass ="form-control m-1" placeholder="Ingrese Nombre o C.I." runat="server" AutoPostBack="True"></asp:TextBox>
                                <asp:GridView ID="gv_busqueda" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_busqueda" Font-Size="9pt">
                                    <Columns>
                                        <asp:CommandField ButtonType="Button" ShowSelectButton="True" ControlStyle-CssClass="btn btn-primary mt-1 " >
<ControlStyle CssClass="btn btn-primary mt-1 " Font-Size="9pt"></ControlStyle>
                                        </asp:CommandField>
                                        <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                                        <asp:BoundField DataField="primerApellido" HeaderText="primerApellido" SortExpression="primerApellido" />
                                        <asp:BoundField DataField="segundoApellido" HeaderText="segundoApellido" SortExpression="segundoApellido" />
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                        <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" BorderColor="#C3E6CB" ForeColor="#155724" />
                                </asp:GridView>


                                <div class="alert alert-info mt-1 text-md-center  rounded text-bold" role="alert">
<asp:Label ID="Label1" CssClass="alert mt-1 " runat="server" Visible="False" Font-Size="16pt"></asp:Label>
</div>
                                

                              

                                <asp:TextBox ID="txt_comparar" runat="server" Visible="False"></asp:TextBox>
                                <asp:SqlDataSource ID="sql_ds_busqueda" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT nombres, primerApellido, segundoApellido, email, ci FROM tb_personal WHERE (nombres LIKE '%' + @nombres + '%') OR (primerApellido LIKE '%' + @primerApellido + '%') OR (segundoApellido LIKE '%' + @segundoApellido + '%') OR (ci LIKE '%' + @ci + '%')">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_buscar" Name="nombres" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="txt_buscar" Name="primerApellido" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="txt_buscar" Name="segundoApellido" PropertyName="Text" Type="String" />
                                        <asp:ControlParameter ControlID="txt_buscar" Name="ci" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_ci" runat="server" Visible="False"></asp:TextBox>
                                  <asp:DropDownList ID="ddl_tipo_contrato" CssClass="form-control btn btn-default dropdown-toggle mt-1"  runat="server">
                                               <asp:ListItem>Seleccione el Tipo de Contrato</asp:ListItem>
                                               <asp:ListItem>Afiliacion</asp:ListItem>
                                               <asp:ListItem>Facturacion</asp:ListItem>
                                               <asp:ListItem>Retencion</asp:ListItem>
                                           </asp:DropDownList>

                                           <asp:DropDownList ID="ddl_tipo_pago" CssClass="form-control btn btn-default dropdown-toggle mt-1"  runat="server">
                                               <asp:ListItem>Seleccione el Tipo de Pago</asp:ListItem>
                                               <asp:ListItem>Por hora Academica</asp:ListItem>
                                               <asp:ListItem>Monto Fijo</asp:ListItem>
                                           </asp:DropDownList>
                                           <asp:TextBox ID="txt_pago" CssClass="form-control mt-1 " type="number" placeholder="Pago del Docente" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" runat="server" Text="Registrar Datos del Contrato" CssClass ="btn btn-primary mt-1 form-control " />
                                 <asp:Label ID="lbl_existe" role="alert" CssClass=" form-control  alert alert-danger mt-1 text-md-center" runat="server" Text="" Visible ="false" ></asp:Label>


                                <asp:SqlDataSource ID="sql_ds_contrato" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_contratos(ci, tipoContrato, tipoPago, pago, sede_id, fecha_registro) VALUES (@cidoc, @tipocontra, @tipopago, @pago, @sede, GETDATE())" SelectCommand="SELECT id_contratos, ci, tipoContrato, tipoPago, pago, sede_id, fecha_registro FROM tb_contratos WHERE (ci = @ci)">
                                               <InsertParameters>
                                                   <asp:ControlParameter ControlID="txt_ci" Name="cidoc" PropertyName="Text" />
                                                   <asp:ControlParameter ControlID="ddl_tipo_contrato" Name="tipocontra" PropertyName="SelectedValue" />
                                                   <asp:ControlParameter ControlID="ddl_tipo_pago" Name="tipopago" PropertyName="SelectedValue" />
                                                   <asp:ControlParameter ControlID="txt_pago" Name="pago" PropertyName="Text" />
                                                   <asp:ControlParameter Name="sede" ControlID="txt_sede" PropertyName="Text" />
                                               </InsertParameters>
                                               <SelectParameters>
                                                   <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                                               </SelectParameters>
                                           </asp:SqlDataSource>
                         



                                <asp:TextBox ID="txt_sede" runat="server" Visible="False"></asp:TextBox>
                         



                                <asp:GridView ID="gv_buscar" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_contrato">
                                    <Columns>
                                        <asp:BoundField DataField="id_contratos" HeaderText="id_contratos" InsertVisible="False" ReadOnly="True" SortExpression="id_contratos" />
                                        <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" />
                                        <asp:BoundField DataField="tipoContrato" HeaderText="tipoContrato" SortExpression="tipoContrato" />
                                        <asp:BoundField DataField="tipoPago" HeaderText="tipoPago" SortExpression="tipoPago" />
                                        <asp:BoundField DataField="pago" HeaderText="pago" SortExpression="pago" />
                                        <asp:BoundField DataField="sede_id" HeaderText="sede_id" SortExpression="sede_id" />
                                        <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" />
                                    </Columns>
                                </asp:GridView>
                         



                            </div>
            </div>
         </div>

            </form>


</asp:Content>


