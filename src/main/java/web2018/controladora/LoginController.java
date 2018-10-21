package web2018.controladora;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

@Controller
public class LoginController {
    @Autowired
    private MessageSource messageSource;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String get(Locale locale, Model model) {

        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String post() {
        return "redirect:/index";
    }
}
