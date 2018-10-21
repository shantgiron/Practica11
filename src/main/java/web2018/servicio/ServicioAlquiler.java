package web2018.servicio;

import org.springframework.data.jpa.repository.Query;
import web2018.modelo.Alquiler;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServicioAlquiler extends JpaRepository<Alquiler, Long> {
    @Query(nativeQuery = true, value = "SELECT E.CODIGO, COUNT(AE.ALQUILER_ID) AS TOTAL FROM equipo E, alquiler_equipos AE WHERE AE.EQUIPO_ID = E.ID GROUP BY E.CODIGO")
    List<Object[]> getPromedioAlquileresPorDia();
}
