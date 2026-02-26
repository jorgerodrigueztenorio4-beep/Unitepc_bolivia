<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_agregar_datos_contrato.aspx.vb" Inherits="ADM_agregar_datos_contrato" MasterPageFile="~/mp1.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">

       <label for="exampleInputEmail1">Tipo de contrato</label> <br> 
                   <div class="btn-group">
                                              <asp:radiobuttonlist id="RadioButtonList1" runat="server">
                           <asp:ListItem>Afiliacion</asp:ListItem>
                           <asp:ListItem>Retencion</asp:ListItem>
                           <asp:ListItem>Facturacion</asp:ListItem>
                       </asp:radiobuttonlist>
                                           </div>
                    <br><br>
                    <label for="exampleInputEmail1">Tipo de pago</label> <br>
                   <div class="btn-group"> 
                                                 <asp:RadioButtonList ID="RadioButtonList2"   runat="server">
                           <asp:ListItem>Por Hora Academica</asp:ListItem>
                           <asp:ListItem>Monto Fijo</asp:ListItem>
                       </asp:RadioButtonList>    
                    </div>
                <br><br>
               <label for="exampleInputEmail1">Monto a pagar</label> <br>
                    <div class="input-group mb-3">
                                             <asp:textbox runat="server" type="number" cssclass="form-control mt-1 "></asp:textbox>
                        <div class="input-group-append">
                        </div>
                    </div>
    <asp:button runat="server" cssclass="btn btn-primary mt-1 form-control " text="Agregar Informacion del Contrato" OnClick="Unnamed2_Click" ID="btn_agregar" />
    <asp:TextBox ID="txt_tipocon" runat="server"></asp:TextBox>
    </asp:Content>


