package vn.hoidanit.laptopshop.controller;

import java.security.Provider.Service;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import vn.hoidanit.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @RequestMapping("/")
    public String getHomePage() {
        return "home";
    }

}

// @RestController
// public class UserController {

// private UserService service;

// public UserController(UserService service) {
// this.service = service;
// }

// @GetMapping("")
// public String getHomePage() {
// return this.service.handleHello();
// }
// }
