<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_plan_estudios.aspx.vb" Inherits="ADM_plan_estudios" MasterPageFile="~/mp_dir_academico.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <form runat ="server">
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
<div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Roles del Sistema
                            </div>
    	<div class="row">
                
                            <div class="col-md-4 p-3 mb-2 bg-white text-white border   ">
                              <div style="background-color:#FFFACD" class="text-md-center   text-bold " role="alert">
                                Seleccione Sede
                            </div>
                                <asp:DropDownList ID="ddl_sede" CssClass="mt-1 form-control  " runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
                                <asp:DropDownList ID="ddl_facultad" CssClass="mt-1  form-control  "  runat="server" DataSourceID="sql_ds_facultad" DataTextField="FACDES" DataValueField="FACCOD"></asp:DropDownList>
                                <asp:DropDownList ID="ddl_ant_nuevo" CssClass="mt-1  form-control  "  runat="server">
                                    <asp:ListItem>Saleccione el Tipo de Plan</asp:ListItem>
                                    <asp:ListItem Value="A">Plan Antiguo</asp:ListItem>
                                    <asp:ListItem Value="N">Plan Nuevo</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddl_carrera" CssClass="mt-1  form-control  "  runat="server" DataSourceID="sql_ds_carera" DataTextField="CARDES" DataValueField="CARSIGLA" Font-Size="10pt"></asp:DropDownList>

                                <asp:SqlDataSource ID="sql_ds_carera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>

                                <asp:SqlDataSource ID="sql_ds_facultad" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_facultades]"></asp:SqlDataSource>


                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>



                                <asp:Button ID="Button1" CssClass="mt-1 form-control  btn-primary  "  runat="server" Text="Ver Plan" />
                                <br />
                                </div>

             <div class="col-md-8 p-3 mb-2 bg-white text-white border   ">
                              <div style="background-color:#FFFACD" class="text-md-center   text-bold " role="alert">
                                Plan de Estudios
                            </div>
                 <asp:GridView ID="gv_plan" CssClass ="table-hover mt-1 " runat="server" Font-Size="10pt"></asp:GridView>
                                </div>
            </div>
         </div>
         </form>


</asp:Content>


