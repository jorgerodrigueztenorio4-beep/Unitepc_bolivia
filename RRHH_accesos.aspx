<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RRHH_accesos.aspx.vb" Inherits="RRHH_accesos" MasterPageFile="mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat="server">
        <h5>Lista de accesos al sistema</h5>

       
    <section class="content">
      <div class="container-fluid">
        <div class="row">
       
          <div class="col-md-12">
         
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Lista de accesos al sistema</h3>
              </div>
            </div>
              <asp:GridView ID="gv_accesos" runat="server" Font-Names="consolas" Font-Size ="9pt" CssClass="table table-hover" AutoGenerateColumns="False" DataSourceID="sql_ds_accesos" GridLines="None" DataKeyNames="id_usuario">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger" ControlStyle-Font-Size="Small"  />
                    <asp:BoundField DataField="id_usuario" HeaderText="id_usuario" InsertVisible="False" ReadOnly="True" SortExpression="id_usuario" Visible="false" />
                    <asp:BoundField DataField="usuario" HeaderText="usuario" ReadOnly="True" SortExpression="usuario" />
                    <asp:BoundField DataField="rol" HeaderText="rol" SortExpression="rol" />
                    <asp:BoundField DataField="CARDES" HeaderText="CARDES" SortExpression="CARDES" />
                    <asp:BoundField DataField="NombreSede" HeaderText="NombreSede" SortExpression="NombreSede" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sql_ds_accesos" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select us.id_usuario ,(p.nombres+' '+p.primerApellido+' '+p.segundoApellido)as usuario,r.rol,c.CARDES ,s.NombreSede  from tb_usuarios us
inner join tb_personal p on us.ci_usuario=p.ci 
inner join tb_roles r on us.rol= r.id_rol
inner join tb_sedes s on us.sede= s.idSede
inner join tb_carreras c on us.sigla_carrera=c.CARSIGLA 
 where us.rol&lt;&gt;'1'
group by us.id_usuario ,(p.nombres+' '+p.primerApellido+' '+p.segundoApellido),r.rol,c.CARDES ,s.NombreSede 
 order by NombreSede ,rol" DeleteCommand="delete tb_usuarios where id_usuario=@id_usuario">
                <DeleteParameters>
                    <asp:Parameter Name="id_usuario" />
                </DeleteParameters>
              </asp:SqlDataSource>

        </div>
            </div>
          </div>
        </section>







     
</form>
</asp:Content>


