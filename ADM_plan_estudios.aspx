<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_plan_estudios.aspx.vb" Inherits="ADM_plan_estudios" MasterPageFile="~/mp2.master" %>

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
                                <asp:DropDownList ID="ddl_sede" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
                                <asp:DropDownList ID="ddl_facultad" runat="server" DataSourceID="sql_ds_facultad" DataTextField="FACDES" DataValueField="FACCOD"></asp:DropDownList>
                                <asp:DropDownList ID="ddl_ant_nuevo" runat="server">
                                    <asp:ListItem>Saleccione el Tipo de Plan</asp:ListItem>
                                    <asp:ListItem Value="A">Plan Antiguo</asp:ListItem>
                                    <asp:ListItem Value="N">Plan Nuevo</asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddl_carrera" runat="server" DataSourceID="sql_ds_carera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>

                                <asp:SqlDataSource ID="sql_ds_carera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>

                                <asp:SqlDataSource ID="sql_ds_facultad" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_facultades]"></asp:SqlDataSource>


                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>



                                <asp:Button ID="Button1" runat="server" Text="carreras" />
                                <asp:Button ID="Button2" runat="server" Text="Sedes" />
                                <br />
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_lista">
                                    <Columns>
                                        <asp:BoundField DataField="Hrs_Total" HeaderText="Hrs_Total" SortExpression="Hrs_Total" />
                                    </Columns>
                                </asp:GridView>
                                <asp:Button ID="Button3" runat="server" Text="Calcular mayor" />
                                <asp:SqlDataSource ID="sql_ds_lista" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select p.Hrs_Total  from tb_designacion td
inner join planes_estudios p on td.id_materia = p.id_plan "></asp:SqlDataSource>
                                <asp:TextBox ID="txt_resultado" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txt_repartir" runat="server"></asp:TextBox>
                                </div>

             <div class="col-md-8 p-3 mb-2 bg-white text-white border   ">
                              <div style="background-color:#FFFACD" class="text-md-center   text-bold " role="alert">
                                Plan de Estudios
                            </div>
                 <asp:GridView ID="gv_plan" runat="server"></asp:GridView>
                 <asp:GridView ID="gv_sedes" runat="server"></asp:GridView>
                                </div>
            </div>
         </div>
         </form>


</asp:Content>


