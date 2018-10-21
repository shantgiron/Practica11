package web2018.modelo;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;

@Entity
@Table
public class Alquiler implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private LocalDate fechaRealizado;
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Cliente cliente;
    private LocalDate fechaEntrega;
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL, targetEntity = Equipo.class)
    @JoinTable(name = "alquiler_equipos", joinColumns = {@JoinColumn(name = "alquiler_id")}, inverseJoinColumns = {@JoinColumn(name = "equipo_id")})
    private Equipo equipo;
    private double total;

    public Alquiler() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public LocalDate getFechaRealizado() {
        return fechaRealizado;
    }

    public void setFechaRealizado(LocalDate fechaRealizado) {
        this.fechaRealizado = fechaRealizado;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public LocalDate getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(LocalDate fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public Equipo getEquipo() {
        return equipo;
    }

    public void setEquipo(Equipo equipo) {
        this.equipo = equipo;
    }

    public double getTotal() {
        return equipo.getCostoAlquilerPorDia();
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
