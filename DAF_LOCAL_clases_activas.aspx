<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_LOCAL_clases_activas.aspx.vb" Inherits="DAF_LOCAL_clases_activas" MasterPageFile="mp_daf_local.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
       <form runat ="server">
 <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                               Clases Activas
                            </div> <asp:DropDownList ID="ddl_bloque" runat="server" CssClass="form-control btn btn-default dropdown-toggle mt-1" DataSourceID="sql_bloque" DataTextField="nom_bloque" DataValueField="id_bloque" AutoPostBack="True" AppendDataBoundItems="True">
                                      <asp:ListItem Value="0">Seleccione un bloque</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="sql_bloque" ConnectionString='<%$ ConnectionStrings:unitepc_boliviaConnectionString %>' SelectCommand="SELECT * FROM [tb_bloques]">
                    </asp:SqlDataSource>
                                <asp:GridView ID="gv_clases" CssClass ="table  table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_clases" Font-Names="Consolas" Font-Size="10pt" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de inicio en el horario" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hr_ingreso" HeaderText="hora de Ingreso Marcado" SortExpression="hr_ingreso" />
                                        <asp:BoundField DataField="Column1" HeaderText="Estado" SortExpression="Column1" ReadOnly="True" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                 <asp:SqlDataSource ID="sql_ds_clases" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (tp.nombres +' '+tp.primerApellido +' '+tp.segundoApellido ) as docente , ti.ci_doc ,th.hora_inicio   ,hr_ingreso ,isnull(CONVERT(VARCHAR,hr_salida) ,'En Clases') ,Materia
from tb_ing_sal ti
join tb_personal tp on ti.ci_doc = tp.ci 
join tb_horario th on ti .id_horario = th.id_horario 
where hr_salida is null and ti.bloque=@blo">
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



