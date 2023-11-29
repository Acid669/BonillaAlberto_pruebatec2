/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.turnos.gestionturnos.servlets;

import com.turnos.gestionturnos.logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CambiarEstadoSv", urlPatterns = {"/CambiarEstadoSv"})
public class CambiarEstadoSv extends HttpServlet {

    //Se crea una instancia de la clase Controladora
    Controladora controlLogica = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //Obtener el ID del turno de los parámetros de la solicitud
        Long idTurno = Long.parseLong(request.getParameter("idTurno"));

        // Cambiar el estado del turno a "Atendido"
        controlLogica.cambiarEstadoAtendido(idTurno);
        
        // Redirigir de nuevo a la página principal de turnos
        response.sendRedirect("TurnoSv");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
