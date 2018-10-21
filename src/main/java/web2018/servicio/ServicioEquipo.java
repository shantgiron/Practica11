package web2018.servicio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import web2018.modelo.Equipo;

@Repository
public interface ServicioEquipo extends JpaRepository<Equipo, Long> {
    @Query("select e from Equipo e where e.codigo = :codigo")
    Equipo findByCodigo(@Param("codigo") String codigo);
}
