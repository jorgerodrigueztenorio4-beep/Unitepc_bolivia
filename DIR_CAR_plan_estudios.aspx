<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_plan_estudios.aspx.vb" Inherits="DIR_CAR_plan_estudios" MasterPageFile="~/mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">

    <form runat ="server" >
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Seleccione el Plan de Estudios Nuevo o Antiguo 
                            </div>
                                     <asp:DropDownList ID="ddl_ant_nuevo" CssClass="form-control btn  btn-outline-info  dropdown-toggle mt-1" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Seleccione el Tipo de Plan</asp:ListItem>
                                    <asp:ListItem Value="A">Plan Antiguo</asp:ListItem>
                                    <asp:ListItem Value="N">Plan Nuevo</asp:ListItem>
                                </asp:DropDownList>
    <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Plan de Estudios
                            </div>
     <asp:GridView ID="gv_plan" CssClass="table table-hover mt-1 " runat="server" Font-Size="10pt">
                        <HeaderStyle BackColor="#D4EDDA" BorderColor="#C3E6CB" ForeColor="#155724" />
                              </asp:GridView>
                                </div>
              
            </div>
         </div>
    </form>
</asp:Content>


