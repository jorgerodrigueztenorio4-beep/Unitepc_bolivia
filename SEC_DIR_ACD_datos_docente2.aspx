<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SEC_DIR_ACD_datos_docente2.aspx.vb" Inherits="SEC_DIR_ACD_datos_docente2" MasterPageFile="mp_sec_dir_academico.master" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server" >
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Personales del Docente
                            </div>  
                                


                                     <asp:SqlDataSource ID="sql_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT nombres + ' ' + primerApellido + ' ' + segundoApellido AS docente, ci FROM tb_personal WHERE (nombres LIKE '%' + @buscar + '%') OR (primerApellido LIKE '%' + @buscar + '%') OR (segundoApellido LIKE '%' + @buscar + '%') OR (ci LIKE '%' + @buscar + '%') ORDER BY docente">
                                         <SelectParameters>
                                             <asp:ControlParameter ControlID="txt_buscar" Name="buscar" PropertyName="Text" />
                                         </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:TextBox ID="txt_buscar" placeholder="Buscar por Nombre o Apellido" CssClass ="form-control mt-1 " runat="server" AutoPostBack="True"></asp:TextBox>
                                <asp:GridView ID="gv_buscar" runat="server"  CssClass ="table table-hover " AutoGenerateColumns="False" DataSourceID="sql_docente" Font-Size="9pt">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass ="btn btn-primary " />
                                        <asp:BoundField DataField="docente" HeaderText="docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" />
                                    </Columns>
                                </asp:GridView>
                           
                                <asp:GridView ID="gv_datos_doc" CssClass ="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_docente" Font-Size="9pt">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                        <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" ReadOnly="True" />
                                        <asp:BoundField DataField="primerApellido" HeaderText="primerApellido" SortExpression="primerApellido"  ReadOnly="True" />
                                        <asp:BoundField DataField="segundoApellido" HeaderText="segundoApellido" SortExpression="segundoApellido"  ReadOnly="True"/>
                                        <asp:BoundField DataField="email" HeaderText="email" SortExpression="email"  ReadOnly="True"/>
                                        <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci"  ReadOnly="True"/>
                                        <asp:BoundField DataField="extension" HeaderText="extension" SortExpression="extension"  ReadOnly="True"/>
                                        <asp:BoundField DataField="fechaNacimiento" HeaderText="fechaNacimiento" SortExpression="fechaNacimiento"  ReadOnly="True"/>
                                        <asp:BoundField DataField="estadoCivil" HeaderText="estadoCivil" SortExpression="estadoCivil"  ReadOnly="True"/>
                                        <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" />
                                        <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono"  ReadOnly="True"/>
                                        <asp:BoundField DataField="celular" HeaderText="celular" SortExpression="celular"  ReadOnly="True"/>
                                        <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero"   />
                                        <asp:BoundField DataField="nacionalidad" HeaderText="nacionalidad" SortExpression="nacionalidad"  ReadOnly="True"/>
                                        <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro"  ReadOnly="True" visible="false" />
                                        <asp:BoundField DataField="fecha_actualizacion" HeaderText="fecha_actualizacion" SortExpression="fecha_actualizacion"  ReadOnly="True" Visible ="false" />
                                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_docente" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_personal] where ci=@cidoc and gestion ='2-2022'" UpdateCommand="UPDATE tb_personal SET direccion = @direccion, genero = @genero WHERE (id = @id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_ci" Name="cidoc" PropertyName="Text" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="direccion" />
                                        <asp:Parameter Name="id" />
                                        <asp:Parameter Name="genero" />
                                    </UpdateParameters>
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
                             <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Financieros del Docente
                            </div>
                                <asp:GridView ID="gv_financiero" runat="server" CssClass="table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_financiero" Font-Size="9pt" DataKeyNames="id_datos_financieros">
                                    <Columns>
                                        <asp:CommandField ShowEditButton="True" />
                                        <asp:BoundField DataField="id_datos_financieros" HeaderText="iD" InsertVisible="False" SortExpression="id_datos_financieros" ReadOnly="True" />
                                        <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" ReadOnly="True"  />
                                        <asp:BoundField DataField="nit" HeaderText="nit" SortExpression="nit"  ReadOnly="True" />
                                        <asp:BoundField DataField="nua" HeaderText="nua" SortExpression="nua" ReadOnly="True" Visible ="false"  />
                                        <asp:BoundField DataField="afp" HeaderText="afp" SortExpression="afp"  ReadOnly="True"/>
                                        <asp:BoundField DataField="nroCuenta" HeaderText="nroCuenta" SortExpression="nroCuenta"  ReadOnly="True"/>
                                        <asp:BoundField DataField="banco" HeaderText="banco" SortExpression="banco"  ReadOnly="True"/>
                                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_financiero" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_datos_financieros] WHERE (ci = @ci)  " UpdateCommand="UPDATE tb_datos_financieros SET nit = @nit, gestion = @gestion WHERE (id_datos_financieros = @id_datos_financieros)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="id_datos_financieros" />
                                        <asp:Parameter Name="nit" />
                                        <asp:Parameter Name="gestion" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                </div>
             <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                             <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Ademicos del Docente
                            </div>
                 <asp:gridview runat="server" autogeneratecolumns="False" cssclass="table table-hover mt-1 " datasourceid="sql_ds_acadmeico" ID="gv_datos_acedemicos" Font-Size="9pt">
                     <Columns>
                         <asp:BoundField DataField="lic_tec_en" HeaderText="lic_tec_en" SortExpression="lic_tec_en" />
                     </Columns>
                             </asp:gridview>
                             <asp:SqlDataSource ID="sql_ds_acadmeico" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT lic_tec_en FROM tb_grado_academico WHERE (ci = @cidoc)">
                                 <SelectParameters>
                                     <asp:ControlParameter ControlID="txt_ci" Name="cidoc" PropertyName="Text" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
                 </div>
               <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                             <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos del Contrato
                            </div>
                   <asp:gridview runat="server" ID="gv_contrato" AutoGenerateColumns="False" CssClass="table table-hover mt-1" DataSourceID="sql_ds_tipocontrato" Font-Size="9pt">
                       <Columns>
                           <asp:BoundField DataField="tipoContrato" HeaderText="tipoContrato" SortExpression="tipoContrato" />
                           <asp:BoundField DataField="tipoPago" HeaderText="tipoPago" SortExpression="tipoPago" />
                           <asp:BoundField DataField="pago" HeaderText="pago" SortExpression="pago" />
                       </Columns>
                             </asp:gridview>    
                             <asp:SqlDataSource ID="sql_ds_tipocontrato" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT tipoContrato, tipoPago, pago FROM tb_contratos WHERE (ci = @cidoc)">
                                 <SelectParameters>
                                   <asp:ControlParameter ControlID="txt_ci" Name="cidoc" PropertyName="Text" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
               </div>
          

         
    
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos de Herederos
                            </div>
                                     <asp:gridview runat="server" AutoGenerateColumns="False" id="gv_herederos" cssclass="table table-hover mt-1 " DataSourceID="sql_ds_herederos" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                                        <asp:BoundField DataField="apellidos" HeaderText="apellidos" SortExpression="apellidos" />
                                        <asp:BoundField DataField="edad" HeaderText="edad" SortExpression="edad" />
                                        <asp:BoundField DataField="parentesco" HeaderText="parentesco" SortExpression="parentesco" />
                                    </Columns>
                                </asp:gridview>
                                </div>
                   <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Imprimir Datos del Docente
                            </div>
                        <asp:Button ID="Button1" CssClass="btn btn-primary form-control mt-1 " runat="server" Text="Imprimir informacion" Visible="False" />
                                </div>
                   <div class="col-md-4 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Personales del Docente
                            </div>
                                </div>
            </div>
   



  </div>

         </div>  
        </form>
</asp:Content>


