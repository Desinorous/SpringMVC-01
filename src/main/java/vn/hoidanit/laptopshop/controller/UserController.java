package vn.hoidanit.laptopshop.controller;

import java.security.Provider.Service;
import java.util.List;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class UserController {
    private final UserService userService;
    private final UserRepository userRepository;

    public UserController(UserService userService, UserRepository userRepository) {
        this.userService = userService;
        this.userRepository = userRepository;
    }

    // Home Page
    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> listUser = this.userService.getAllUserByEmail("vanson010825@gmail.com");
        System.out.println(listUser);
        model.addAttribute("eric", listUser);
        return "home";
    }

    // User Table Page
    @RequestMapping(value = "/admin/user")
    public String getUserPage(Model model) {
        List<User> listUser = this.userService.getAllUser();
        model.addAttribute("users", listUser);
        return "admin/user/table-user";
    }

    // User Detail Page
    @RequestMapping(value = "/admin/user/{id}")
    public String getUserDetailPage(Model model, @PathVariable Long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/userDetail";
    }

    // Create User Page
    @RequestMapping(value = "/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // Return User Table Page After Create User
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String getTableUserPage(Model model, @ModelAttribute("newUser") User user) {
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    // Update User Page
    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("updatedUser", currentUser);
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String getTablePageFromUpdateUserPage(Model model, @ModelAttribute("updatedUser") User updateUser) {
        User currentUser = this.userService.getUserById(updateUser.getId());
        if (currentUser != null) {
            currentUser.setAddress(updateUser.getAddress());
            currentUser.setEmail(updateUser.getEmail());
            currentUser.setFullname(updateUser.getFullname());
            currentUser.setPhone(updateUser.getPhone());
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    // Delete User Page
    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        User deleteUser = this.userService.getUserById(id);
        model.addAttribute("deleteUser", deleteUser);
        return "/admin/user/deleteUser";
    }

    @PostMapping("/admin/user/delete")
    public String postMethodName(Model model, @ModelAttribute("deleteUser") User deleteUser) {
        this.userService.deleteUser(deleteUser.getId());
        return "redirect:/admin/user";
    }

}
