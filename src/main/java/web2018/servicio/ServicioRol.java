package web2018.servicio;

import web2018.modelo.Rol;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServicioRol extends JpaRepository<Rol, Long> {
}
