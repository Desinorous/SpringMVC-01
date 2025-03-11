package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import vn.hoidanit.laptopshop.model.Role;
import vn.hoidanit.laptopshop.service.RoleService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class RoleController {
    private final RoleService roleService;

    public RoleController(RoleService roleService) {
        this.roleService = roleService;
    }

    // Role Page
    @GetMapping("/admin/role")
    public String getRolePage(Model model) {
        List<Role> list = this.roleService.getAllRole();
        model.addAttribute("roles", list);
        return "admin/role/show";
    }

    // Role Update
    @GetMapping("/admin/role/update/{id}")
    public String getRoleEditPage(Model model, @PathVariable long id) {
        Role role = this.roleService.getRoleById(id);
        model.addAttribute("updatedRole", role);
        return "admin/role/update";
    }

    @PostMapping("/admin/role/update")
    public String postMethodName(@ModelAttribute("updatedRole") Role role) {
        Role getRole = this.roleService.getRoleById(role.getId());
        if (getRole != null) {
            getRole.setName(role.getName());
            getRole.setDescription(role.getDescription());
            this.roleService.handleSaveRole(getRole);
        }
        return "redirect:/admin/role";
    }

    // Create role
    @GetMapping("/admin/role/create")
    public String getCreateRolePage(Model model) {
        model.addAttribute("newRole", new Role());
        return "admin/role/create";
    }

    @PostMapping("/admin/role/create")
    public String createRole(@ModelAttribute("newRole") Role role) {
        this.roleService.handleSaveRole(role);
        return "redirect:/admin/role";
    }

    // Delete Role
    @GetMapping("/admin/role/delete/{id}")
    public String getDeleteRolePage(Model model, @PathVariable long id) {
        Role deleteRole = this.roleService.getRoleById(id);
        model.addAttribute("deleteRole", deleteRole);
        return "admin/role/delete";
    }

    @PostMapping("/admin/role/delete")
    public String postMethodName(Model model, @ModelAttribute("deleteRole") Role deleteRole) {
        this.roleService.deleteRole(deleteRole.getId());
        return "redirect:/admin/role";
    }

}
