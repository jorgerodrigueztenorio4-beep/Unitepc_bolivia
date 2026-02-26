<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ips.aspx.vb" Inherits="ips" MasterPageFile="mp_cbba.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Programar Horario
                            </div>
                                <asp:DropDownList ID="ddl_bloque" runat="server" AutoPostBack="True" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque"></asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques]"></asp:SqlDataSource>
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_ip" Font-Size="9pt">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="nom_bloque" HeaderText="nom_bloque" SortExpression="nom_bloque" />
                    <asp:BoundField DataField="ip_marcado" HeaderText="ip_marcado" SortExpression="ip_marcado" />
                    <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                </Columns>
                <SelectedRowStyle BackColor="#FFFF66" />
            </asp:GridView>
            <asp:TextBox ID="txt_ip" runat="server"></asp:TextBox>
            <asp:SqlDataSource ID="sql_ds_ip" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select b.nom_bloque  ,ip_marcado ,count(ip_marcado)  
from tb_ing_sal i
join tb_bloques b on i.bloque = b.id_bloque 
where ip_marcado  is not null and bloque=@bloque
 
group by ip_marcado,b.nom_bloque order by b.nom_bloque ,ip_marcado">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_bloque" Name="bloque" PropertyName="SelectedValue" />
                </SelectParameters>
                                </asp:SqlDataSource>
                                  </div>
             <div class="col-md-8 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Programar Horario
                            </div>
                 <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="sql_detalles" Font-Size="9pt">
                     <Columns>
                         <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                         <asp:BoundField DataField="Column1" HeaderText="Column1" ReadOnly="True" SortExpression="Column1" />
                         <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso" />
                         <asp:BoundField DataField="hr_salida" HeaderText="hr_salida" SortExpression="hr_salida" />
                         <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                         <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                         <asp:BoundField DataField="ip_marcado" HeaderText="ip_marcado" SortExpression="ip_marcado" />
                     </Columns>
                              </asp:GridView>
                                  <asp:SqlDataSource ID="sql_detalles" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select  ci_doc ,(p.nombres+' '+p.primerApellido +' '+p.segundoApellido )  ,hr_ingreso ,hr_salida ,Materia ,carrera,ip_marcado   from tb_ing_sal i
join  tb_personal p on i.ci_doc = p.ci 
where ip_marcado =@ip
order by ci_doc ">
                                      <SelectParameters>
                                          <asp:ControlParameter ControlID="txt_ip" Name="ip" PropertyName="Text" />
                                      </SelectParameters>
                              </asp:SqlDataSource>
                                  </div>
          
              </div>
           </div>

    







       
</asp:Content>


