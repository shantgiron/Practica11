package web2018.servicio;

import web2018.modelo.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServicioCliente extends JpaRepository<Cliente, Long> {

}
