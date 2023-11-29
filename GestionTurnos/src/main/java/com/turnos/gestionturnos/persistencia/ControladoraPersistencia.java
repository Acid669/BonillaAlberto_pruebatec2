/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.turnos.gestionturnos.persistencia;

import com.turnos.gestionturnos.logica.Ciudadano;
import com.turnos.gestionturnos.logica.Turno;
import java.util.Comparator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {

    //Se crean instancias de los controladores JPA para las entidades Ciudadano y Turno
    CiudadanoJpaController ciudadanoJpa = new CiudadanoJpaController();
    TurnoJpaController turnoJpa = new TurnoJpaController();

    //TURNOS
    //Método para crear un nuevo turno en la base de datos
    public void crearTurno(Turno turno) {
        turnoJpa.create(turno);
    }

    //CIUDADANO
    //Método para obtener un ciudadano por su ID
    public Ciudadano obtenerId(Long id) {
        return ciudadanoJpa.findCiudadano(id);
    }

    //Método para obtener un ciudadano por su DNI
    public Ciudadano obtenerDni(String dni) {
        return ciudadanoJpa.findCiudadanoDni(dni);
    }

    //Método para crear un nuevo turno asociado a un nuevo ciudadano en la base de datos
    public void crearTurnoConCiudadano(Turno turno) {
        //Obtener el ciudadano asociado al turno
        Ciudadano ciudadano = turno.getCiudadano();

        //Persistir automáticamente tanto el ciudadano como el turno en la base de datos
        ciudadanoJpa.create(ciudadano);
        turnoJpa.create(turno);
    }

    //Método para obtener la lista de todos los turnos en la base de datos
    public List<Turno> obtenerListaTurnos() {
        return turnoJpa.findTurnoEntities();
    }

    //Método para ordenar la lista de turnos por ID
    public List<Turno> ordenLista(Turno turno) {
        return turnoJpa.findTurnoEntities().stream()
                .sorted(Comparator.comparing(Turno::getId)).toList();
    }

    //Método para cambiar el estado de un turno en la base de datos
    public void cambiarEstadoTurno(Long idTurno, String nuevoEstado) {
        Turno turno = turnoJpa.findTurno(idTurno);
        turno.setEstado(nuevoEstado);
        try {
            turnoJpa.edit(turno);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
