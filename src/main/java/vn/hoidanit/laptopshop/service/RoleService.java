package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.model.Role;
import vn.hoidanit.laptopshop.repository.RoleRepository;

@Service
public class RoleService {
    public final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public List<Role> getAllRole() {
        return this.roleRepository.findAll();
    }

    public Role getRoleById(long id) {
        return this.roleRepository.findById(id);
    }

    public Role handleSaveRole(Role role) {
        return this.roleRepository.save(role);
    }

    public void deleteRole(long id) {
        this.roleRepository.deleteById(id);
    }
}
