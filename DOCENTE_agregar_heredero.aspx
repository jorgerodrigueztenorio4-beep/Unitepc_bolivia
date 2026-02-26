<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DOCENTE_agregar_heredero.aspx.vb" Inherits="DOCENTE_agregar_heredero" MasterPageFile="~/mp_docentes.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
       <form runat ="server">
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Personales del Docente
                            </div>
                                <asp:TextBox ID="txt_nombres" CssClass ="form-control mt-1 " placeholder="Nombres del Heredero" runat="server"></asp:TextBox>
                                <asp:TextBox ID="txt_apellidos" CssClass ="form-control mt-1 " placeholder="Apellidos del Heredero" runat="server"></asp:TextBox>
                                <asp:DropDownList ID="ddl_edad" CssClass="form-control  btn btn-default dropdown-toggle mt-1" runat="server">
                                    <asp:ListItem>Edad del Heredero</asp:ListItem>
                                    <asp:ListItem>	1	</asp:ListItem>
<asp:ListItem>	2	</asp:ListItem>
<asp:ListItem>	3	</asp:ListItem>
<asp:ListItem>	4	</asp:ListItem>
<asp:ListItem>	5	</asp:ListItem>
<asp:ListItem>	6	</asp:ListItem>
<asp:ListItem>	7	</asp:ListItem>
<asp:ListItem>	8	</asp:ListItem>
<asp:ListItem>	9	</asp:ListItem>
<asp:ListItem>	10	</asp:ListItem>
<asp:ListItem>	11	</asp:ListItem>
<asp:ListItem>	12	</asp:ListItem>
<asp:ListItem>	13	</asp:ListItem>
<asp:ListItem>	14	</asp:ListItem>
<asp:ListItem>	15	</asp:ListItem>
<asp:ListItem>	16	</asp:ListItem>
<asp:ListItem>	17	</asp:ListItem>
<asp:ListItem>	18	</asp:ListItem>
<asp:ListItem>	19	</asp:ListItem>
<asp:ListItem>	20	</asp:ListItem>
<asp:ListItem>	21	</asp:ListItem>
<asp:ListItem>	22	</asp:ListItem>
<asp:ListItem>	23	</asp:ListItem>
<asp:ListItem>	24	</asp:ListItem>
<asp:ListItem>	25	</asp:ListItem>
<asp:ListItem>	26	</asp:ListItem>
<asp:ListItem>	27	</asp:ListItem>
<asp:ListItem>	28	</asp:ListItem>
<asp:ListItem>	29	</asp:ListItem>
<asp:ListItem>	30	</asp:ListItem>
<asp:ListItem>	31	</asp:ListItem>
<asp:ListItem>	32	</asp:ListItem>
<asp:ListItem>	33	</asp:ListItem>
<asp:ListItem>	34	</asp:ListItem>
<asp:ListItem>	35	</asp:ListItem>
<asp:ListItem>	36	</asp:ListItem>
<asp:ListItem>	37	</asp:ListItem>
<asp:ListItem>	38	</asp:ListItem>
<asp:ListItem>	39	</asp:ListItem>
<asp:ListItem>	40	</asp:ListItem>
<asp:ListItem>	41	</asp:ListItem>
<asp:ListItem>	42	</asp:ListItem>
<asp:ListItem>	43	</asp:ListItem>
<asp:ListItem>	44	</asp:ListItem>
<asp:ListItem>	45	</asp:ListItem>
<asp:ListItem>	46	</asp:ListItem>
<asp:ListItem>	47	</asp:ListItem>
<asp:ListItem>	48	</asp:ListItem>
<asp:ListItem>	49	</asp:ListItem>
<asp:ListItem>	50	</asp:ListItem>
<asp:ListItem>	51	</asp:ListItem>
<asp:ListItem>	52	</asp:ListItem>
<asp:ListItem>	53	</asp:ListItem>
<asp:ListItem>	54	</asp:ListItem>
<asp:ListItem>	55	</asp:ListItem>
<asp:ListItem>	56	</asp:ListItem>
<asp:ListItem>	57	</asp:ListItem>
<asp:ListItem>	58	</asp:ListItem>
<asp:ListItem>	59	</asp:ListItem>
<asp:ListItem>	60	</asp:ListItem>
<asp:ListItem>	61	</asp:ListItem>
<asp:ListItem>	62	</asp:ListItem>
<asp:ListItem>	63	</asp:ListItem>
<asp:ListItem>	64	</asp:ListItem>
<asp:ListItem>	65	</asp:ListItem>
<asp:ListItem>	66	</asp:ListItem>
<asp:ListItem>	67	</asp:ListItem>
<asp:ListItem>	68	</asp:ListItem>
<asp:ListItem>	69	</asp:ListItem>
<asp:ListItem>	70	</asp:ListItem>
<asp:ListItem>	71	</asp:ListItem>
<asp:ListItem>	72	</asp:ListItem>
<asp:ListItem>	73	</asp:ListItem>
<asp:ListItem>	74	</asp:ListItem>
<asp:ListItem>	75	</asp:ListItem>
<asp:ListItem>	76	</asp:ListItem>
<asp:ListItem>	77	</asp:ListItem>
<asp:ListItem>	78	</asp:ListItem>
<asp:ListItem>	79	</asp:ListItem>
<asp:ListItem>	80	</asp:ListItem>
<asp:ListItem>	81	</asp:ListItem>
<asp:ListItem>	82	</asp:ListItem>
<asp:ListItem>	83	</asp:ListItem>
<asp:ListItem>	84	</asp:ListItem>
<asp:ListItem>	85	</asp:ListItem>
<asp:ListItem>	86	</asp:ListItem>
<asp:ListItem>	87	</asp:ListItem>
<asp:ListItem>	88	</asp:ListItem>
<asp:ListItem>	89	</asp:ListItem>
<asp:ListItem>	90	</asp:ListItem>
<asp:ListItem>	91	</asp:ListItem>
<asp:ListItem>	92	</asp:ListItem>
<asp:ListItem>	93	</asp:ListItem>
<asp:ListItem>	94	</asp:ListItem>
<asp:ListItem>	95	</asp:ListItem>
<asp:ListItem>	96	</asp:ListItem>
<asp:ListItem>	97	</asp:ListItem>
<asp:ListItem>	98	</asp:ListItem>
<asp:ListItem>	99	</asp:ListItem>
<asp:ListItem>	100	</asp:ListItem>
                                    
                                </asp:DropDownList>
                                <asp:DropDownList ID="ddl_patentesco" CssClass="form-control  btn btn-default dropdown-toggle mt-1" runat="server">
                                    <asp:ListItem>Seleccione el Parentesco</asp:ListItem>
                                    <asp:ListItem>Padre</asp:ListItem>
                                    <asp:ListItem>Madre</asp:ListItem>
                                    <asp:ListItem>Hijo/a</asp:ListItem>
                                    <asp:ListItem>Esposo/a</asp:ListItem>
                                    <asp:ListItem>Tio/a</asp:ListItem>
                                    <asp:ListItem>Abuelo/a</asp:ListItem>
                                    <asp:ListItem>Primo/a</asp:ListItem>
                                    <asp:ListItem>Sobrino/a</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="Button1" CssClass="btn btn-primary form-control mt-1 " runat="server" Text="Agregar Informacion" />
                                <asp:TextBox ID="txt_ci" runat="server" Visible ="false" ></asp:TextBox>
                                </div>
                  <div class="col-md-6 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                                Datos Personales del Docente
                            </div>
                      <asp:GridView ID="gv_herederos" runat="server" CssClass="table table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_herederos" Font-Size="9pt">
                          <Columns>
                              <asp:BoundField DataField="id_herederos" HeaderText="I.D." InsertVisible="False" ReadOnly="True" SortExpression="id_herederos" />
                              <asp:BoundField DataField="nombres" HeaderText="Nombres" SortExpression="nombres" />
                              <asp:BoundField DataField="apellidos" HeaderText="Apellidos" SortExpression="apellidos" />
                              <asp:BoundField DataField="edad" HeaderText="Edad" SortExpression="edad" />
                              <asp:BoundField DataField="parentesco" HeaderText="Parentesco" SortExpression="parentesco" />
                              <asp:BoundField DataField="ci_docente" HeaderText="C.I. del Docente" SortExpression="ci_docente" />
                              <asp:BoundField DataField="docente_id" HeaderText="docente_id" SortExpression="docente_id" Visible ="false"  />
                          </Columns>
                              </asp:GridView>
                              <asp:SqlDataSource ID="sql_ds_herederos" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_herederos] WHERE ([ci_docente] = @ci_docente)" InsertCommand="INSERT INTO tb_herederos(nombres, apellidos, edad, parentesco, ci_docente) VALUES (@nombres, @apellidos, @edad, @parentesco, @cidoc)">
                                  <InsertParameters>
                                      <asp:ControlParameter ControlID="txt_nombres" Name="nombres" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="txt_apellidos" Name="apellidos" PropertyName="Text" />
                                      <asp:ControlParameter ControlID="ddl_edad" Name="edad" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="ddl_patentesco" Name="parentesco" PropertyName="SelectedValue" />
                                      <asp:ControlParameter ControlID="txt_ci" Name="cidoc" PropertyName="Text" />
                                  </InsertParameters>
                                  <SelectParameters>
                                      <asp:ControlParameter ControlID="txt_ci" Name="ci_docente" PropertyName="Text" Type="String" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                       </div>
             </div>
            </div>
         
           </form>
</asp:Content>


