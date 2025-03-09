package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import vn.hoidanit.laptopshop.model.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public ProductController(ProductService productService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.productService = productService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // Product Page
    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> list = this.productService.getAllProduct();
        model.addAttribute("products", list);
        return "admin/product/show";
    }

    // Create product
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String getProduct(Model model, @ModelAttribute("newProduct") @Valid Product product,
            BindingResult newProductBindingResult,
            @RequestParam("file") MultipartFile file) {

        // Validate
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        Product currentProduct = this.productService.getProductById(product.getId());
        if (!file.isEmpty()) {
            String image = this.uploadService.saveUploadFile(file, "product");
            product.setImage(image);
        }
        // save
        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }

    // Detail Product
    @GetMapping(value = "/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable Long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail";
    }

    // Delete product
    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        Product deleteProduct = this.productService.getProductById(id);
        model.addAttribute("deleteProduct", deleteProduct);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postMethodName(Model model, @ModelAttribute("deleteProduct") Product deleteProduct) {
        this.productService.deleteProduct(deleteProduct.getId());
        return "redirect:/admin/product";
    }

    // Update Product Page
    @RequestMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.getProductById(id);
        model.addAttribute("updatedProduct", currentProduct);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String getTablePageFromUpdateProductPage(Model model,
            @ModelAttribute("updatedProduct") @Valid Product updateProduct,
            BindingResult newProductBindingResult,
            @RequestParam("file") MultipartFile file) {
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/update";
        }
        Product currentProduct = this.productService.getProductById(updateProduct.getId());
        if (!file.isEmpty()) {
            String image = this.uploadService.saveUploadFile(file, "product");
            currentProduct.setImage(image);
        }
        if (currentProduct != null) {
            currentProduct.setDetailDesc(updateProduct.getDetailDesc());
            currentProduct.setShortDesc(updateProduct.getShortDesc());
            currentProduct.setFactory(updateProduct.getFactory());
            currentProduct.setName(updateProduct.getName());
            currentProduct.setPrice(updateProduct.getPrice());
            currentProduct.setQuantity(updateProduct.getQuantity());
            currentProduct.setSold(updateProduct.getSold());
            currentProduct.setTarget(updateProduct.getTarget());
            this.productService.handleSaveProduct(currentProduct);
        }
        return "redirect:/admin/product";
    }

}
