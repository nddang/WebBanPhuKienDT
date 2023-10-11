package com.example.demo.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.demo.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
	Customer findByEmailAndPassword(String username,String password);

	Optional<Customer> findByEmail(String username);
	
}

