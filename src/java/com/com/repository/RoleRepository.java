package com.com.repository;

import com.com.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by ruslan on 10.03.17.
 */
public interface RoleRepository extends JpaRepository<Role, Long> {
}
