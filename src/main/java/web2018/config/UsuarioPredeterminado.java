package web2018.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import web2018.modelo.Rol;
import web2018.modelo.Usuario;
import web2018.servicio.ServicioRol;
import web2018.servicio.ServicioUsuario;

import java.time.LocalDate;

@Controller
public class UsuarioPredeterminado {

    @Autowired
    private ServicioUsuario servicioUsuario;

    @Autowired
    private ServicioRol servicioRol;

    @Autowired
    public UsuarioPredeterminado(ServicioUsuario servicioUsuario, ServicioRol servicioRol) {
        Usuario usuario = new Usuario();
        usuario.setNombres("Shantall");
        usuario.setApellidos("Giron");
        usuario.setCorreo("shantgiron@gmail.com");
        usuario.setFechaNacimiento(LocalDate.of(1995, 5, 8));
        usuario.setRol("ROLE_ADMINISTRADOR");
        usuario.setNombreUsuario("admin");
        usuario.setContrasena("admin");
        usuario.setHabilitado(true);

        if (servicioUsuario.findAll().size() == 0) {
            servicioUsuario.save(usuario);
        }

        if (servicioRol.findAll().size() == 0) {
            Rol rol = new Rol();
            rol.setNombre("ROLE_ADMINISTRADOR");
            rol.setDescripcion("Este rol administra el programa.");
            servicioRol.save(rol);

            rol = new Rol();
            rol.setNombre("ROLE_USUARIO");
            rol.setDescripcion("Este rol puede visualizar las paginas pero no crear contenido.");
            servicioRol.save(rol);
        }
    }
}