package com.example.demo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
	Customer findByUsernameAndPassword(String username,String password);

	Optional<Customer> findByUsername(String username);
}

