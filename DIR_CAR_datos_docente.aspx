<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_datos_docente.aspx.vb" Inherits="DIR_CAR_datos_docente" MasterPageFile="~/mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server" >
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffe7ae" class="text-md-center  rounded text-bold " role="alert">
                                Datos Personales del Docente(Seleccione un Docente)
                            </div>  
                                 <asp:DropDownList ID="ddl_docente" runat="server" CssClass="form-control btn btn-default dropdown-toggle mt-1" DataSourceID="sql_docente" DataTextField="docente" DataValueField="ci" AutoPostBack="True" AppendDataBoundItems="True">
                                     <asp:ListItem Value="0">Seleccione un Docente</asp:ListItem>
                                </asp:DropDownList>


                                     <asp:SqlDataSource ID="sql_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT nombres + ' ' + primerApellido + ' ' + segundoApellido AS docente, ci FROM tb_personal order by docente"></asp:SqlDataSource>

                           
                                <asp:GridView ID="gv_datos_doc" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_docente" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                        <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                                        <asp:BoundField DataField="primerApellido" HeaderText="Primer Apellido" SortExpression="primerApellido" />
                                        <asp:BoundField DataField="segundoApellido" HeaderText="Segundo Apellido" SortExpression="segundoApellido" />
                                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                        <asp:BoundField DataField="ci" HeaderText="C.I." SortExpression="ci" />
                                        <asp:BoundField DataField="extension" HeaderText="Extension" SortExpression="extension" />
                                        <asp:BoundField DataField="fechaNacimiento" HeaderText="Fecha de Nacimiento" SortExpression="fechaNacimiento" />
                                        <asp:BoundField DataField="estadoCivil" HeaderText="Estado Civil" SortExpression="estadoCivil" />
                                        <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion" />
                                        <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
                                        <asp:BoundField DataField="celular" HeaderText="Celular" SortExpression="celular" />
                                        <asp:BoundField DataField="genero" HeaderText="Genero" SortExpression="genero" />
                                        <asp:BoundField DataField="nacionalidad" HeaderText="Nacionalidad" SortExpression="nacionalidad" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_personal] where ci=@cidoc">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_ci" Name="cidoc" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <asp:TextBox ID="txt_ci" runat="server" Visible="False"></asp:TextBox>

                           

                                <asp:SqlDataSource ID="sql_ds_herederos" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT [nombres], [apellidos], [edad], [parentesco] FROM [tb_herederos] WHERE ([ci_docente] = @ci_docente)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_ci" Name="ci_docente" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                </div>  
            </div>  
         </div>  
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                             <div style="background-color:#ffe7ae" class="text-md-center  rounded text-bold " role="alert">
                                Datos Financieros del Docente
                            </div>
                                <asp:GridView ID="gv_financiero" runat="server" CssClass="table table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_financiero" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="id_datos_financieros" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_datos_financieros" />
                                        <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" Visible ="false"  />
                                        <asp:BoundField DataField="nit" HeaderText="N.I.T." SortExpression="nit" />
                                        <asp:BoundField DataField="nua" HeaderText="N.U.A." SortExpression="nua" />
                                        <asp:BoundField DataField="afp" HeaderText="A.F.P." SortExpression="afp" />
                                        <asp:BoundField DataField="nroCuenta" HeaderText="Cuenta" SortExpression="nroCuenta" />
                                        <asp:BoundField DataField="banco" HeaderText="banco" SortExpression="banco" />
                                    </Columns>
                                       <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_financiero" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_datos_financieros] WHERE (ci = @ci)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </div>
             <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                             <div style="background-color:#ffe7ae" class="text-md-center  rounded text-bold " role="alert">
                                Datos Ademicos del Docente
                            </div>
                 <asp:gridview runat="server" autogeneratecolumns="False" cssclass="table table-hover mt-1 " datasourceid="sql_ds_acadmeico" ID="gv_datos_acedemicos" Font-Size="9pt">
                     <Columns>
                         <asp:BoundField DataField="lic_tec_en" HeaderText="Licenciada/Tec.Sup en:" SortExpression="lic_tec_en" />
                     </Columns>
                       <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                             </asp:gridview>
                             <asp:SqlDataSource ID="sql_ds_acadmeico" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT [lic_tec_en] FROM [tb_grado_academico] where ci=@cidoc">
                                 <SelectParameters>
                                     <asp:ControlParameter ControlID="txt_ci" Name="cidoc" PropertyName="Text" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
                 </div>
               <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                             <div style="background-color:#ffe7ae" class="text-md-center  rounded text-bold " role="alert">
                                Datos del Contrato
                            </div>
                   <asp:gridview runat="server" ID="gv_contrato" AutoGenerateColumns="False" CssClass="table table-hover mt-1" DataSourceID="sql_ds_tipocontrato" Font-Size="9pt">
                       <Columns>
                           <asp:BoundField DataField="tipoContrato" HeaderText="Tipo de Contrato" SortExpression="tipoContrato" />
                           <asp:BoundField DataField="tipoPago" HeaderText="Tipo de Pago" SortExpression="tipoPago" />
                           <asp:BoundField DataField="pago" HeaderText="Pago" SortExpression="pago" />
                       </Columns>
                         <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                             </asp:gridview>    
                             <asp:SqlDataSource ID="sql_ds_tipocontrato" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT [tipoContrato], [tipoPago], [pago] FROM [tb_contratos]
where ci =@cidoc">
                                 <SelectParameters>
                                   <asp:ControlParameter ControlID="txt_ci" Name="cidoc" PropertyName="Text" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
               </div>
          

         
    
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffe7ae" class="text-md-center  rounded text-bold " role="alert">
                                Datos de Herederos
                            </div>
                                     <asp:gridview runat="server" AutoGenerateColumns="False" id="gv_herederos" cssclass="table table-hover mt-1 " DataSourceID="sql_ds_herederos" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                                        <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                                        <asp:BoundField DataField="edad" HeaderText="edad" SortExpression="edad" />
                                        <asp:BoundField DataField="parentesco" HeaderText="parentesco" SortExpression="parentesco" />
                                    </Columns>
                                           <HeaderStyle BackColor="#D4EDDA" ForeColor="#155724" />
                                </asp:gridview>
                                </div>
                   <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Imprimir Datos del Docente
                            </div>
                       <asp:Button ID="Button1" CssClass="btn btn-primary form-control mt-1 " runat="server" Text="Imprimir informacion" />

                                </div>
                   <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                
                            </div>
                                </div>
            </div>
   



  </div>

         </div>  
        </form>
</asp:Content>


