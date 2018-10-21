package web2018.controladora;

import com.google.gson.Gson;
import web2018.modelo.Alquiler;
import web2018.servicio.ServicioAlquiler;
import web2018.servicio.ServicioCliente;
import web2018.servicio.ServicioEquipo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

@Controller
public class IndexController {

    @Autowired
    private ServicioCliente servicioCliente;

    @Autowired
    private ServicioEquipo servicioEquipo;

    @Autowired
    private ServicioAlquiler servicioAlquiler;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String get(Model model) {
        model.addAttribute("clientes", servicioCliente.findAll().size());
        model.addAttribute("equipos", servicioEquipo.findAll().size());
        model.addAttribute("alquileres", servicioAlquiler.findAll().size());

        List<String> labels = new ArrayList<>();
        List<String> values = new ArrayList<>();
        for (Object[] objects : servicioAlquiler.getPromedioAlquileresPorDia()) {
            labels.add(objects[0].toString());
            values.add(objects[1].toString());
        }

        model.addAttribute("equipo_label", new Gson().toJson(labels));
        model.addAttribute("historiales", new Gson().toJson(values));

        return "index";
    }
}
