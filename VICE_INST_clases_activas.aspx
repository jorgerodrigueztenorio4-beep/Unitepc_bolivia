<%@ Page Language="VB" AutoEventWireup="false" CodeFile="VICE_INST_clases_activas.aspx.vb" Inherits="VICE_INST_clases_activas" MasterPageFile="mp_vice_ints.master" %>


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
                               <%-- <asp:GridView ID="gv_clases" CssClass ="table  table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_clases" Font-Names="Consolas" Font-Size="10pt">
                                    <Columns>
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="Nro de C.I." SortExpression="ci_doc" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio Programado" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hr_ingreso" HeaderText="Hora de Marcado Docente" SortExpression="hr_ingreso" />
                                        <asp:BoundField DataField="hr_salida" HeaderText="Hora de Salida" SortExpression="hr_salida" />
                                        <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" ReadOnly="True" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                    </Columns>
                                    <HeaderStyle BackColor="#BB84F9" ForeColor="White" />
                                </asp:GridView>--%>
                                <asp:ScriptManager runat="server"></asp:ScriptManager>
                                <asp:UpdatePanel ID="updPanel" runat="server">
    <ContentTemplate>
                                <asp:GridView ID="gv_clases" CssClass="table table-hover mt-1" runat="server" 
    AutoGenerateColumns="False" DataSourceID="sql_ds_clases" 
    Font-Names="Consolas" Font-Size="10pt" OnRowDataBound="gv_clases_RowDataBound" GridLines="None">
    <Columns>
        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
        <asp:BoundField DataField="ci_doc" HeaderText="Nro de C.I." SortExpression="ci_doc" />
        <asp:BoundField DataField="hra_inicio" HeaderText="Hora de Inicio Programado" SortExpression="hora_inicio" />
        <asp:BoundField DataField="hr_ingreso" HeaderText="Hora de Marcado Docente" SortExpression="hr_ingreso" />
        <asp:BoundField DataField="hr_salida" HeaderText="Hora de Salida" SortExpression="hr_salida" />
        <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" ReadOnly="True" />
        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
    </Columns>
    <HeaderStyle BackColor="#BB84F9" ForeColor="White" />
</asp:GridView>
         <asp:Timer ID="tmrRefresh" runat="server" Interval="5000" OnTick="tmrRefresh_Tick" />
    </ContentTemplate>
</asp:UpdatePanel>

                                 <asp:SqlDataSource ID="sql_ds_clases" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT 
    (tp.nombres + ' ' + tp.primerApellido + ' ' + tp.segundoApellido) AS docente, 
    ti.ci_doc, 
    ti.hra_inicio,  
	ti.hra_fin ,
    hr_ingreso,
	ti.hr_salida,
	ti.dia,
   CASE 
        WHEN hr_salida IS NOT NULL THEN 'Clase Terminada'
        WHEN hr_ingreso IS NOT NULL THEN 'Clases en Curso'
        ELSE 'A la espera de Iniciar la clase'
    END AS estado,
    Materia
    
FROM tb_ing_sal ti
JOIN tb_personal tp ON ti.ci_doc = tp.ci 
WHERE  ti.bloque = @blo and ti.gestion ='2-2025' AND TP.gestion ='2-2025'  AND ti.dia =(SELECT (CASE DATENAME(dw,getdate())
when 'Monday' then 'Lunes'
when 'Tuesday' then 'Martes'
when 'Wednesday' then 'Miercoles'
when 'Thursday' then 'Jueves'
when 'Friday' then 'Viernes'
when 'Saturday' then 'Sabado'
when 'Domingo' then 'Domingo'
END))  and CONVERT(varchar,hora_registro,103) =CONVERT(varchar,getdate(),103)
ORDER BY ti.hra_inicio;">
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



