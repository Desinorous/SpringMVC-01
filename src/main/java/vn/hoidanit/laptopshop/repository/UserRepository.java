package vn.hoidanit.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.support.CrudMethodMetadata;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User userRepository);

    List<User> findByEmail(String email);

    User findById(long id);

}
