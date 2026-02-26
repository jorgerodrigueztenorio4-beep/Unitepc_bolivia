<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_subir_clases.aspx.vb" Inherits="DIR_CAR_subir_clases" MasterPageFile="~/mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <form runat="server">

        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Subir Respaldos</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">

                            <li class="breadcrumb-item active">
                                <asp:Label ID="lbl_cargo" runat="server" Text="Label"></asp:Label></li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <!-- AREA CHART -->
                        <div class="card card-indigo">
                            <div class="card-header">
                                <h3 class="card-title">Lista de Asistencia
                                </h3>


                            </div>
                            <div class="card-body">
                                <asp:TextBox ID="txt_fecha" type="date" CssClass="form-control-sm form-control " runat="server" AutoPostBack="True"></asp:TextBox>
                                <asp:GridView ID="gv_datos" runat="server" CssClass="table-hover mt-1   " AutoGenerateColumns="False" DataSourceID="sql_ds_clases" Font-Names="Consolas" Font-Size="8pt" GridLines="None">
                                    <Columns>
                                        <asp:CommandField SelectText="Respaldar" ShowSelectButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-primary " />
                                        <asp:BoundField DataField="id_ing_sal" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_ing_sal" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="Nro.C.I." SortExpression="ci_doc" Visible="true">
                                            <ItemStyle BackColor="#FFFFCC" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="docente" HeaderText="Docente" ReadOnly="True" SortExpression="docente" />
                                        <asp:BoundField DataField="carrera" HeaderText="Carrera" SortExpression="carrera" />
                                        <asp:BoundField DataField="Materia" HeaderText="Materia" SortExpression="Materia" />
                                        <asp:BoundField DataField="sigla_materia" HeaderText="sigla_materia" SortExpression="sigla_materia" Visible="false" />
                                        <asp:BoundField DataField="grupo" HeaderText="Grupo" SortExpression="grupo" />
                                        <asp:BoundField DataField="tipo_clase" HeaderText="Tipo de Clase" SortExpression="tipo_clase" />
                                        <asp:BoundField DataField="hra_inicio" HeaderText="Hra. de Inicio" SortExpression="hra_inicio"></asp:BoundField>
                                        <asp:BoundField DataField="hra_fin" HeaderText="Hra. de Fin" SortExpression="hra_fin"></asp:BoundField>
                                        <asp:BoundField DataField="dia" HeaderText="Dia" SortExpression="dia"></asp:BoundField>
                                        <asp:BoundField DataField="hr_ingreso" HeaderText="Hra. de ingreso" SortExpression="hr_ingreso"></asp:BoundField>
                                        <asp:BoundField DataField="hr_salida" HeaderText="Hra.de Salida" SortExpression="hr_salida"></asp:BoundField>
                                        <asp:BoundField DataField="observaciones" HeaderText="Observaciones" ReadOnly="True" SortExpression="observaciones" />
                                        <asp:BoundField DataField="gestion" HeaderText="Gestion" ReadOnly="True" SortExpression="gestion" />
                                    </Columns>
                                    <HeaderStyle BackColor="#5245C9" ForeColor="White" />
                                    <SelectedRowStyle BackColor="#FFFFB9" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_clases" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="select i.id_ing_sal  ,ci_doc ,(p.nombres +' '+p.primerApellido +' '+p.segundoApellido ) as docente,carrera ,Materia ,sigla_materia,grupo,tipo_clase ,hra_inicio,hra_fin,i.dia  ,hr_ingreso ,hr_salida ,isnull(observaciones ,'Clases en Curso o Por Cursar') as observaciones  ,i.gestion
from tb_ing_sal i
join tb_personal p on i.ci_doc = p.ci 
where p.gestion ='1-2026'  and sede =@sede and carrera =@carrera  and p.ci &lt;&gt;'0'
  and  convert(varchar,hr_ingreso,101 ) =@fecha   and (observaciones ='No se Marco la Salida' or observaciones ='No Marco la Salida' or observaciones ='No Asistio a Clases')   and i.gestion ='1-2026'
order by hra_inicio"
                                    InsertCommand="INSERT INTO tb_respaldos(respaldo, ci_doc, id_ing_sal, fecha_clase, fecha_registro) VALUES (@respaldo, @cidoc, @iding, @fechaclase, GETDATE())" UpdateCommand="UPDATE tb_ing_sal SET hr_ingreso = @hraingre, hr_salida = @hrasal, observaciones = 'Con Respaldo' WHERE (id_ing_sal = @idingsal)">
                                    <InsertParameters>
                                        <asp:ControlParameter ControlID="txt_img_guarda" Name="respaldo" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_ci" Name="cidoc" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_id_ingsal" Name="iding" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_fecha_marcado" Name="fechaclase" PropertyName="Text" Type="DateTime" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_fecha" Name="fecha" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="txt_sigla_car" Name="carrera" PropertyName="Text" />
                                        <asp:ControlParameter ControlID="txt_sede" Name="sede" PropertyName="Text" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="lblingreso" Name="hraingre" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="lblsalida" Name="hrasal" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="txt_id_ingsal" Name="idingsal" PropertyName="Text" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="GV_HABILITAR" runat="server" AutoGenerateColumns="False" DataSourceID="SQL_BLOQUEORESPLDO" Visible="False">
                                    <Columns>
                                        <asp:BoundField DataField="SEDE" HeaderText="SEDE" SortExpression="SEDE" />
                                        <asp:BoundField DataField="carrera" HeaderText="carrera" SortExpression="carrera" />
                                        <asp:BoundField DataField="fecha" HeaderText="fecha" ReadOnly="True" SortExpression="fecha" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SQL_BLOQUEORESPLDO" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT SEDE,carrera ,FORMAT (FECHA_BLOQUEO,'dd/MM/yyyy')as fecha FROM tb_bloqueo_respaldos  "></asp:SqlDataSource>
                            </div>
                            <!-- /.card-body -->
                        </div>


                    </div>
                    <!-- /.col (LEFT) -->
                    <div class="col-md-4">
                        <!-- LINE CHART -->
                        <div class="card card-info">
                            <div class="card-header">
                                <h3 class="card-title">Datos para el Respaldo</h3>


                            </div>
                            <div class="card-body">
                                <h4>Respaldos</h4>
                                <div class="row">

                                    <div class="col-sm-6">

                                        <!-- text input -->
                                        <div class="form-group">
                                            <label>Subir Respaldo de la Clase</label>
                                            <asp:FileUpload ID="FileUpload1" CssClass="form-control form-control-sm" runat="server" />

                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label></label>
                                            <%--<input type="text" class="form-control" placeholder="Enter ..." disabled>--%>
                                            <asp:Button ID="Button1" runat="server" CssClass=" btn-primary form-control btn-sm  " Text="Subir Respaldo" />
                                        </div>
                                    </div>
                                </div>
                                <asp:GridView ID="gv_respaldo" runat="server" CssClass="table table-hover mt-1  " AutoGenerateColumns="False" DataSourceID="sql_ds_respaldos" Font-Names="Consolas" Font-Size="9pt" GridLines="None">
                                    <Columns>
                                        <asp:BoundField DataField="id_respaldo" HeaderText="Id." InsertVisible="False" ReadOnly="True" SortExpression="id_respaldo" />
                                        <asp:BoundField DataField="respaldo" HeaderText="Respaldo" SortExpression="respaldo" />
                                        <asp:BoundField DataField="ci_doc" HeaderText="C.I." SortExpression="ci_doc" />
                                        <asp:BoundField DataField="id_ing_sal" HeaderText="id_ing_sal" SortExpression="id_ing_sal" Visible="false" />
                                        <asp:BoundField DataField="fecha_clase" HeaderText="fecha_clase" SortExpression="fecha_clase" Visible="false" />
                                        <asp:BoundField DataField="fecha_registro" HeaderText="fecha_registro" SortExpression="fecha_registro" />
                                    </Columns>
                                    <HeaderStyle BackColor="Gray" ForeColor="White" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="sql_ds_respaldos" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_respaldos] WHERE ([id_ing_sal] = @id_ing_sal)" UpdateCommand="UPDATE tb_ing_sal SET hr_salida = @salida , observaciones = 'Con respaldo' WHERE (id_ing_sal = @id_sal)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="txt_id_ingsal" Name="id_ing_sal" PropertyName="Text" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="lblsalida" Name="salida" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="txt_id_ingsal" Name="id_sal" PropertyName="Text" Type="DateTime" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="sql_fechas" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [aula1]" UpdateCommand="UPDATE tb_ing_sal SET hr_salida = @salida , observaciones = 'Con respaldo' WHERE (id_ing_sal = @id_sal)">
                                    <UpdateParameters>
                                        <asp:ControlParameter ControlID="lblsalida" Name="salida" PropertyName="Text" Type="DateTime" />
                                        <asp:ControlParameter ControlID="txt_id_ingsal" Name="id_sal" PropertyName="Text" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <!-- text input -->
                                        <div class="form-group">
                                            <label>Hora y Minutos de Ingreso</label>
                                            <div class="input-group mb-1">
                                                <asp:DropDownList ID="ddl_horain" CssClass="form-control form-control-sm" runat="server">
                                                    <asp:ListItem>06</asp:ListItem>
                                                    <asp:ListItem>07</asp:ListItem>
                                                    <asp:ListItem>08</asp:ListItem>
                                                    <asp:ListItem>09</asp:ListItem>
                                                    <asp:ListItem>10</asp:ListItem>
                                                    <asp:ListItem>11</asp:ListItem>
                                                    <asp:ListItem>12</asp:ListItem>
                                                    <asp:ListItem>13</asp:ListItem>
                                                    <asp:ListItem>14</asp:ListItem>
                                                    <asp:ListItem>15</asp:ListItem>
                                                    <asp:ListItem>16</asp:ListItem>
                                                    <asp:ListItem>17</asp:ListItem>
                                                    <asp:ListItem>18</asp:ListItem>
                                                    <asp:ListItem>19</asp:ListItem>
                                                    <asp:ListItem>20</asp:ListItem>
                                                    <asp:ListItem>21</asp:ListItem>
                                                    <asp:ListItem>22</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="ddl_minutosin" CssClass="form-control form-control-sm" runat="server">
                                                    <asp:ListItem>00</asp:ListItem>
                                                    <asp:ListItem>01</asp:ListItem>
                                                    <asp:ListItem>02</asp:ListItem>
                                                    <asp:ListItem>03</asp:ListItem>
                                                    <asp:ListItem>04</asp:ListItem>
                                                    <asp:ListItem>05</asp:ListItem>
                                                    <asp:ListItem>06</asp:ListItem>
                                                    <asp:ListItem>07</asp:ListItem>
                                                    <asp:ListItem>08</asp:ListItem>
                                                    <asp:ListItem>09</asp:ListItem>
                                                    <asp:ListItem>10</asp:ListItem>
                                                    <asp:ListItem>11</asp:ListItem>
                                                    <asp:ListItem>12</asp:ListItem>
                                                    <asp:ListItem>13</asp:ListItem>
                                                    <asp:ListItem>14</asp:ListItem>
                                                    <asp:ListItem>15</asp:ListItem>
                                                    <asp:ListItem>16</asp:ListItem>
                                                    <asp:ListItem>17</asp:ListItem>
                                                    <asp:ListItem>18</asp:ListItem>
                                                    <asp:ListItem>19</asp:ListItem>
                                                    <asp:ListItem>20</asp:ListItem>
                                                    <asp:ListItem>21</asp:ListItem>
                                                    <asp:ListItem>22</asp:ListItem>
                                                    <asp:ListItem>23</asp:ListItem>
                                                    <asp:ListItem>24</asp:ListItem>
                                                    <asp:ListItem>25</asp:ListItem>
                                                    <asp:ListItem>26</asp:ListItem>
                                                    <asp:ListItem>27</asp:ListItem>
                                                    <asp:ListItem>28</asp:ListItem>
                                                    <asp:ListItem>29</asp:ListItem>
                                                    <asp:ListItem>30</asp:ListItem>
                                                    <asp:ListItem>31</asp:ListItem>
                                                    <asp:ListItem>32</asp:ListItem>
                                                    <asp:ListItem>33</asp:ListItem>
                                                    <asp:ListItem>34</asp:ListItem>
                                                    <asp:ListItem>35</asp:ListItem>
                                                    <asp:ListItem>36</asp:ListItem>
                                                    <asp:ListItem>37</asp:ListItem>
                                                    <asp:ListItem>38</asp:ListItem>
                                                    <asp:ListItem>39</asp:ListItem>
                                                    <asp:ListItem>40</asp:ListItem>
                                                    <asp:ListItem>41</asp:ListItem>
                                                    <asp:ListItem>42</asp:ListItem>
                                                    <asp:ListItem>43</asp:ListItem>
                                                    <asp:ListItem>44</asp:ListItem>
                                                    <asp:ListItem>45</asp:ListItem>
                                                    <asp:ListItem>46</asp:ListItem>
                                                    <asp:ListItem>47</asp:ListItem>
                                                    <asp:ListItem>48</asp:ListItem>
                                                    <asp:ListItem>49</asp:ListItem>
                                                    <asp:ListItem>50</asp:ListItem>
                                                    <asp:ListItem>51</asp:ListItem>
                                                    <asp:ListItem>52</asp:ListItem>
                                                    <asp:ListItem>53</asp:ListItem>
                                                    <asp:ListItem>54</asp:ListItem>
                                                    <asp:ListItem>55</asp:ListItem>
                                                    <asp:ListItem>56</asp:ListItem>
                                                    <asp:ListItem>57</asp:ListItem>
                                                    <asp:ListItem>58</asp:ListItem>
                                                    <asp:ListItem>59</asp:ListItem>

                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="form-group">
                                            <label>Hora y Minutos de Salida</label>
                                            <div class="input-group mb-1">
                                                <asp:DropDownList ID="ddl_horasal" CssClass="form-control form-control-sm" runat="server">
                                                    <asp:ListItem>06</asp:ListItem>
                                                    <asp:ListItem>07</asp:ListItem>
                                                    <asp:ListItem>08</asp:ListItem>
                                                    <asp:ListItem>09</asp:ListItem>
                                                    <asp:ListItem>10</asp:ListItem>
                                                    <asp:ListItem>11</asp:ListItem>
                                                    <asp:ListItem>12</asp:ListItem>
                                                    <asp:ListItem>13</asp:ListItem>
                                                    <asp:ListItem>14</asp:ListItem>
                                                    <asp:ListItem>15</asp:ListItem>
                                                    <asp:ListItem>16</asp:ListItem>
                                                    <asp:ListItem>17</asp:ListItem>
                                                    <asp:ListItem>18</asp:ListItem>
                                                    <asp:ListItem>19</asp:ListItem>
                                                    <asp:ListItem>20</asp:ListItem>
                                                    <asp:ListItem>21</asp:ListItem>
                                                    <asp:ListItem>22</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="ddl_minsal" CssClass="form-control form-control-sm" runat="server">
                                                    <asp:ListItem>00</asp:ListItem>
                                                    <asp:ListItem>01</asp:ListItem>
                                                    <asp:ListItem>02</asp:ListItem>
                                                    <asp:ListItem>03</asp:ListItem>
                                                    <asp:ListItem>04</asp:ListItem>
                                                    <asp:ListItem>05</asp:ListItem>
                                                    <asp:ListItem>06</asp:ListItem>
                                                    <asp:ListItem>07</asp:ListItem>
                                                    <asp:ListItem>08</asp:ListItem>
                                                    <asp:ListItem>09</asp:ListItem>
                                                    <asp:ListItem>10</asp:ListItem>
                                                    <asp:ListItem>11</asp:ListItem>
                                                    <asp:ListItem>12</asp:ListItem>
                                                    <asp:ListItem>13</asp:ListItem>
                                                    <asp:ListItem>14</asp:ListItem>
                                                    <asp:ListItem>15</asp:ListItem>
                                                    <asp:ListItem>16</asp:ListItem>
                                                    <asp:ListItem>17</asp:ListItem>
                                                    <asp:ListItem>18</asp:ListItem>
                                                    <asp:ListItem>19</asp:ListItem>
                                                    <asp:ListItem>20</asp:ListItem>
                                                    <asp:ListItem>21</asp:ListItem>
                                                    <asp:ListItem>22</asp:ListItem>
                                                    <asp:ListItem>23</asp:ListItem>
                                                    <asp:ListItem>24</asp:ListItem>
                                                    <asp:ListItem>25</asp:ListItem>
                                                    <asp:ListItem>26</asp:ListItem>
                                                    <asp:ListItem>27</asp:ListItem>
                                                    <asp:ListItem>28</asp:ListItem>
                                                    <asp:ListItem>29</asp:ListItem>
                                                    <asp:ListItem>30</asp:ListItem>
                                                    <asp:ListItem>31</asp:ListItem>
                                                    <asp:ListItem>32</asp:ListItem>
                                                    <asp:ListItem>33</asp:ListItem>
                                                    <asp:ListItem>34</asp:ListItem>
                                                    <asp:ListItem>35</asp:ListItem>
                                                    <asp:ListItem>36</asp:ListItem>
                                                    <asp:ListItem>37</asp:ListItem>
                                                    <asp:ListItem>38</asp:ListItem>
                                                    <asp:ListItem>39</asp:ListItem>
                                                    <asp:ListItem>40</asp:ListItem>
                                                    <asp:ListItem>41</asp:ListItem>
                                                    <asp:ListItem>42</asp:ListItem>
                                                    <asp:ListItem>43</asp:ListItem>
                                                    <asp:ListItem>44</asp:ListItem>
                                                    <asp:ListItem>45</asp:ListItem>
                                                    <asp:ListItem>46</asp:ListItem>
                                                    <asp:ListItem>47</asp:ListItem>
                                                    <asp:ListItem>48</asp:ListItem>
                                                    <asp:ListItem>49</asp:ListItem>
                                                    <asp:ListItem>50</asp:ListItem>
                                                    <asp:ListItem>51</asp:ListItem>
                                                    <asp:ListItem>52</asp:ListItem>
                                                    <asp:ListItem>53</asp:ListItem>
                                                    <asp:ListItem>54</asp:ListItem>
                                                    <asp:ListItem>55</asp:ListItem>
                                                    <asp:ListItem>56</asp:ListItem>
                                                    <asp:ListItem>57</asp:ListItem>
                                                    <asp:ListItem>58</asp:ListItem>
                                                    <asp:ListItem>59</asp:ListItem>

                                                </asp:DropDownList>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary mt-1 form-control  " Text="Actualizar Datos de Ingreso y Salida" />
                                <asp:TextBox ID="txt_id_ingsal" runat="server" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="txt_fecha_marcado" runat="server" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="txt_ci" runat="server" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="txt_img_guarda" runat="server" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="txt_hraingreso" runat="server" Height="26px" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="txt_hrasalida" runat="server" Visible="false"></asp:TextBox>
                                <asp:Label ID="lblsalida" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:Label ID="lblingreso" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:Label ID="lblMensaje" runat="server" Text="Label" Visible="false"></asp:Label>
                                <asp:TextBox ID="txt_observacion" runat="server" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="txt_sigla_car" runat="server" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="txt_sede" runat="server" Visible="false"></asp:TextBox>

                                <asp:TextBox ID="txt_hrainicioO" runat="server" Visible="false"></asp:TextBox>
                                <asp:TextBox ID="txt_hrafinO" runat="server" Visible="false"></asp:TextBox>

                            </div>

                        </div>

                    </div>

                </div>


            </div>

            </div>
        
      </div>
        </section>

        </div>

    </form>
</asp:Content>


