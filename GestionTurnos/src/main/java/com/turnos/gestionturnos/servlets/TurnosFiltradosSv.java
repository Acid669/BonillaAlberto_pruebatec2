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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TurnosFiltradosSv", urlPatterns = {"/TurnosFiltradosSv"})
public class TurnosFiltradosSv extends HttpServlet {

    //Se crea una instancia de la clase Controladora
    Controladora controlLogica = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Obtener parámetros de la solicitud GET
        String fechaParam = request.getParameter("fecha");
        String estado = request.getParameter("estado");

        //Validar que la fecha no sea nula o vacía
        if (fechaParam == null || fechaParam.isEmpty()) {
            //Manejar la validación fallida para la fecha
            response.sendRedirect("error.jsp");
            return;
        }
        
        //Convertir el parámetro de fecha a LocalDate
        LocalDate fecha = LocalDate.parse(fechaParam);
        
        //Obtener la lista de turnos filtrados por fecha y estado
        List<Turno> listaTurnoFiltrado = controlLogica.obtenerListaTurnosFiltrados(fecha, estado);

        //Establecer la lista de turnos filtrados como atributo de la solicitud
        request.setAttribute("turnosFiltrado", listaTurnoFiltrado);

        //Redirigir a la página principal de turnos
        request.getRequestDispatcher("listado.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
