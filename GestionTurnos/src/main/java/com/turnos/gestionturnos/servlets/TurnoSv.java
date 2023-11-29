/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.turnos.gestionturnos.servlets;

import com.turnos.gestionturnos.logica.Controladora;
import com.turnos.gestionturnos.logica.Turno;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TurnoSv", urlPatterns = {"/TurnoSv"})
public class TurnoSv extends HttpServlet {

    //Se crea una instancia de la clase Controladora
    Controladora controlLogica = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Turno turno = new Turno(); 
       //Obtener la lista de turnos desde la lógica de negocio
        List<Turno> listaTurno = controlLogica.ordenLista(turno);
        
        //Establecer la lista de turnos como un atributo en la solicitud
        request.setAttribute("turnos", listaTurno);

        // Redirigir a la página index.jsp para mostrar la lista de turnos
        request.getRequestDispatcher("listado.jsp").forward(request, response);
    }

   @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    // Obtener los valores de los parámetros del formulario
    String fechaParam = request.getParameter("fecha");
    String horaParam = request.getParameter("hora");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String dni = request.getParameter("dni");
    String descripcion = request.getParameter("descripcion");
    String estado = request.getParameter("estado");

    // Validar campos obligatorios
    if (fechaParam == null || fechaParam.isEmpty() || horaParam == null || horaParam.isEmpty() ||
        nombre.isEmpty() || apellido.isEmpty() || dni.isEmpty() || descripcion.isEmpty() || estado.isEmpty()) {
        // Manejar la validación fallida para campos obligatorios
        request.setAttribute("error", "Todos los campos son obligatorios");
        request.getRequestDispatcher("nuevoTurno.jsp").forward(request, response);
        return;
    }

    // Validar formato de fecha
    LocalDate fechaFormat = null;
    try {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        fechaFormat = LocalDate.parse(fechaParam, formatter);
    } catch (DateTimeParseException e) {
        request.setAttribute("errorFecha", "Formato de fecha incorrecto");
        request.getRequestDispatcher("nuevoTurno.jsp").forward(request, response);
        return;
    }

    // Validar formato de hora
    LocalTime hora = null;
    try {
        hora = LocalTime.parse(horaParam);
    } catch (DateTimeParseException e) {
        request.setAttribute("errorHora", "Formato de hora incorrecto");
        request.getRequestDispatcher("nuevoTurno.jsp").forward(request, response);
        return;
    }

    // Validar formato de DNI
    if (!dni.matches("\\d{8}[a-zA-Z]")) {
        request.setAttribute("errorDni", "El formato del DNI no es válido");
        request.getRequestDispatcher("nuevoTurno.jsp").forward(request, response);
        return;
    }

    // Validar nombre
    if (nombre == null || nombre.isEmpty() || !nombre.matches("^[a-zA-Z\\s]+$")) {
        request.setAttribute("errorNombre", "Nombre incorrecto, por favor ingrese un nombre válido. Letras (a-zA-Z)");
        request.getRequestDispatcher("nuevoTurno.jsp").forward(request, response);
        return;
    }

    // Validar apellido
    if (apellido == null || apellido.isEmpty() || !apellido.matches("^[a-zA-Z\\s]+$")) {
        request.setAttribute("errorApellido", "Apellido incorrecto, por favor ingrese un apellido válido. Letras (a-zA-Z)");
        request.getRequestDispatcher("nuevoTurno.jsp").forward(request, response);
        return;
    }

    // Crear un objeto Turno con los datos proporcionados y persistirlo
    controlLogica.crearTurno(nombre, apellido, dni, fechaFormat, hora, descripcion, estado);
    request.getRequestDispatcher("nuevoTurno.jsp").forward(request, response);
}



    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
