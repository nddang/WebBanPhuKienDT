package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Bill;

public interface BillRepository extends JpaRepository<Bill, Long> {

	Bill findById(long id);
	
	List<Bill> findByCustomerId(long id);

}
