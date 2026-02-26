<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SEC_DIR_ACD_aulas.aspx.vb" Inherits="SEC_DIR_ACD_aulas" MasterPageFile="~/mp_sec_dir_academico.master" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form id="form1" runat="server">
    <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                               Lista de Horarios Virtuales
                            </div>
                                 <div class="input-group mb-1">



                               


                                <asp:DropDownList ID="ddl_sede" CssClass="form-control  btn btn-outline-default border-dark mt-1 " runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione una Sede</asp:ListItem>
                                     </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="dd_bloque" CssClass="form-control  btn btn-outline-default border-dark mt-1 " runat="server" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AutoPostBack="True" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione un Bloque</asp:ListItem>
                                     </asp:DropDownList>
                            
                            
                                <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques] WHERE ([id_sede] = @id_sede)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="id_sede" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <asp:DropDownList ID="ddl_tipo_amb" CssClass="form-control  btn btn-outline-default border-dark mt-1 " runat="server" AutoPostBack="True" DataSourceID="sql_tipoam" DataTextField="nombre" DataValueField="id_ambiente" AppendDataBoundItems="True">
                                    <asp:ListItem Value="0">Seleccione el tipo de Ambiente</asp:ListItem>
                                     </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_tipoam" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_ambiente]"></asp:SqlDataSource>
                                 </div>
                                     <asp:GridView ID="gv_aulas" runat="server" CssClass ="table table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_aula">
                                    <Columns>
                                        <asp:BoundField DataField="id_nomal" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_nomal" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Nombre" SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" Visible ="false"  />
                                        <asp:BoundField DataField="capacidad" HeaderText="Capacidad Normal" SortExpression="capacidad" />
                                        <asp:BoundField DataField="capacidad_bs" HeaderText="Capacidad con Bioseguridad" SortExpression="capacidad_bs" />
                                        <asp:BoundField DataField="dimenciones" HeaderText="Dimenciones" SortExpression="dimenciones" />
                                        <asp:BoundField DataField="Sede" HeaderText="Sede" SortExpression="Sede"  Visible ="false" />
                                        <asp:BoundField DataField="ultima_actualizacion" HeaderText="ultima_actualizacion" SortExpression="ultima_actualizacion"  Visible ="false" />
                                        <asp:BoundField DataField="foto" HeaderText="foto" SortExpression="foto"  Visible ="false" />
                                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion"  Visible ="false" />
                                        <asp:BoundField DataField="tipo_ambiente" HeaderText="tipo_ambiente" SortExpression="tipo_ambiente"  Visible ="false" />
                                        <asp:BoundField DataField="ubicacion_piso" HeaderText="Ubicacion dentro el Bloque" SortExpression="ubicacion_piso" />
                                        
                                        <asp:BoundField DataField="estado_aula" HeaderText="Estado del Aula" SortExpression="estado_aula" />
                                        <asp:BoundField DataField="nro_pupitres" HeaderText="Cantidad de Pupitres" SortExpression="nro_pupitres" />
                                        <asp:BoundField DataField="observaciones" HeaderText="Observaciones" SortExpression="observaciones" />
                                    </Columns>
                                         <HeaderStyle BackColor="#D4EDDA" ForeColor="Black" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_aula" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT id_nomal, nom_aula_lab, bloque, capacidad, dimenciones, Sede, ultima_actualizacion, foto, gestion, tipo_ambiente, ubicacion_piso, capacidad_bs, estado_aula, nro_pupitres, observaciones FROM tb_aula WHERE (Sede = @Sede) AND (bloque = @bloque) AND (gestion = '2-2022') AND (tipo_ambiente = @ambiente)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="Sede" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="dd_bloque" Name="bloque" PropertyName="SelectedValue" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddl_tipo_amb" Name="ambiente" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
            </div>
         </div>
    </form>
</asp:Content>

