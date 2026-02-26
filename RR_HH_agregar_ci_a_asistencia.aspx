<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RR_HH_agregar_ci_a_asistencia.aspx.vb" Inherits="RR_HH_agregar_ci_a_asistencia" MasterPageFile="mp_rr_hh.master" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form  runat ="server" >
    <div class="alert alert-success mt-1 text-md-center text-bold " role="alert">
    <asp:Label ID="lbl_cargo"  runat="server" Text=""></asp:Label>
        </div> 
     <div class=" container-fluid ">
    	<%--<div class="row">--%>
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                Lista  de nuevos doc.
                            </div>
                               <asp:DropDownList ID="ddl_sede" runat="server" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
                                 <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes]"></asp:SqlDataSource>
                                <asp:DropDownList ID="ddl_carrera" runat="server" AutoPostBack="True" DataSourceID="sql_ds_carrera" DataTextField="CARDES" DataValueField="CARSIGLA"></asp:DropDownList>
                                 <asp:SqlDataSource ID="sql_ds_carrera" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_carreras]"></asp:SqlDataSource>
                                 <asp:Button ID="Button3" runat="server" Text="Actualizar Listas" />
                                
                                <asp:GridView ID="gv_lista" runat="server" Font-Size="9pt" AutoGenerateColumns="False" DataSourceID="sql_asistencia">
                                    <Columns>
                                        <asp:BoundField DataField="id_ing_sal" HeaderText="id_ing_sal" InsertVisible="False" ReadOnly="True" SortExpression="id_ing_sal" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="hr_ingreso" HeaderText="hr_ingreso" SortExpression="hr_ingreso" />
                                        <asp:BoundField DataField="hr_salida" HeaderText="hr_salida" SortExpression="hr_salida" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="tema_avance" HeaderText="tema_avance" SortExpression="tema_avance" />
                                        <asp:BoundField DataField="observaciones" HeaderText="observaciones" SortExpression="observaciones" />
                                        <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                                        <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque" />
                                        <asp:BoundField DataField="aula_o_lab" HeaderText="aula_o_lab" SortExpression="aula_o_lab" />
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" SortExpression="id_horario" />
                                        <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede" />
                                        <asp:BoundField DataField="sigla_materia" HeaderText="sigla_materia" SortExpression="sigla_materia" />
                                        <asp:BoundField DataField="cant_est" HeaderText="cant_est" SortExpression="cant_est" />
                                        <asp:BoundField DataField="ip_marcado" HeaderText="ip_marcado" SortExpression="ip_marcado" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="hra_inicio" HeaderText="hra_inicio" SortExpression="hra_inicio" />
                                        <asp:BoundField DataField="hra_fin" HeaderText="hra_fin" SortExpression="hra_fin" />
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                                        <asp:BoundField DataField="horas" HeaderText="horas" SortExpression="horas" />
                                        <asp:BoundField DataField="hora_registro" HeaderText="hora_registro" SortExpression="hora_registro" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_asistencia" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select * from tb_ing_sal 
where gestion='2-2024' and sede=@sede and carrera=@carrera and ci_doc = '0'">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </div>
            
                            <div class="col-md-12 p-3 mb-2 bg-white text-white border border-dark rounded ">
                              <div style="background-color:#ffc107" class="text-md-center  rounded text-bold " role="alert">
                                LISTA
                            </div>
                                <asp:GridView ID="GV_HORARIOS" runat="server" AutoGenerateColumns="False" DataSourceID="SQL_DS_HORARIO" Font-Size="9pt">
                                    <Columns>
                                        <asp:BoundField DataField="id_horario" HeaderText="id_horario" InsertVisible="False" ReadOnly="True" SortExpression="id_horario" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="ci_doc" SortExpression="ci_doc" />
                                        <asp:BoundField DataField="gestion" HeaderText="gestion" SortExpression="gestion" />
                                        <asp:BoundField DataField="hora_inicio" HeaderText="hora_inicio" SortExpression="hora_inicio" />
                                        <asp:BoundField DataField="hora_fin" HeaderText="hora_fin" SortExpression="hora_fin" />
                                        <asp:BoundField DataField="grupo" HeaderText="grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="Column1" HeaderText="Column1" SortExpression="Column1" ReadOnly="True" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="Column2" HeaderText="Column2" SortExpression="Column2" ReadOnly="True" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="tipo_clase" ReadOnly="True" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="NombreSede" HeaderText="NombreSede" SortExpression="NombreSede" />
                                        <asp:BoundField DataField="idSede" HeaderText="idSede" SortExpression="idSede" />
                                        <asp:BoundField DataField="id_rrhh" HeaderText="id_rrhh" SortExpression="id_rrhh" />
                                        <asp:BoundField DataField="dia" HeaderText="dia" SortExpression="dia" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SQL_DS_HORARIO" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT H.id_horario ,H.ci_doc , H.gestion ,hora_inicio ,H.hora_fin ,H.grupo,rtrim(P.codcar) ,P.Materia,RTRIM( P.SiglaP) ,H.tipo_clase as tipo_clase,s.NombreSede ,s.idSede,s.id_rrhh ,h.dia    
FROM tb_horario H 
JOIN tb_designacion D ON D.id_horario = H.id_horario 
JOIN planes_estudios P ON D.id_materia  = P.id_plan 
join tb_sedes s on h.sede =s.idSede 
WHERE H.gestion = '2-2024'  and p.codcar=@carrera and h.sede=@sede">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddl_carrera" Name="carrera" PropertyName="SelectedValue" />
                                        <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                </div>
            </div>
         </div>
        <asp:TextBox ID="txt_siglamat" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_siglah" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_id_horario" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_ci" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_nombre" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_ppa" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_sap" runat="server"></asp:TextBox>
        <asp:GridView ID="gv_existe" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_existe">
            <Columns>
                <asp:BoundField DataField="ci" HeaderText="ci" SortExpression="ci" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sql_ds_existe" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_personal(nombres, primerApellido, segundoApellido, ci, gestion, fecha_registro) VALUES (@nombre, @ppa, @sap, @ci, '1-2024', GETDATE())" SelectCommand="select ci from tb_personal 
where ci=@ci and gestion ='2-2024'" UpdateCommand="UPDATE tb_ing_sal SET ci_doc = @ci WHERE (id_ing_sal = @ingsal)">
            <InsertParameters>
                <asp:ControlParameter ControlID="txt_nombre" Name="nombre" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_ppa" Name="ppa" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_sap" Name="sap" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                <asp:ControlParameter ControlID="txt_id_horario" Name="ingsal" PropertyName="Text" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="txt_siglac" runat="server"></asp:TextBox>
        <asp:TextBox ID="txt_sigla_h" runat="server"></asp:TextBox>
        </form>
</asp:Content>



