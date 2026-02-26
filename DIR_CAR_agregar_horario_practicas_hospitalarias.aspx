<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DIR_CAR_agregar_horario_practicas_hospitalarias.aspx.vb" Inherits="DIR_CAR_agregar_horario_practicas_hospitalarias" MasterPageFile="mp_dir_car.master" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <div class="container mt-4">
  <div class="row">

    <!-- Columna izquierda: Formulario -->
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">
          <strong>Formulario</strong>
        </div>
        <div class="card-body">

          <form>
            <div class="form-group">
              <label for="nombre">Nombre</label>
              <input type="text" class="form-control" id="nombre" placeholder="Ingrese nombre">
            </div>

            <div class="form-group">
              <label for="email">Correo</label>
              <input type="email" class="form-control" id="email" placeholder="Ingrese correo">
            </div>

            <div class="form-group">
              <label for="rol">Rol</label>
              <select class="form-control" id="rol">
                <option>Administrador</option>
                <option>Usuario</option>
              </select>
            </div>

            <button type="submit" class="btn btn-primary btn-block">
              Guardar
            </button>
          </form>

        </div>
      </div>
    </div>

    <!-- Columna derecha: Lista -->
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">
          <strong>Lista de registros</strong>
        </div>
        <div class="card-body p-0">

          <ul class="list-group list-group-flush">
            <li class="list-group-item">Juan Pérez</li>
            <li class="list-group-item">María López</li>
            <li class="list-group-item">Carlos Rojas</li>
          </ul>

        </div>
      </div>
    </div>

  </div>
</div>
</asp:Content>


