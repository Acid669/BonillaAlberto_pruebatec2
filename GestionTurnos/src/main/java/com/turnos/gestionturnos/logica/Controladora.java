/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.turnos.gestionturnos.logica;

import com.turnos.gestionturnos.persistencia.ControladoraPersistencia;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.stream.Collectors;

public class Controladora {

    //Crear una instancia de ControladoraPersistencia para operaciones de persistencia de datos
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    //CIUDADANO
    //Método  para obtener un ciudadano por su DNI
    private Ciudadano obtenerDni(String dni) {
        return controlPersis.obtenerDni(dni);
    }

    //TURNOS
    //Método para crear un nuevo turno, y que incluya los datos del turno y el ciudadano
    public void crearTurno(String nombre, String apellido, String dni, LocalDate fecha, LocalTime hora, String descripcion, String estado) {
        try {
            //Verificar si el ciudadano con el DNI proporcionado ya existe
            Ciudadano ciudadanoExistente = obtenerDni(dni);

            if (ciudadanoExistente != null) {
                //Si el ciudadano ya existe, asociar el nuevo turno al ciudadano existente
                Turno nuevoTurno = new Turno(fecha, hora, descripcion, estado, ciudadanoExistente);
                controlPersis.crearTurno(nuevoTurno);
            } else {
                //Si el ciudadano no existe, crear uno nuevo y asociar el turno a ese ciudadano
                Ciudadano nuevoCiudadano = new Ciudadano(nombre, apellido, dni);
                Turno nuevoTurno = new Turno(fecha, hora, descripcion, estado, nuevoCiudadano);

                controlPersis.crearTurnoConCiudadano(nuevoTurno);
            }
        } catch (Exception e) {
            System.out.println("Error al crear el turno: " + e.getMessage());
        }
    }

    //Método para obtener la lista de turnos
    public List<Turno> obtenerListaTurnos() {
        return controlPersis.obtenerListaTurnos();
    }
    
    //Método para ordenar la lista de turnos por orden de Id_Turno
    public List<Turno> ordenLista(Turno turno){
    return controlPersis.ordenLista(turno);
    }

    //Método para cambiar el estado de un turno a "Atendido"
    public void cambiarEstadoAtendido(Long idTurno) {
        controlPersis.cambiarEstadoTurno(idTurno, "Atendido");
    }

    //Método para obtener la lista de turnos filtrados por fecha y estado
    public List<Turno> obtenerListaTurnosFiltrados(LocalDate fecha, String estado) {
        return obtenerListaTurnos().stream()
                .filter(turno -> turno.getFecha().isEqual(fecha) && turno.getEstado().equals(estado))
                .collect(Collectors.toList());
    }
    
     //Método para obtener la lista de turnos filtrados por fecha
     public List<Turno> obtenerListaTurnosFecha(LocalDate fecha) {
        return obtenerListaTurnos().stream()
                .filter(turno -> turno.getFecha().isEqual(fecha))
                .collect(Collectors.toList());
    }
}
