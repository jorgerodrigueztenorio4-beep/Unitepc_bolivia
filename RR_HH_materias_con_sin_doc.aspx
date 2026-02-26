<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_materias_con_sin_doc.aspx.vb" Inherits="RR_HH_materias_con_sin_doc" MasterPageFile="~/mp_rr_hh.master" %>

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
                                Seleccione Sede y Carrera
                            </div>
                                <div class="input-group mb-1">
                                <asp:DropDownList ID="ddl_sede" CssClass="form-control  btn btn-outline-default border-dark mt-1 " runat="server" AutoPostBack="True" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="dd_carrera" CssClass="form-control  btn btn-outline-default border-dark mt-1 " runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                            </div>
                                </div>
            </div>
         <div class="row">
            
                            <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Detalle por Carrera
                            </div>
                                <asp:GridView ID="gv_total_car" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_totalcar">
                                    <Columns>
                                        <asp:BoundField DataField="totalmaterias" HeaderText="Total Materias Registradas" ReadOnly="True" SortExpression="totalmaterias" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_totalcar" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select count(ci) as totalmaterias from tb_horario h
join tb_personal p on h.ci_doc = p.ci 
join tb_designacion d on h.id_horario =d.id_horario 
join tb_carreras c on d.carrera =c.CARSIGLA 
where h.gestion ='2-2025' and p.gestion ='2-2025' and c.CARSIGLA  =@carrera and h.sede =@sede">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="dd_carrera" Name="carrera" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="gv_condoc_car" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_condoc_car">
                                    <Columns>
                                        <asp:BoundField DataField="materiascondocente" HeaderText="Materias Registradas con Docente" ReadOnly="True" SortExpression="materiascondocente" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_condoc_car" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select count(ci) as materiascondocente from tb_horario h
join tb_personal p on h.ci_doc = p.ci 
join tb_designacion d on h.id_horario =d.id_horario 
join tb_carreras c on d.carrera =c.CARSIGLA 
where h.gestion ='2-2025' and p.gestion ='2-2025' and c.CARSIGLA  =@carrera and h.sede =@sede and ci&lt;&gt;'0'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="dd_carrera" Name="carrera" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="gv_sindoc_car" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_sindoc">
                                    <Columns>
                                        <asp:BoundField DataField="materiasindocente" HeaderText="Materias Registradas Sin Docente" ReadOnly="True" SortExpression="materiasindocente" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_sindoc" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select count(ci) as materiasindocente from tb_horario h
join tb_personal p on h.ci_doc = p.ci 
join tb_designacion d on h.id_horario =d.id_horario 
join tb_carreras c on d.carrera =c.CARSIGLA 
where h.gestion ='2-2025' and p.gestion ='2-2025' and c.CARSIGLA  =@carrera and h.sede =@sede and ci='0'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="dd_carrera" Name="carrera" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
               <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Detalle por Sede
                            </div>
                     <asp:GridView ID="GridView1" CssClass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                         <Columns>
                             <asp:BoundField DataField="totalmaterias" HeaderText="totalmaterias" ReadOnly="True" SortExpression="totalmaterias" />
                         </Columns>
                         <HeaderStyle BackColor="#D4EDDA" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select count(ci) as totalmaterias from tb_horario h
join tb_personal p on h.ci_doc = p.ci 
join tb_designacion d on h.id_horario =d.id_horario 
join tb_carreras c on d.carrera =c.CARSIGLA 
where h.gestion ='2-2025' and p.gestion ='2-2025'  and h.sede =@sede">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="GridView2"  CssClass="table table-hover mt-1 "  runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                                    <Columns>
                                        <asp:BoundField DataField="materiascondocente" HeaderText="materiascondocente" ReadOnly="True" SortExpression="materiascondocente" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select count(ci) as materiascondocente from tb_horario h
join tb_personal p on h.ci_doc = p.ci 
join tb_designacion d on h.id_horario =d.id_horario 
join tb_carreras c on d.carrera =c.CARSIGLA 
where h.gestion ='2-2025' and p.gestion ='2-2025'  and h.sede =@sede and ci&lt;&gt;'0'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="GridView3"  CssClass="table table-hover mt-1 "  runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                                    <Columns>
                                        <asp:BoundField DataField="materiasindocente" HeaderText="materiasindocente" ReadOnly="True" SortExpression="materiasindocente" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select count(ci) as materiasindocente from tb_horario h
join tb_personal p on h.ci_doc = p.ci 
join tb_designacion d on h.id_horario =d.id_horario 
join tb_carreras c on d.carrera =c.CARSIGLA 
where h.gestion ='2-2025' and p.gestion ='2-2025' and h.sede =@sede and ci='0'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                            </div>
               <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                    <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Porcentaje con Docentes
                            </div>
                   <asp:Label ID="lbl_conmat" runat="server" Font-Bold="True" Font-Size="15pt"></asp:Label>
                     <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Porcentaje sin Docente
                            </div>
                   <asp:Label ID="lbl_sinmat" runat="server" Text="" Font-Bold="True" Font-Size="15pt"></asp:Label>

               </div>
            </div>
         </div>
        </form>
</asp:Content>


