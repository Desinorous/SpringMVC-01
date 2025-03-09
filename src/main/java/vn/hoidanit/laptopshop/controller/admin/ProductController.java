package vn.hoidanit.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.ui.Model;

import vn.hoidanit.laptopshop.model.Product;
import vn.hoidanit.laptopshop.model.User;

@Controller
public class ProductController {

    // Product Page
    @GetMapping("/admin/product")
    public String getProductPage() {
        return "admin/product/show";
    }

    // Create product
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

}
