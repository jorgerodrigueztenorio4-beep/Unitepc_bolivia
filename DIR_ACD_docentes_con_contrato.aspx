<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_ACD_docentes_con_contrato.aspx.vb" Inherits="DIR_ACD_docentes_con_contrato" MasterPageFile="mp_dir_academico.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
   <form runat ="server">
           <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<div class="row">
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Programar Horario
                            </div>

                            </div>
            </div>
         </div>
       <asp:GridView ID="gv_contrato" runat="server"></asp:GridView>
       </form>
</asp:Content>


