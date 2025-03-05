package vn.hoidanit.laptopshop.controller;

import java.security.Provider.Service;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import vn.hoidanit.laptopshop.model.User;
import vn.hoidanit.laptopshop.repository.UserRepository;
import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class UserController {
    private final UserService userService;
    private final UserRepository userRepository;

    public UserController(UserService userService, UserRepository userRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> listUser = this.userService.getAllUserByEmail("vanson010825@gmail.com");
        System.out.println(listUser);
        model.addAttribute("eric", listUser);
        return "home";
    }

    @RequestMapping(value = "/admin/user")
    public String getUserPage(Model model) {
        List<User> listUser = this.userService.getAllUser();
        model.addAttribute("users", listUser);
        return "admin/user/table-user";
    }

    @RequestMapping(value = "/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String getTableUserPage(Model model, @ModelAttribute("newUser") User user) {
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

}
