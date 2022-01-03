package fr.sofiane.moscatelli2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainControler {

    @GetMapping("/")
    public String ShowHomePage() {
        return "index";
    }
}
