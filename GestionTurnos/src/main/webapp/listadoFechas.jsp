<%-- 
    Document   : listadoFechas
    Created on : 28 nov 2023, 13:54:56
    Author     : Acid
--%>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="com.turnos.gestionturnos.logica.Turno"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="Components/header.jsp" %>
<%@include file="Components/body.jsp" %>

    <div class="container mt-4">
        <h2>Generar Listado</h2>
        <!-- Formulario para filtrar turnos por fecha -->
        <form action="TurnosFechaSv" method="GET">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="fechaFiltro">Fecha:</label>
                    <input type="date" class="form-control" id="fechaFiltro" name="fecha" required>
                </div>
            </div>
            <!-- Botón para buscar turnos filtrados por fecha -->
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-search"></i><i class="fa-solid fa-magnifying-glass mr-2"></i>Buscar</button>
        </form>
        <!-- Sección de resultados filtrados por fecha -->
        <div class="results-table mt-4">
            <!-- Verificar si hay resultados y mostrar la tabla -->
            <% if (request.getAttribute("turnosFiltrado2") != null && !((List<Turno>) request.getAttribute("turnosFiltrado2")).isEmpty()) { %>
            <h3>Resultados:</h3>
            <!-- Tabla para mostrar los resultados filtrados por fecha -->
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th>Numero de turno</th>
                        <th>Identidficador Ciudadano</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>DNI</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Tramite</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Iterar sobre la lista de turnos filtrados por fecha -->
                    <% for (Turno turno : (List<Turno>) request.getAttribute("turnosFiltrado2")) {%>
                    <tr>
                        <td><%= turno.getId()%></td>
                        <td><%= turno.getCiudadano().getId()%></td>
                        <td><%= turno.getCiudadano().getNombre()%></td>
                        <td><%= turno.getCiudadano().getApellido()%></td>
                        <td><%= turno.getCiudadano().getDni()%></td>
                        <td><%= turno.getFecha().format(DateTimeFormatter.ofPattern("dd/MM/yyyy"))%></td>
                        <td><%= turno.getHora().format(DateTimeFormatter.ofPattern("HH:mm"))%></td>
                        <td><%= turno.getDescripcion()%></td>
                        <td><%= turno.getEstado()%></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <% } else { %>
            <!-- Mensaje si no hay resultados -->
            <p>No hay resultados.</p>
            <% }%>
        </div>
    </div>
    <%@include file="Components/footer.jsp" %>

