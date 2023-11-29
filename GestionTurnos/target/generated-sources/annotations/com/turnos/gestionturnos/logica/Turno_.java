package com.turnos.gestionturnos.logica;

import com.turnos.gestionturnos.logica.Ciudadano;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-11-29T15:45:42")
@StaticMetamodel(Turno.class)
public class Turno_ { 

    public static volatile SingularAttribute<Turno, String> descripcion;
    public static volatile SingularAttribute<Turno, LocalDate> fecha;
    public static volatile SingularAttribute<Turno, String> estado;
    public static volatile SingularAttribute<Turno, LocalTime> hora;
    public static volatile SingularAttribute<Turno, Long> id;
    public static volatile SingularAttribute<Turno, Ciudadano> ciudadano;

}