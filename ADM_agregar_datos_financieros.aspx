<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ADM_agregar_datos_financieros.aspx.vb" Inherits="ADM_agregar_datos_financieros" MasterPageFile="~/mp2.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat="server">
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
        
    	<div class="row">
            
                            <div class="col-md-12 p-1 mb-0 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Financieros del Docente
                            </div>
                                <%-- aqui --%>

                                   
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Seleccionar el Banco de su Cuenta</label>
                                            <select id="bancos" Class=" form-control  btn-default dropdown-toggle mt-1"  runat="server" >
                                                <option value="Banco Unión S.A.">Banco Unión S.A.</option>
                                                <option value="Banco Mercantil Santa Cruz S.A.">Banco Mercantil Santa Cruz S.A.</option>        
                                                <option value="Banco Económico S.A.">Banco Económico S.A.</option>
                                                <option value="Banco Ganadero S.A.">Banco Ganadero S.A.</option>
                                                <option value="Banco Fortaleza S.A.">Banco Fortaleza S.A.</option>
                                                <option value="Banco Prodem S.A.">Banco Prodem S.A.</option>
                                                <option value="Banco Fassil S.A.">Banco Fassil S.A.</option>    
                                                <option value="Banco BISA S.A.">Banco BISA S.A.</option>
                                                <option value="Banco Nacional de Bolivia S.A.">Banco Nacional de Bolivia S.A.</option>
                                                <option value="Banco Central de Bolivia S.A.">Banco Central de Bolivia S.A.</option>
                                                <option value="Banco de Crédito BCP S.A.">Banco de Crédito BCP S.A.</option>
                                                <option value="Banco Los Andes Pro Credit S.A.">Banco Los Andes Pro Credit S.A.</option>
                                                <option value="Banco Solidario S.A.">Banco Solidario S.A.</option>
                                                <option value="Banco Sol S.A.">Banco Sol S.A.</option>
                                                <option value="Banco Pyme de la comunidad S.A.">Banco Pyme de la comunidad</option>
                                                <option value="Banco Pyme Ecofuturo S.A.">Banco Pyme Ecofuturo S.A.</option>
                                                <option value="COOPERATIVA QUILLACOLLO">COOPERATIVA QUILLACOLLO</option>
                                                <option value="COOPERATIVA SAN CARLOS BORROMEO LTDA">COOPERATIVA SAN CARLOS BORROMEO LTDA</option>
                                                <option value="COOPERATIVA SAN ANTONIO R.L.">COOPERATIVA SAN ANTONIO R.L.</option>
                                                <option value="COOPERATIVA SAN JOSÉ DE PUNATA LTDA">COOPERATIVA SAN JOSÉ DE PUNATA LTDA</option>
                                                <option value="COOPERATIVA ASUNCION LTDA">COOPERATIVA ASUNCION LTDA</option>
                                                <option value="COOPERATIVA JESUS NAZARENO">COOPERATIVA JESUS NAZARENO</option>
                                                <option value="COOPERATIVA MADRE Y MAESTRA LTDA">COOPERATIVA MADRE Y MAESTRA LTDA</option>
                                                <option value="COOPERATIVA SAN JOSÉ DE BERMEJO LTDA">COOPERATIVA SAN JOSÉ DE BERMEJO LTDA</option>
                                                <option value="COOPERATIVA CATEDRAL LTDA">COOPERATIVA CATEDRAL LTDA</option>
                                                <option value="COOPERATIVA CACEF R.L.">COOPERATIVA CACEF R.L.</option>
                                                <option value="COOPERATIVA MONSEÑOR FELIX GAINZA LTDA">COOPERATIVA MONSEÑOR FELIX GAINZA LTDA</option>
                                                <option value="COOPERATIVA TRINIDAD LTDA">COOPERATIVA TRINIDAD LTDA</option>
                                                <option value="COOPERATIVA LA SAGRADA FAMILIA R.L.">COOPERATIVA LA SAGRADA FAMILIA R.L.</option>
                                                <option value="COOPERATIVA LOYOLA R. L.">COOPERATIVA LOYOLA R. L.</option>
                                                <option value="COOPERATIVA SAN MARTIN DE PORRES">COOPERATIVA SAN MARTIN DE PORRES</option>
                                                <option value="COOPERATIVA SAN ROQUE R.L.">COOPERATIVA SAN ROQUE R.L.</option>
                                                <option value="COOPERATIVA PIO X LTDA.">COOPERATIVA PIO X LTDA.</option>
                                                <option value="COOPERATIVA SAN MATEO LTDA">COOPERATIVA SAN MATEO LTDA</option>
                                                <option value="COOPERATIVA LA MERCED">COOPERATIVA LA MERCED</option>
                                                <option value="COOPERATIVA EDUCADORES GRAN CHACO LTDA">COOPERATIVA EDUCADORES GRAN CHACO LTDA</option>
                                                <option value="COOPERATIVA MAGISTERIO RURAL DE CHUQUISACA RL">COOPERATIVA MAGISTERIO RURAL DE CHUQUISACA RL</option>
                                                <option value="COOPERATIVA MAGISTERIO RURAL LTDA">COOPERATIVA MAGISTERIO RURAL LTDA</option>
                                                <option value="COOPERATIVA COMARAPA LTDA">COOPERATIVA COMARAPA LTDA</option>
                                                <option value="COOPERATIVA FÁTIMA LTDA.">COOPERATIVA FÁTIMA LTDA.</option>
                                                <option value="COOPERATIVA PROGRESO R.L.">COOPERATIVA PROGRESO R.L.</option>
                                                <option value="COOPERATIVA INCA HUASI LTDA.">COOPERATIVA INCA HUASI LTDA.</option>
                                                <option value="COOPERATIVA SAN PEDRO LTDA.">COOPERATIVA SAN PEDRO LTDA.</option>

                                            </select>


                                      

                                            

                                        </div>  
                                        <div class="input-group mb-0">
                                            <div class="input-group-append">
                                            <span class="input-group-text">Nro de Cuenta</span>
                                            </div>
                                          

                                                <asp:TextBox ID="txt_nro_cta"  type="number" class="form-control" placeholder="Ingrese el Nro de cuenta"  runat="server"></asp:TextBox>
                                       
                                            
                                        </div>              
                               
                              
                            

                 
                             
                            <div class="form-group">
                                <label for="exampleInputEmail1">NIT <span v-if="tipoContrato == 'Retención'">=> En caso de no tener NIT poner 0</span></label>
                                <asp:TextBox ID="txt_nit" type="text" class="form-control" placeholder="Ingrese el NIT del Docente" runat="server"></asp:TextBox>
                              
                            </div>                
             
                  
                                 
 
                        <div class="row">
                            <div class="col-6">
                                                             
                                        <label for="exampleInputEmail1">NUA/CUA</label>
                                         <asp:TextBox ID="txt_nua"  type="number" class="form-control" placeholder="Ingrese el NUA del Docente" runat="server"></asp:TextBox>
                                                                                        
                           </div>
                            <div class="col-6">
                                  <label for="exampleInputEmail1">AFP</label> <br>
                                <asp:DropDownList ID="ddl_afp" CssClass=" form-control  btn-default dropdown-toggle mt-1" runat="server">
                                    <asp:ListItem>Seleccione un Valor</asp:ListItem>
                                    <asp:ListItem>Futuro</asp:ListItem>
                                    <asp:ListItem>Prevision</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="sql_ds_financiero" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_datos_financieros(ci, nit, nua, afp, nroCuenta, banco) VALUES ('6477617', @nit, @nua, @afp, @nrocta, @banco)" SelectCommand="SELECT * FROM [tb_datos_financieros]">
                                    <InsertParameters>
                                        <asp:Parameter Name="cidoc" />
                                        <asp:ControlParameter Name="nit" ControlID="txt_nit" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_nua" Name="nua" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="ddl_afp" Name="afp" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="txt_nro_cta" Name="nrocta" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_banco" Name="banco" PropertyName="Text" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                                                                <asp:TextBox ID="txt_banco" runat="server" Visible ="false"></asp:TextBox>
                            </div>
                                                    </div>
                       
                        <asp:Button ID="Button1" CssClass ="form-control btn btn-primary mt-1 " runat="server" Text="Aregar Datos" /> 
                    </div>




                                <%-- hasta aqui --%>

                                </div>

          

          </div>
       
        </form>
</asp:Content>


