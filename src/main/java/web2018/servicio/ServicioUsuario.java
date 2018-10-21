package web2018.servicio;

import web2018.modelo.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServicioUsuario extends JpaRepository<Usuario, Long>{
    Usuario findUsuarioBy(String nombreUsuario);


    Usuario save(Usuario entity);
}
