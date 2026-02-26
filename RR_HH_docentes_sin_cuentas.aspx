<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_docentes_sin_cuentas.aspx.vb" Inherits="RR_HH_docentes_sin_cuentas" MasterPageFile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
      <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Lista de Docentes sin Nro. de Cuenta o Sin Banco
                            </div>
                           
                                <asp:GridView ID="GridView1" CssClass ="table table-dark table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_sinbanco" Font-Size="9pt" DataKeyNames="id_datos_financieros">
                                    <Columns>
                                        <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass ="btn btn-primary mt-1" />
                                        <asp:BoundField DataField="id_datos_financieros" HeaderText="I.D." InsertVisible="False" SortExpression="id_datos_financieros" ReadOnly="True" />
                                        <asp:BoundField DataField="Docente" HeaderText="Docente" SortExpression="Docente" ReadOnly="True"/>
                                        <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" ReadOnly="True" />
                                        <asp:BoundField DataField="nit" HeaderText="nit" SortExpression="nit" />
                                        <asp:BoundField DataField="nua" HeaderText="nua" SortExpression="nua" />
                                        <asp:BoundField DataField="afp" HeaderText="afp" SortExpression="afp" ReadOnly="True" />
                                        <asp:TemplateField HeaderText="nroCuenta" SortExpression="nroCuenta">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nroCuenta") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("nroCuenta") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="banco" SortExpression="banco">
                                            <EditItemTemplate>
                                                     <asp:DropDownList ID="DropDownList1"  runat="server" SelectedValue='<%# Bind("banco") %>'>
                                    <asp:ListItem Value="0">Sin Banco</asp:ListItem>
                                    <asp:ListItem>Banco Mercantil Santa Cruz</asp:ListItem>
                                    <asp:ListItem>Banco Bisa</asp:ListItem>
                                    <asp:ListItem>Banco Unión</asp:ListItem>
                                    <asp:ListItem>Banco Sol</asp:ListItem>
                                    <asp:ListItem>Banco Fassil</asp:ListItem>
                                    <asp:ListItem>Cheque</asp:ListItem>

                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("banco") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle BackColor="#00A400" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_sinbanco" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select f.id_datos_financieros  , (p.nombres +' '+p.primerApellido +' '+p.segundoApellido ) as Docente,p.ci ,f.nit ,f.nua ,f.afp ,f.nroCuenta ,f.banco  from tb_datos_financieros f
join tb_personal p on f.ci = p.ci 
where f.gestion ='2-2022' and (nroCuenta ='0' or banco ='0')
order by Docente " UpdateCommand="UPDATE tb_datos_financieros SET nit =@nit, nroCuenta = @nroCuenta, banco = @banco WHERE (id_datos_financieros = @id_datos_financieros)">
                                    <UpdateParameters>
                                        <asp:Parameter Name="nroCuenta" />
                                        <asp:Parameter Name="banco" />
                                        <asp:Parameter Name="id_datos_financieros" />
                                        <asp:Parameter Name="nit" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                </div>
           <%--  <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Programar Horario
                            </div>
                                </div>--%>
            </div>
         </div>
          </form>



</asp:Content>


