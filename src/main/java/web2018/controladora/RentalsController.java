package web2018.controladora;

import web2018.modelo.Alquiler;
import web2018.servicio.ServicioAlquiler;
import web2018.servicio.ServicioCliente;
import web2018.servicio.ServicioEquipo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;

@Controller
public class RentalsController {

    @Autowired
    private ServicioAlquiler servicioAlquiler;

    @Autowired
    private ServicioCliente servicioCliente;

    @Autowired
    private ServicioEquipo servicioEquipo;

    @RequestMapping(value = "/alquileres", method = RequestMethod.GET)
    public String get(Model model) {
        model.addAttribute("alquileres", servicioAlquiler.findAll());
        model.addAttribute("clientes", servicioCliente.findAll());
        model.addAttribute("equipos", servicioEquipo.findAll());

        return "rentals";
    }

    @Secured({"ROLE_ADMINISTRADOR"})
    @RequestMapping(value = "/registrar/alquiler", method = RequestMethod.POST)
    public String post(@RequestParam(name = "cliente") long cliente,
                       @RequestParam(name = "fechaentrega") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate fechaEntrega,
                       @RequestParam(name = "codigo") String codigo) {
        Alquiler alquiler = new Alquiler();
        alquiler.setEquipo(servicioEquipo.findByCodigo(codigo));
        alquiler.setFechaRealizado(LocalDate.now());
        alquiler.setCliente(servicioCliente.findOne(cliente));
        alquiler.setFechaEntrega(fechaEntrega);

        servicioAlquiler.save(alquiler);

        return "redirect:/alquileres";
    }
}
