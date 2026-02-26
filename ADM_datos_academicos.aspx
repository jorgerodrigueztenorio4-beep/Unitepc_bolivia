<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_datos_academicos.aspx.vb" Inherits="ADM_datos_academicos" MasterPageFile="~/mp2.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat="server">
             <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
        
    	<div class="row">
            
                            <div class="col-md-12 p-1 mb-0 bg-white text-white border border-dark rounded ">
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
                                      <asp:SqlDataSource ID="sql_ds_academico" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_grado_academico]" InsertCommand="INSERT INTO tb_grado_academico(ci, lic_tec_en, licenciatura, diplomado, especialidad, maestria, doctorado, fecha_reg) VALUES ('6477617', @licen, @lic, @dip, @esp, @maes, @doc, GETDATE())">
                                          <InsertParameters>
                                              <asp:ControlParameter ControlID="ddl_profesion" Name="licen" PropertyName="SelectedValue" />
                                              <asp:ControlParameter Name="lic" ControlID="CheckBox3" PropertyName="Checked" />
                                              <asp:ControlParameter ControlID="CheckBox1" Name="dip" PropertyName="Checked" />
                                              <asp:ControlParameter ControlID="CheckBox2" Name="esp" PropertyName="Checked" />
                                              <asp:ControlParameter ControlID="CheckBox5" Name="maes" PropertyName="Checked" />
                                              <asp:ControlParameter ControlID="CheckBox6" Name="doc" PropertyName="Checked" />
                                          </InsertParameters>
                                </asp:SqlDataSource>
                           



                                 <%-- fin --%>
                                </div>
            </div>
         </div>



    </form>
</asp:Content>


