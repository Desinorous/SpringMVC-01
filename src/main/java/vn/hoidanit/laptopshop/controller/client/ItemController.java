package vn.hoidanit.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemController {

    @GetMapping("/product/{id}")
    public String getDetailProductPage() {
        return "client/product/detail";
    }

}
