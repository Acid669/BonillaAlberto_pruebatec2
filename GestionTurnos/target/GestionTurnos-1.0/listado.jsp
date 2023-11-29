<%-- 
    Document   : listado
    Created on : 26 nov 2023, 13:02:10
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
    <!-- Formulario para generar el listado de turnos -->
    <form action="TurnoSv" method="GET" role="form" style="display: inline">
        <button type="submit" class="btn btn-primary"><i class="fas fa-list mr-2"></i>Generar Listado</button>
    </form>
    <!-- Sección de resultados -->
    <div class="results-table mt-4">
        <!-- Verificar si hay resultados y mostrar la tabla -->
        <% if (request.getAttribute("turnos") != null) { %>
        <!-- Tabla para mostrar la lista entera de turnos creados -->
        <h3>Resultados:</h3>
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
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <!-- Iterar sobre la lista de turnos -->
                <% for (Turno turno : (List<Turno>) request.getAttribute("turnos")) {%>
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
                    <td>
                        <!-- Botón para cambiar el estado a "Atendido" -->
                        <% if (!"Atendido".equals(turno.getEstado())) {%>
                        <form action="CambiarEstadoSv" method="post">
                            <input type="hidden" name="idTurno" value="<%= turno.getId()%>">
                            <button type="submit" class="btn btn-primary"><i class="fas fa-edit mr-2"></i>Modificar</button>
                        </form>
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% }%>
    </div>
</div>

<div class="container mt-4">
    <!-- Formulario para filtrar los turnos -->
    <form action="TurnosFiltradosSv" method="GET">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="fechaFiltro">Fecha:</label>
                <input type="date" class="form-control" id="fechaFiltro" name="fecha" required>
            </div>
            <div class="form-group col-md-6">
                <label for="estadoFiltro">Estado:</label>
                <select class="form-control" id="estadoFiltro" name="estado">
                    <option value="En espera">En espera</option>
                    <option value="Atendido">Atendido</option>
                </select>
            </div>
        </div>
        <!-- Botón para buscar turnos filtrados -->
        <button type="submit" class="btn btn-primary">
            <i class="fas fa-search"></i><i class="fa-solid fa-magnifying-glass mr-2"></i>Buscar</button>
    </form>
    <!-- Sección de resultados filtrados -->
    <div class="results-table mt-4">
        <!-- Verificar si hay resultados y mostrar la tabla -->
        <% if (request.getAttribute("turnosFiltrado") != null && !((List<Turno>) request.getAttribute("turnosFiltrado")).isEmpty()) { %>
        <h3>Resultados:</h3>
        <!-- Tabla para mostrar los resultados filtrados -->
        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th>Numero de turno</th>
                    <th>Id</th>
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
                <!-- Iterar sobre la lista de turnos filtrados -->
                <% for (Turno turno : (List<Turno>) request.getAttribute("turnosFiltrado")) {%>
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
        <p>No hay resultados.</p>
        <% }%>
    </div>
</div>
<%@include file="Components/footer.jsp" %>
