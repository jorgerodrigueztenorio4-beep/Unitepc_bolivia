<%@ Page Language="VB" AutoEventWireup="false" CodeFile="act_fijo_enceres.aspx.vb" Inherits="act_fijo_enceres" MasterPageFile="~/mp_activos.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <form runat ="server"  >
         <div class="content">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Formulario 2</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
            <%--  <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">General Form</li>--%>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-6">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Datos de los enceres</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              
                <div class="card-body">
                        <div  class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Ingrese su nro de Ci</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_ci" CssClass="form-control small  "  runat="server" AutoPostBack="True"></asp:TextBox>
 <asp:Label ID="lbl_funcionario" CssClass="form-control mt-1 bg-gradient-green  " runat="server" Text=""></asp:Label>
                       
                    </div>
                  </div>
                      <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Ingrese su Cargo</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_cargo"   CssClass="form-control small  " runat="server"></asp:TextBox>
                   
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1">Descripcion del Material</label>
                      <asp:TextBox ID="txt_des_mat" CssClass ="form-control " runat="server"></asp:TextBox>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Cantidad</label>
                      <asp:DropDownList ID="ddl_cantidad" CssClass ="form-control " runat="server">
                          <asp:ListItem>1</asp:ListItem>
<asp:ListItem>2</asp:ListItem>
<asp:ListItem>3</asp:ListItem>
<asp:ListItem>4</asp:ListItem>
<asp:ListItem>5</asp:ListItem>
<asp:ListItem>6</asp:ListItem>
<asp:ListItem>7</asp:ListItem>
<asp:ListItem>8</asp:ListItem>
<asp:ListItem>9</asp:ListItem>
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
<asp:ListItem>60</asp:ListItem>
<asp:ListItem>61</asp:ListItem>
<asp:ListItem>62</asp:ListItem>
<asp:ListItem>63</asp:ListItem>
<asp:ListItem>64</asp:ListItem>
<asp:ListItem>65</asp:ListItem>
<asp:ListItem>66</asp:ListItem>
<asp:ListItem>67</asp:ListItem>
<asp:ListItem>68</asp:ListItem>
<asp:ListItem>69</asp:ListItem>
<asp:ListItem>70</asp:ListItem>
<asp:ListItem>71</asp:ListItem>
<asp:ListItem>72</asp:ListItem>
<asp:ListItem>73</asp:ListItem>
<asp:ListItem>74</asp:ListItem>
<asp:ListItem>75</asp:ListItem>
<asp:ListItem>76</asp:ListItem>
<asp:ListItem>77</asp:ListItem>
<asp:ListItem>78</asp:ListItem>
<asp:ListItem>79</asp:ListItem>
<asp:ListItem>80</asp:ListItem>
<asp:ListItem>81</asp:ListItem>
<asp:ListItem>82</asp:ListItem>
<asp:ListItem>83</asp:ListItem>
<asp:ListItem>84</asp:ListItem>
<asp:ListItem>85</asp:ListItem>
<asp:ListItem>86</asp:ListItem>
<asp:ListItem>87</asp:ListItem>
<asp:ListItem>88</asp:ListItem>
<asp:ListItem>89</asp:ListItem>
<asp:ListItem>90</asp:ListItem>
<asp:ListItem>91</asp:ListItem>
<asp:ListItem>92</asp:ListItem>
<asp:ListItem>93</asp:ListItem>
<asp:ListItem>94</asp:ListItem>
<asp:ListItem>95</asp:ListItem>
<asp:ListItem>96</asp:ListItem>
<asp:ListItem>97</asp:ListItem>
<asp:ListItem>98</asp:ListItem>
<asp:ListItem>99</asp:ListItem>
<asp:ListItem>100</asp:ListItem>
<asp:ListItem>101</asp:ListItem>
<asp:ListItem>102</asp:ListItem>
<asp:ListItem>103</asp:ListItem>
<asp:ListItem>104</asp:ListItem>
<asp:ListItem>105</asp:ListItem>
<asp:ListItem>106</asp:ListItem>
<asp:ListItem>107</asp:ListItem>
<asp:ListItem>108</asp:ListItem>
<asp:ListItem>109</asp:ListItem>
<asp:ListItem>110</asp:ListItem>
<asp:ListItem>111</asp:ListItem>
<asp:ListItem>112</asp:ListItem>
<asp:ListItem>113</asp:ListItem>
<asp:ListItem>114</asp:ListItem>
<asp:ListItem>115</asp:ListItem>
<asp:ListItem>116</asp:ListItem>
<asp:ListItem>117</asp:ListItem>
<asp:ListItem>118</asp:ListItem>
<asp:ListItem>119</asp:ListItem>
<asp:ListItem>120</asp:ListItem>
<asp:ListItem>121</asp:ListItem>
<asp:ListItem>122</asp:ListItem>
<asp:ListItem>123</asp:ListItem>
<asp:ListItem>124</asp:ListItem>
<asp:ListItem>125</asp:ListItem>
<asp:ListItem>126</asp:ListItem>
<asp:ListItem>127</asp:ListItem>
<asp:ListItem>128</asp:ListItem>
<asp:ListItem>129</asp:ListItem>
<asp:ListItem>130</asp:ListItem>
<asp:ListItem>131</asp:ListItem>
<asp:ListItem>132</asp:ListItem>
<asp:ListItem>133</asp:ListItem>
<asp:ListItem>134</asp:ListItem>
<asp:ListItem>135</asp:ListItem>
<asp:ListItem>136</asp:ListItem>
<asp:ListItem>137</asp:ListItem>
<asp:ListItem>138</asp:ListItem>
<asp:ListItem>139</asp:ListItem>
<asp:ListItem>140</asp:ListItem>
<asp:ListItem>141</asp:ListItem>
<asp:ListItem>142</asp:ListItem>
<asp:ListItem>143</asp:ListItem>
<asp:ListItem>144</asp:ListItem>
<asp:ListItem>145</asp:ListItem>
<asp:ListItem>146</asp:ListItem>
<asp:ListItem>147</asp:ListItem>
<asp:ListItem>148</asp:ListItem>
<asp:ListItem>149</asp:ListItem>
<asp:ListItem>150</asp:ListItem>
<asp:ListItem>151</asp:ListItem>
<asp:ListItem>152</asp:ListItem>
<asp:ListItem>153</asp:ListItem>
<asp:ListItem>154</asp:ListItem>
<asp:ListItem>155</asp:ListItem>
<asp:ListItem>156</asp:ListItem>
<asp:ListItem>157</asp:ListItem>
<asp:ListItem>158</asp:ListItem>
<asp:ListItem>159</asp:ListItem>
<asp:ListItem>160</asp:ListItem>
<asp:ListItem>161</asp:ListItem>
<asp:ListItem>162</asp:ListItem>
<asp:ListItem>163</asp:ListItem>
<asp:ListItem>164</asp:ListItem>
<asp:ListItem>165</asp:ListItem>
<asp:ListItem>166</asp:ListItem>
<asp:ListItem>167</asp:ListItem>
<asp:ListItem>168</asp:ListItem>
<asp:ListItem>169</asp:ListItem>
<asp:ListItem>170</asp:ListItem>
<asp:ListItem>171</asp:ListItem>
<asp:ListItem>172</asp:ListItem>
<asp:ListItem>173</asp:ListItem>
<asp:ListItem>174</asp:ListItem>
<asp:ListItem>175</asp:ListItem>
<asp:ListItem>176</asp:ListItem>
<asp:ListItem>177</asp:ListItem>
<asp:ListItem>178</asp:ListItem>
<asp:ListItem>179</asp:ListItem>
<asp:ListItem>180</asp:ListItem>
<asp:ListItem>181</asp:ListItem>
<asp:ListItem>182</asp:ListItem>
<asp:ListItem>183</asp:ListItem>
<asp:ListItem>184</asp:ListItem>
<asp:ListItem>185</asp:ListItem>
<asp:ListItem>186</asp:ListItem>
<asp:ListItem>187</asp:ListItem>
<asp:ListItem>188</asp:ListItem>
<asp:ListItem>189</asp:ListItem>
<asp:ListItem>190</asp:ListItem>
<asp:ListItem>191</asp:ListItem>
<asp:ListItem>192</asp:ListItem>
<asp:ListItem>193</asp:ListItem>
<asp:ListItem>194</asp:ListItem>
<asp:ListItem>195</asp:ListItem>
<asp:ListItem>196</asp:ListItem>
<asp:ListItem>197</asp:ListItem>
<asp:ListItem>198</asp:ListItem>
<asp:ListItem>199</asp:ListItem>
<asp:ListItem>200</asp:ListItem>

                      </asp:DropDownList>
                  </div>
                   <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Sede</label>
                    <div class="col-sm-8">
                        <asp:DropDownList ID="ddl_sede" runat="server" AutoPostBack="True" DataSourceID="sql_ds_sede" DataTextField="NombreSede" DataValueField="idSede"></asp:DropDownList>
                       
                        <asp:SqlDataSource ID="sql_ds_sede" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_sedes] ORDER BY [NombreSede]"></asp:SqlDataSource>
                       
                    </div>
                  </div>
                       <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Bloque</label>
                    <div class="col-sm-8">
                        <asp:DropDownList ID="ddl_bloque" runat="server" DataSourceID="sql_ds_bloque" DataTextField="nom_bloque" DataValueField="id_bloque"></asp:DropDownList>
                        <asp:SqlDataSource ID="sql_ds_bloque" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" SelectCommand="SELECT * FROM [tb_bloques] WHERE ([id_sede] = @id_sede) ORDER BY [nom_bloque]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_sede" Name="id_sede" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                  </div>
                    <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-4 col-form-label">Oficina o departamento</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txt_of_dep"   CssClass="form-control small  " runat="server"></asp:TextBox>
                       
                    </div>
                  </div>
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <asp:Button ID="Button1" CssClass ="form-control btn btn-primary  " runat="server" Text="Registrar" />
                </div>
         
            </div>
            <!-- /.card -->

            <!-- general form elements -->
            
            <!-- /.card -->

            <!-- Input addon -->
            
            <!-- /.card -->
            <!-- Horizontal Form -->
            
            <!-- /.card -->

          </div>
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-6">
            <!-- Form Element sizes -->
            <div class="card card-success">
              <div class="card-header">
                <h3 class="card-title">Lista de Enceres</h3>
              </div>
              <div class="card-body">
                  <asp:GridView ID="gv_enceres" runat="server" AutoGenerateColumns="False" DataSourceID="sql_ds_enceres" Font-Names="Consolas" Font-Size="9pt">
                      <Columns>
                          <asp:BoundField DataField="id_enceres" HeaderText="id_enceres" InsertVisible="False" ReadOnly="True" SortExpression="id_enceres" Visible ="false"  />
                          <asp:BoundField DataField="ci_funcionario" HeaderText="ci_funcionario" SortExpression="ci_funcionario"  Visible ="false" />
                          <asp:BoundField DataField="nombre_funcionario" HeaderText="nombre_funcionario" SortExpression="nombre_funcionario"  Visible ="false" />
                          <asp:BoundField DataField="cargo" HeaderText="cargo" SortExpression="cargo" />
                          <asp:BoundField DataField="descr_material" HeaderText="descripcion del Material" SortExpression="descr_material" />
                          <asp:BoundField DataField="cantidad" HeaderText="Cantidad" SortExpression="cantidad" />
                          <asp:BoundField DataField="sede" HeaderText="sede" SortExpression="sede"  Visible ="false"  />
                          <asp:BoundField DataField="bloque" HeaderText="bloque" SortExpression="bloque"  Visible ="false" />
                          <asp:BoundField DataField="oficina_departamento" HeaderText="Oficina o Departamento" SortExpression="oficina_departamento" />
                          <asp:BoundField DataField="fecha_registro" HeaderText="Fecha de Registro" SortExpression="fecha_registro" />
                      </Columns>
                      <HeaderStyle BackColor="#9933FF" ForeColor="White" />
                  </asp:GridView>
                  <asp:SqlDataSource ID="sql_ds_enceres" runat="server" ConnectionString="<%$ ConnectionStrings:unitepc_boliviaConnectionString %>" InsertCommand="INSERT INTO tb_inv_enceres(ci_funcionario, nombre_funcionario, cargo, descr_material, cantidad, sede, bloque, oficina_departamento, fecha_registro) VALUES (@ci, @nombre, @cargo, @descripmat, @cant, @sede, @bloqu, @ofdep, GETDATE())" SelectCommand="SELECT * FROM [tb_inv_enceres] WHERE ([ci_funcionario] = @ci_funcionario)">
                      <InsertParameters>
                          <asp:ControlParameter ControlID="txt_ci" Name="ci" PropertyName="Text" />
                          <asp:ControlParameter ControlID="lbl_funcionario" Name="nombre" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_cargo" Name="cargo" PropertyName="Text" />
                          <asp:ControlParameter ControlID="txt_des_mat" Name="descripmat" PropertyName="Text" />
                          <asp:ControlParameter ControlID="ddl_cantidad" Name="cant" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="ddl_sede" Name="sede" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="ddl_bloque" Name="bloqu" PropertyName="SelectedValue" />
                          <asp:ControlParameter ControlID="txt_of_dep" Name="ofdep" PropertyName="Text" />
                      </InsertParameters>
                      <SelectParameters>
                          <asp:ControlParameter ControlID="txt_ci" Name="ci_funcionario" PropertyName="Text" Type="String" />
                      </SelectParameters>
                  </asp:SqlDataSource>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            
            <!-- /.card -->

            <!-- general form elements disabled -->
            
            <!-- /.card -->
            <!-- general form elements disabled -->
            
            <!-- /.card -->
          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>

    </form>
</asp:Content>


