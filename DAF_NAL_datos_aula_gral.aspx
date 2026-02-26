<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_NAL_datos_aula_gral.aspx.vb" Inherits="DAF_NAL_datos_aula_gral"  EnableEventValidation="false" MasterPageFile="~/mp_daf_nacional.master" %>

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
                                Datos de Aulas
                            </div>
                                <asp:Button ID="Button1" CssClass ="btn btn-primary mt-1 form-control " runat="server" Text="Exportar al Excel" />
                                <asp:GridView ID="GridView1" CssClass ="table  table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_aulas" Font-Size="9pt" DataKeyNames="id_nomal" Font-Names="Consolas" GridLines="None">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                                        <asp:BoundField DataField="id_nomal" HeaderText="Id." InsertVisible="False" SortExpression="id_nomal"  ReadOnly="True" />
                                        <asp:BoundField DataField="NombreSede" HeaderText="Sede" SortExpression="NombreSede" ReadOnly="True" />
                                        <asp:BoundField DataField="nom_bloque" HeaderText="Bloque" SortExpression="nom_bloque"  ReadOnly="True" />
                                        <asp:BoundField DataField="nombre" HeaderText="Tipo de Ambiente" SortExpression="nombre"  ReadOnly="True" />
                                        <asp:BoundField DataField="nom_aula_lab" HeaderText="Nombre del Aula o Lab." SortExpression="nom_aula_lab" />
                                        <asp:BoundField DataField="capacidad" HeaderText="Capacidad" SortExpression="capacidad"  ReadOnly="True" />
                                        <asp:BoundField DataField="capacidad_bs" HeaderText="Capacidad con Bioseguridad" SortExpression="capacidad_bs"  ReadOnly="True" Visible="false" />
                                        <asp:BoundField DataField="nro_pupitres" HeaderText="Numero de Pupitres" SortExpression="nro_pupitres"  ReadOnly="True" />
                                        <asp:BoundField DataField="dimenciones" HeaderText="Dimenciones" SortExpression="dimenciones"  ReadOnly="True" />
                                        <asp:BoundField DataField="estado_aula" HeaderText="Estado del Aula" SortExpression="estado_aula"  ReadOnly="True" />
                                        <asp:BoundField DataField="observaciones" HeaderText="Observaciones" SortExpression="observaciones"  ReadOnly="True" />
                                        <asp:BoundField DataField="gestion" HeaderText="Gestion" SortExpression="gestion"  ReadOnly="True" Visible="false" />
                                    </Columns>
                                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_aulas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select id_nomal , s.NombreSede ,b.nom_bloque,a.nombre, ta.nom_aula_lab,ta.capacidad ,ta.capacidad_bs,ta.nro_pupitres ,ta.dimenciones   ,ta.estado_aula,ta.observaciones ,ta.gestion  from tb_aula ta
join tb_sedes s
on ta.Sede = s.idSede 
join tb_bloques b
on ta.bloque = b.id_bloque 
join tb_ambiente a on ta.tipo_ambiente = a.id_ambiente 
where ta.gestion ='1-2024'
order by s.NombreSede,a.nombre" UpdateCommand="UPDATE tb_aula SET nom_aula_lab = @nom_aula_lab WHERE (id_nomal = @id_nomal)" DeleteCommand="DELETE FROM tb_aula WHERE (id_nomal = @id_nomal)">
                                    <UpdateParameters>
                                        <asp:Parameter Name="nom_aula_lab" />
                                        <asp:Parameter Name="id_nomal" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
            </div>
         </div>
          </form> 
</asp:Content>


