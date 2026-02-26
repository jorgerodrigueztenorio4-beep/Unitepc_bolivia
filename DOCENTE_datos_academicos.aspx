<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DOCENTE_datos_academicos.aspx.vb" Inherits="DOCENTE_datos_academicos" MasterPageFile="~/mp_docentes.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat="server">
             <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
                 <asp:label id="lbl_cargo" runat="server" text=""></asp:label>
        </div> 
     <div class=" container-fluid ">
        
    	<div class="row">
            
                            <div class="col-md-6 p-1 mb-0 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Academicos del Docente
                            </div>
                                <%-- aqui --%>

                                 
                     
                            <label for="exampleInputEmail1">Profesión</label>
                            <asp:DropDownList ID="ddl_profesion" CssClass=" form-control  btn-default dropdown-toggle mt-1" runat="server">
                                <asp:ListItem>Seleccione una Profesion</asp:ListItem>
                                <asp:ListItem>Medico Cirujano</asp:ListItem>
                                <asp:ListItem>Abogado</asp:ListItem>
                                <asp:ListItem>Ingeniero en Sonido</asp:ListItem>
                                <asp:ListItem>Ingeniero de Sistemas</asp:ListItem>
                                <asp:ListItem>Ingeniero Electronico</asp:ListItem>
                                <asp:ListItem>Ingeniero Biomedico</asp:ListItem>
                                <asp:ListItem>Ingeniero Agronomo</asp:ListItem>
                                <asp:ListItem>Ingeniero Civil</asp:ListItem>
                                <asp:ListItem>Ingeniero Quimico</asp:ListItem>
                                <asp:ListItem>Ingeniero Industrial</asp:ListItem>
                                <asp:ListItem>Ingeniero Fisico</asp:ListItem>
                                <asp:ListItem>Ingeniero Electromecanico</asp:ListItem>
                                <asp:ListItem>Fisioterapia y kinesiologia</asp:ListItem>
                                <asp:ListItem>Bioquimico y Farmacia</asp:ListItem>
                                <asp:ListItem>Economista</asp:ListItem>
                                <asp:ListItem>Contador</asp:ListItem>
                                <asp:ListItem>Administrador de Empresas</asp:ListItem>
                                <asp:ListItem>Ingeniero Comercial</asp:ListItem>
                                <asp:ListItem>Lic.Fonoaudiologia</asp:ListItem>
                                <asp:ListItem>Lic.en Odontologia</asp:ListItem>
                                <asp:ListItem>Lic.en Veterinaria y Zootecnia</asp:ListItem>
                                <asp:ListItem>Lic.en Comunicacion Social</asp:ListItem>
                                <asp:ListItem>Lic. en Psicologia</asp:ListItem>
                                <asp:ListItem>Lic.en Biologia</asp:ListItem>
                                <asp:ListItem>Lic.en Sociologia</asp:ListItem>
                                <asp:ListItem>Ing. en Petroleo</asp:ListItem>
                                <asp:ListItem>Lic.en Informatica</asp:ListItem>
                                <asp:ListItem>Lic.en Pedagogia</asp:ListItem>
                                <asp:ListItem>Lic.en Enfermeria</asp:ListItem>
                                <asp:ListItem>Ingeniero Matematico</asp:ListItem>
                                <asp:ListItem>Ingeniero de Alimentos</asp:ListItem>
                                <asp:ListItem>Ingeniero Informatico</asp:ListItem>
                            </asp:DropDownList>
                                    
                  


                             
                              <h4>Nivel de Formacion</h4>
                                <div class="custom-control custom-switch">
                                    <%--<input type="checkbox" class="custom-control-input"  id="licen" runat="server">--%>
                                    <asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="True" />

                                    <label >Licenciatura</label>    <asp:TextBox ID="txt_lic" runat="server" Visible="False">0</asp:TextBox>                              
                                </div>
                                <div class="custom-control custom-switch">
                                   <%-- <input type="checkbox" class="custom-control-input" v-model="diplomado" id="customSwitch5">--%>
                                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" />
                                    <label >Diplomado</label>      <asp:TextBox ID="txt_diplomado" runat="server" Visible="False">0</asp:TextBox>                                
                                </div>
                                <div class="custom-control custom-switch">
                                    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" />
                                
                                   <%-- <input type="checkbox" class="custom-control-input" v-model="especialidad" id="customSwitch6">--%>
                                    <label >Especialidad</label>         <asp:TextBox ID="txt_especialidad" runat="server" Visible="False">0</asp:TextBox>                          
                                </div>   
                                <div class="custom-control custom-switch">
                                    <%--<input type="checkbox" class="custom-control-input" v-model="maestria" id="customSwitch7">--%>
                                    <asp:CheckBox ID="CheckBox5" runat="server" AutoPostBack="True" />
                                    <label >Maestría</label> <asp:TextBox ID="txt_maestria" runat="server" Visible="False">0</asp:TextBox>                            
                                </div>                                
                                <div class="custom-control custom-switch">
                                  <%--  <input type="checkbox" class="custom-control-input" v-model="doctorado" id="customSwitch8">--%>
                                    <asp:CheckBox ID="CheckBox6" runat="server" AutoPostBack="True" />
                                    <label >Doctorado</label>  <asp:TextBox ID="txt_doctorado" runat="server" Visible="False">0</asp:TextBox> 
                                    
                                   
                                                  
                              
                                    
                                    
                                </div>   
                                      <asp:Button ID="Button1" CssClass="btn btn-primary mt-1 form-control " runat="server" Text="Registrar Datos" />
                                      <asp:SqlDataSource ID="sql_ds_academico" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_grado_academico] WHERE ([ci] = @ci)" InsertCommand="INSERT INTO tb_grado_academico(ci, lic_tec_en, licenciatura, diplomado, especialidad, maestria, doctorado, fecha_reg) VALUES (@ci, @licen, @lic, @dip, @esp, @maes, @doc, GETDATE())">
                                          <InsertParameters>
                                              <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                                              <asp:ControlParameter ControlID="ddl_profesion" Name="licen" PropertyName="SelectedValue" />
                                              <asp:ControlParameter ControlID="txt_lic" Name="lic" PropertyName="Text" />
                                              <asp:ControlParameter ControlID="txt_diplomado" Name="dip" PropertyName="Text" />
                                              <asp:ControlParameter ControlID="txt_especialidad" Name="esp" PropertyName="Text" />
                                              <asp:ControlParameter ControlID="txt_maestria" Name="maes" PropertyName="Text" />
                                              <asp:ControlParameter ControlID="txt_doctorado" Name="doc" PropertyName="Text" />
                                          </InsertParameters>
                                          <SelectParameters>
                                              <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" Type="String" />
                                          </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:textbox id="txt_ci" runat="server" visible="false"></asp:textbox>
                           

 </div>

                                 <%-- fin --%>
                                  <div class="col-md-6 p-1 mb-0 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Academicos del Docente
                           
                                      </div>
                                      <asp:gridview id="gv_academico" cssclass="table table-hover mt-1 " runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_academico" Font-Size="10pt">
                                          <Columns>
                                              <asp:BoundField DataField="id_grado_academico" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_grado_academico" />
                                              <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" visible="false" />
                                              <asp:BoundField DataField="lic_tec_en" HeaderText="Licenciatura o Tecnico Superior en:" SortExpression="lic_tec_en" />
                                              <asp:BoundField DataField="licenciatura" HeaderText="Licenciatura" SortExpression="licenciatura" />
                                              <asp:BoundField DataField="diplomado" HeaderText="Diplomado" SortExpression="diplomado" />
                                              <asp:BoundField DataField="especialidad" HeaderText="Especialidad" SortExpression="especialidad" />
                                              <asp:BoundField DataField="maestria" HeaderText="Maestria" SortExpression="maestria" />
                                              <asp:BoundField DataField="doctorado" HeaderText="Doctorado" SortExpression="doctorado" />
                                              <asp:BoundField DataField="fecha_reg" HeaderText="fecha_reg" SortExpression="fecha_reg" visible="false" />
                                          </Columns>
                                      </asp:gridview>
                                      1 = Si<br />
&nbsp;0 = No
                                </div>
            </div>
         </div>



    </form>
</asp:Content>


