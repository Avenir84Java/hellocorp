package fr.sofiane.moscatelli2.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class usersController {
    @Autowired
    private usersService service;

    @GetMapping("/users")
    public String ShowUsers(Model model) {
        List<users> users = service.listeUsers();
        model.addAttribute("Users", users);
        return "users";
    }







}
