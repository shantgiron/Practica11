package web2018.servicio;

import web2018.modelo.Foto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServicioFoto extends JpaRepository<Foto, Long> {
}
