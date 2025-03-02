package vn.hoidanit.laptopshop;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
public class HelloController {
    @GetMapping("/")
    public String index() {
        return "Hello World From Son ";
    }

    @GetMapping("/user")
    public String user() {
        return "Hello World From User ";
    }

    @GetMapping("/admin")
    public String admin() {
        return "Hello World From Admin ";
    }

}
