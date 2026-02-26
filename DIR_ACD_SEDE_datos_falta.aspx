<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_SEDE_datos_falta.aspx.vb" Inherits="DIR_ACD_SEDE_datos_falta" MasterPageFile="mp_dir_academico_sedes.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">

    <form runat ="server">
       <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#FFCC00" class="text-md-center  rounded text-bold " role="alert">
                               Lista de Datos Docente
                            </div>
                           
        <asp:TextBox ID="txt_vacio" runat="server" Visible="False"></asp:TextBox>
        <asp:GridView ID="gv_datos" runat="server" CssClass ="table-hover mt-1 " AutoGenerateColumns="False" DataSourceID="sql_ds_datos" Font-Names="Arial" Font-Size="9pt">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="NombreSede" HeaderText="NombreSede" SortExpression="NombreSede" />
                <asp:BoundField DataField="CARDES" HeaderText="CARDES" SortExpression="CARDES" />
                <asp:BoundField DataField="nombres" HeaderText="nombres" SortExpression="nombres" />
                <asp:BoundField DataField="apellidos" HeaderText="apellidos" ReadOnly="True" SortExpression="apellidos" />
                <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                <asp:BoundField DataField="extension" HeaderText="extension" SortExpression="extension" />
                <asp:BoundField DataField="fechaNacimiento" HeaderText="fechaNacimiento" SortExpression="fechaNacimiento" />
                <asp:BoundField DataField="estadoCivil" HeaderText="estadoCivil" SortExpression="estadoCivil" />
                <asp:BoundField DataField="genero" HeaderText="genero" SortExpression="genero" />
                <asp:BoundField DataField="direccion" HeaderText="direccion" SortExpression="direccion" />
                <asp:BoundField DataField="nit" HeaderText="nit" SortExpression="nit" />
                <asp:BoundField DataField="nroCuenta" HeaderText="nroCuenta" SortExpression="nroCuenta" />
                <asp:BoundField DataField="banco" HeaderText="banco" SortExpression="banco" />
                <asp:BoundField DataField="telefono" HeaderText="telefono" SortExpression="telefono" />
                <asp:BoundField DataField="celular" HeaderText="celular" SortExpression="celular" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                <asp:BoundField DataField="Semestre" HeaderText="Semestre" SortExpression="Semestre"  Visible ="false" />
                <asp:BoundField DataField="horas" HeaderText="horas" ReadOnly="True" SortExpression="horas" Visible ="false"  />
            </Columns>
            <HeaderStyle BackColor="#86A385" />
        </asp:GridView>
        <asp:SqlDataSource ID="sql_ds_datos" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select s.NombreSede,c.CARDES ,p.nombres ,(p.primerApellido +' '+p.segundoApellido )as apellidos, h.ci_doc,p.extension,p.fechaNacimiento,p.estadoCivil  
/*,g.lic_tec_en*/,p.genero ,p.direccion ,f.nit ,f.nroCuenta ,f.banco ,p.telefono ,p.celular,p.email  ,pl.Materia,pl.Semestre ,(sum(cast(d.horas as int))*20)as horas 
from tb_horario h
join tb_sedes s on h.sede =s.idSede 
join tb_designacion d on d.id_horario = h.id_horario 
join tb_carreras c on d.carrera = c.CARSIGLA 
join tb_personal p on h.ci_doc = p.ci 
--join tb_grado_academico g on h.ci_doc = g.ci 
join tb_datos_financieros f on h.ci_doc =f.ci 
join planes_estudios pl on d.id_materia = pl.id_plan 
where h.gestion ='2-2022' and p.gestion ='2-2022' and f.gestion ='2-2022' and sede=@sede 
group by h.ci_doc,p.nombres,pl.Materia,s.NombreSede,c.CARDES,p.primerApellido,p.segundoApellido ,p.extension,p.fechaNacimiento,p.estadoCivil/*
,g.lic_tec_en*/ ,p.direccion,f.nit ,f.nroCuenta ,f.banco ,p.telefono ,p.celular ,p.email ,pl.Semestre ,p.genero ,p.id
order by h.ci_doc 
">
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
                            </div>
            </div>
         </div>
        <asp:TextBox ID="txt_sede" runat="server" Visible="False"></asp:TextBox>
        </form>



</asp:Content>



