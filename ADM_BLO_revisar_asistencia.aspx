<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_BLO_revisar_asistencia.aspx.vb" Inherits="ADM_BLO_revisar_asistencia" MasterPageFile="~/mp_adm_blo.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
      <form runat ="server">
          
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Ver registro de Asistencia
                            </div>
                                <asp:TextBox ID="txt_ci" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txt_fecha" type="date" runat="server" AutoPostBack="True"></asp:TextBox>
                                <asp:GridView ID="gv_asistencia" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_asistencia">
                                    <Columns>
                                        <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso" />
                                        <asp:BoundField DataField="hra_salida" HeaderText="hra_salida" ReadOnly="True" SortExpression="hra_salida" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                    </Columns>
                                </asp:GridView>
                                 <asp:SqlDataSource ID="sql_ds_asistencia" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select (tp.nombres +' '+tp.primerApellido +' '+tp.segundoApellido ) as docente , ci_doc ,hr_ingreso ,isnull(CONVERT(VARCHAR,hr_salida) ,'En Clases') as hra_salida ,Materia  from tb_ing_sal ti
join tb_personal tp on ti.ci_doc = tp.ci 
where hr_ingreso=@hora order by hr_ingreso ">
                                     <SelectParameters>
                                         <asp:ControlParameter ControlID="txt_fecha" Name="hora" PropertyName="Text" />
                                     </SelectParameters>
                                </asp:SqlDataSource>
                                 </div>
             </div>
          </div>
          </form>
</asp:Content>


