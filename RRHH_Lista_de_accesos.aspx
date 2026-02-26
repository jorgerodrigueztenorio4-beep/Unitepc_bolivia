<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RRHH_Lista_de_accesos.aspx.vb" Inherits="RRHH_Lista_de_accesos" MasterPageFile="~/mp_rr_hh.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
       <form id="form1" runat="server">
    <section class="content">
      <div class="container-fluid">
        <div class="row">
       
          <div class="col-md-12">
         
            <div class="card card-indigo">
              <div class="card-header">
                <h3 class="card-title">Lista de Docentes Activos de la Actual Gestión</h3>
              </div>
                <asp:GridView ID="gv_accesos" runat="server" DataSourceID="sql_ds_accesos"></asp:GridView>
              
                <asp:SqlDataSource ID="sql_ds_accesos" runat="server"></asp:SqlDataSource>
              
                <div class="card-body">
                   

                  </div>
            
           
            </div>
          

          </div>
         
        </div>
       
          
      </div>
    </section>
       
    </form>

</asp:Content>


