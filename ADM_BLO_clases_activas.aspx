<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_BLO_clases_activas.aspx.vb" Inherits="ADM_BLO_clases_activas" MasterPageFile="~/mp_adm_blo.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
       <form runat ="server">
 <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                               Clases Activas
                            </div> <asp:DropDownList ID="ddl_bloque" runat="server" CssClass="form-control btn btn-default dropdown-toggle mt-1" DataSourceID="sql_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AutoPostBack="True" AppendDataBoundItems="True">
                                      <asp:ListItem Value="0">Seleccione un bloque</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="sql_bloque" ConnectionString='<%$ ConnectionStrings:unitepc_boliviaConnectionString %>' SelectCommand="SELECT * FROM [tb_bloques] where id_sede=@sede">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txt_idsde" Name="sede" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                                <asp:GridView ID="gv_clases" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_clases" Font-Names="Consolas" Font-Size="10pt" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="Nro de C.I." SortExpression="ci_doc" />
                                        <asp:BoundField DataField="hr_ingreso" HeaderText="Fecha y Hora de Ingreso a la Clase" SortExpression="hr_ingreso" />
                                        <asp:BoundField DataField="Column1" HeaderText="Hora de Salida" ReadOnly="True" SortExpression="Column1" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                 <asp:SqlDataSource ID="sql_ds_clases" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (tp.nombres +' '+tp.primerApellido +' '+tp.segundoApellido ) as docente , ci_doc ,hr_ingreso ,isnull(CONVERT(VARCHAR,hr_salida) ,'En Clases') ,Materia  from tb_ing_sal ti
join tb_personal tp on ti.ci_doc = tp.ci 
where hr_salida is null  and hr_ingreso is not null and bloque=@blo  and tp.gestion ='1-2024'">
                                     <SelectParameters>
                                         <asp:ControlParameter ControlID="ddl_bloque" Name="blo" PropertyName="SelectedValue" />
                                     </SelectParameters>
                                </asp:SqlDataSource>
                                 </div>
             </div>
          </div>
      <asp:TextBox ID="txt_idsde" runat="server" Visible="False"></asp:TextBox>
           </form> 

</asp:Content>



