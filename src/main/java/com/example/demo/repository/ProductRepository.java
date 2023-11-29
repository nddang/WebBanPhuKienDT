package com.example.demo.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
	Product findById(long id);

	List<Product> findByCategoryId(long id);

	Page<Product> findAll(Pageable pageable);

	Page<Product> findByCategoryId(long id,Pageable pageable);

	Page<Product> findByNameContaining(String name, Pageable pageable);

	Page<Product> findByPhonenameContaining(String name, Pageable pageable );
	
}

