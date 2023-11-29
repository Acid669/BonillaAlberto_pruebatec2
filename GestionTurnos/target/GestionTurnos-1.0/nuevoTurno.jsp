<%-- 
    Document   : nuevoTurno
    Created on : 26 nov 2023, 12:53:53
    Author     : Acid
--%>

<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Components/header.jsp" %>
<%@include file="Components/body.jsp" %>

<div class="container mt-4">
   
    <h2>Formulario Turno</h2>
    
    <!-- Formulario para la creación de turnos -->
    <form action="TurnoSv" method="POST" accept-charset="UTF-8">
        <div class="form-row">
            <!-- Campo de entrada para el nombre -->
            <div class="form-group col-md-6">
                <label for="nombre">Nombre:</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
                <!-- Manejo de errores para el nombre -->
                <% String errorNombre = (String) request.getAttribute("errorNombre"); %>
                <% if (errorNombre != null) { %>
                <span style="color: red"><%=errorNombre%></span>
                <% } %>
            </div>
            
            <!-- Campo de entrada para los apellidos -->
            <div class="form-group col-md-6">
                <label for="apellido">Apellidos:</label>
                <input type="text" class="form-control" id="apellido" name="apellido" required>
                <!-- Manejo de errores para los apellidos -->
                <% String errorApellido = (String) request.getAttribute("errorApellido"); %>
                <% if (errorApellido != null) { %>
                <span style="color: red"><%=errorApellido%></span>
                <% } %>
            </div>
        </div>
        
        <div class="form-row">
            <!-- Campo de entrada para el DNI -->
            <div class="form-group col-md-6">
                <label for="dni">DNI:</label>
                <input type="text" class="form-control" id="dni" name="dni" required>
                <!-- Manejo de errores para el DNI -->
                <% String errorDni = (String) request.getAttribute("errorDni"); %>
                <% if (errorDni != null) { %>
                <span style="color: red"><%=errorDni%></span>
                <% } %>
            </div>
            
            <!-- Campo de entrada para la fecha -->
            <div class="form-group col-md-3">
                <label for="fecha">Fecha:</label>
                <input type="date" class="form-control" id="fecha" name="fecha" required>
                <!-- Manejo de errores para la fecha -->
                <% String errorFecha = (String) request.getAttribute("errorFecha"); %>
                <% if (errorFecha != null) { %>
                <span style="color: red"><%=errorFecha%></span>
                <% } %>
            </div>
            
            <!-- Campo de entrada para la hora -->
            <div class="form-group col-md-3">
                <label for="hora">Hora:</label>
                <input type="time" class="form-control" id="hora" name="hora" required>
                <!-- Manejo de errores para la hora -->
                <% String errorHora = (String) request.getAttribute("errorHora"); %>
                <% if (errorHora != null) { %>
                <span style="color: red"><%=errorHora%></span>
                <% } %>
            </div>
        </div>
        
        <!-- Campo de entrada para la descripción del trámite -->
        <div class="form-group">
            <label for="descripcion">Tramite:</label>
            <textarea class="form-control" id="descripcion" name="descripcion" rows="3" required></textarea>
        </div>
        
        <!-- Campo oculto para el estado del turno -->
        <div class="form-group">
            <input type="text" class="form-control" id="estado" name="estado" value="En espera" hidden>
        </div>
        
        <!-- Botón para enviar el formulario -->
        <button type="submit" class="btn btn-primary"><i class="fas fa-plus mr-2"></i>Crear Turno</button>
    </form>
</div>
<%@include file="Components/footer.jsp" %>

