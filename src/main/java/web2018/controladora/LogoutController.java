package web2018.controladora;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

@Controller
public class LogoutController {
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String get(Locale locale, Model model) {
        SecurityContextHolder.clearContext();

        return "redirect:/login";
    }
}
