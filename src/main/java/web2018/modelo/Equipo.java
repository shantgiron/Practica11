package web2018.modelo;

import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table
public class Equipo implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String nombre;
    private String codigo;
    private int cantidadExistencia;
    private double costoAlquilerPorDia;
    private boolean entregado;

    public Equipo() {
    }



    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public int getCantidadExistencia() {
        return cantidadExistencia;
    }

    public void setCantidadExistencia(int cantidadExistencia) {
        this.cantidadExistencia = cantidadExistencia;
    }

    public double getCostoAlquilerPorDia() {
        return costoAlquilerPorDia;
    }

    public void setCostoAlquilerPorDia(double costoAlquilerPorDia) {
        this.costoAlquilerPorDia = costoAlquilerPorDia;
    }

    public boolean isEntregado() {
        return entregado;
    }

    public void setEntregado(boolean entregado) {
        this.entregado = entregado;
    }

    public String getNombre() {
        if (this.nombre == null)
            return "";
        else
            return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
