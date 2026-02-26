<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_ultima_lista2.aspx.vb" Inherits="RR_HH_ultima_lista2" MasterPageFile="~/mp_rr_hh.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
      <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border  rounded ">
                              <div style="background-color:#FFFACD" class="text-md-center  rounded text-bold " role="alert">
                               Lista de Materias y Docentes Designados por Carrera
                            </div>
                                <div class="input-group mb-1">
                                     <asp:DropDownList ID="ddl_sede" CssClass="form-control btn btn-default border-dark dropdown-toggle mt-1" runat="server" DataSourceID="sql_sede" DataTextField="NombreSede" DataValueField="idSede" AutoPostBack="True" Font-Size="9pt"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                     <asp:DropDownList ID="ddl_carrera" CssClass="form-control border-dark btn btn-default dropdown-toggle mt-1" runat="server" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA" AutoPostBack="True" Font-Size="9pt"></asp:DropDownList>
                                     <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                    <asp:Button ID="Button1" runat="server" CssClass ="btn btn-outline-primary mt-1 form-control " Text="Imprimir" Visible="False" />
                                </div>
                                
                                <asp:GridView ID="gv_formulario" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_formulario" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="NombreSede" HeaderText="Sede" SortExpression="NombreSede" />
                                        <asp:BoundField DataField="CARDES" HeaderText="Carrera" SortExpression="CARDES" />
                                        <asp:BoundField DataField="nombres" HeaderText="Nombres" SortExpression="nombres" />
                                        <asp:BoundField DataField="apellidos" HeaderText="Apellidos" ReadOnly="True" SortExpression="apellidos" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                                        <asp:BoundField DataField="extension" HeaderText="Extension" SortExpression="extension" />
                                        <asp:BoundField DataField="fechaNacimiento" HeaderText="Fecha de Nacimiento" SortExpression="fechaNacimiento" />
                                        <asp:BoundField DataField="estadoCivil" HeaderText="Estado Civil" SortExpression="estadoCivil" />
                                        <asp:BoundField DataField="genero" HeaderText="Genero" SortExpression="genero" />
                                        <asp:BoundField DataField="direccion" HeaderText="Direccion" SortExpression="direccion" />
                                        <asp:BoundField DataField="nit" HeaderText="NIT" SortExpression="nit" />
                                        <asp:BoundField DataField="nroCuenta" HeaderText="Nro. de Cuenta" SortExpression="nroCuenta" />
                                        <asp:BoundField DataField="banco" HeaderText="Banco" SortExpression="banco" />
                                        <asp:BoundField DataField="telefono" HeaderText="Telefono" SortExpression="telefono" />
                                        <asp:BoundField DataField="celular" HeaderText="Celular" SortExpression="celular" />
                                        <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre" />
                                        <asp:BoundField DataField="horas" HeaderText="Horas" SortExpression="horas" ReadOnly="True" />
                                    </Columns>
                                    <HeaderStyle BackColor="#D4EDDA" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_formulario" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select s.NombreSede,c.CARDES ,p.nombres ,(p.primerApellido +' '+p.segundoApellido )as apellidos, h.ci_doc,p.extension,p.fechaNacimiento,p.estadoCivil  
/*,g.lic_tec_en*/,p.genero ,p.direccion ,f.nit ,f.nroCuenta ,f.banco ,p.telefono ,p.celular ,p.email  ,pl.Materia,pl.Semestre ,(sum(cast(d.horas as int))*20)as horas 
from tb_horario h
join tb_sedes s on h.sede =s.idSede 
join tb_designacion d on d.id_horario = h.id_horario 
join tb_carreras c on d.carrera = c.CARSIGLA 
join tb_personal p on h.ci_doc = p.ci 
--join tb_grado_academico g on h.ci_doc = g.ci 
join tb_datos_financieros f on h.ci_doc =f.ci 
join planes_estudios pl on d.id_materia = pl.id_plan 
where h.gestion ='2-2022' and p.gestion ='2-2022' and f.gestion ='2-2022' and sede=@sede and d.carrera =@carrera
group by h.ci_doc,p.nombres,pl.Materia,s.NombreSede,c.CARDES,p.primerApellido,p.segundoApellido ,p.extension,p.fechaNacimiento,p.estadoCivil/*
,g.lic_tec_en*/ ,p.direccion,f.nit ,f.nroCuenta ,f.banco ,p.telefono ,p.celular ,p.email ,pl.Semestre ,p.genero 
order by h.ci_doc ">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>
            </div>
         </div>
          </form>
</asp:Content>



