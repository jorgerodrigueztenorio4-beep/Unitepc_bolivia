<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_agregar_semanas_acd.aspx.vb" Inherits="ADM_agregar_semanas_acd" MasterPageFile="~/mp1.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
       
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Personales del Docente
                            </div>
                                 
            <asp:DropDownList ID="ddl_semana" runat="server">
                <asp:ListItem>Seleccione una semana</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
                <asp:ListItem>13</asp:ListItem>
                <asp:ListItem>14</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>16</asp:ListItem>
                <asp:ListItem>17</asp:ListItem>
                <asp:ListItem>18</asp:ListItem>
                <asp:ListItem>19</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                            </asp:DropDownList>
                                <asp:DropDownList ID="ddl_detalle" runat="server">
                                    <asp:ListItem>Seleccione Actividad</asp:ListItem>
                                    <asp:ListItem>Actividades Teorico / Practico</asp:ListItem>
                                    <asp:ListItem>1er.Examen Parcial</asp:ListItem>
                                    <asp:ListItem>2do.Examen Parcial</asp:ListItem>
                                    <asp:ListItem>3er.Examen Parcial</asp:ListItem>
                                    <asp:ListItem>Examenes Finales</asp:ListItem>
                                    <asp:ListItem>2da.Instancia</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="txt_feha" Type="date"  runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" runat="server" Text="Agregar Informacion" />
                                </div>
                 <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Personales del Docente
                            </div>
                     <asp:GridView ID="gv_semas" runat="server" AutoGenerateColumns="False" DataSourceID="sql_semanas">
                         <Columns>
                             <asp:BoundField DataField="id_semana" HeaderText="id_semana" InsertVisible="False" ReadOnly="True" SortExpression="id_semana" />
                             <asp:BoundField DataField="semana" HeaderText="semana" SortExpression="semana" />
                             <asp:BoundField DataField="fechas" HeaderText="fechas" SortExpression="fechas" />
                             <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                             <asp:BoundField DataField="detalle" HeaderText="detalle" SortExpression="detalle" />
                         </Columns>
                              </asp:GridView>
                              <asp:SqlDataSource ID="sql_semanas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_semanas_academicas(semana, fechas, gestion, detalle) VALUES (@semana, @fecha, '1-2022', @detalle)" SelectCommand="SELECT * FROM [tb_semanas_academicas] ORDER BY [id_semana]">
                                  <InsertParameters>
                                      <asp:ControlParameter ControlID="ddl_semana" Name="semana" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_feha" Name="fecha" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="ddl_detalle" Name="detalle" PropertyName="SelectedValue" />
                                  </InsertParameters>
                              </asp:SqlDataSource>
                     </div>
             </div>
          </div>
       
</asp:Content>


