<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DAF_NAL_horas_docentes.aspx.vb" Inherits="DAF_NAL_horas_docentes" MasterPageFile="~/mp_daf_nacional.master" %>

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
                                Programar Horario
                            </div>
                                <div class="input-group mb-1">
                                <asp:TextBox ID="txt_fi" CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txt_ff"  CssClass ="form-control mt-1 " type="date" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" CssClass ="form-control mt-1 btn btn-primary  "  runat="server" Text="Buscar" />
                                    </div>
                                <asp:GridView ID="gv_docentes" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_horas_gral" Font-Size="9pt" ShowFooter="True">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="tema_avance" HeaderText="tema_avance" SortExpression="tema_avance" />
                                        <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                                        <asp:BoundField DataField="cant_est" HeaderText="cant_est" SortExpression="cant_est" />
                                        <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso" />
                                        <asp:BoundField DataField="hr_salida" HeaderText="hr_salida" SortExpression="hr_salida" />
                                        <asp:BoundField DataField="MINUTOS" HeaderText="MINUTOS" ReadOnly="True" SortExpression="MINUTOS" />
                                        <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_horas_gral" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="Select p.id,ti.ci_doc ,ti.Materia ,ti.tema_avance ,ti.carrera ,cant_est ,hr_ingreso ,hr_salida ,((datediff (SS,TI.hr_ingreso   ,TI.hr_salida )/60)) AS MINUTOS,ti.observaciones 
FROM tb_ing_sal ti
join tb_personal p
on ti.ci_doc =p.ci 
where  TI.hr_ingreso BETWEEN @fi  and @ff  and p.gestion ='1-2024'
order by ci_doc">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_fi" Name="fi" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="txt_ff" Name="ff" PropertyName="Text" Type="DateTime" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
            </div>
         </div>
          </form>
</asp:Content>


