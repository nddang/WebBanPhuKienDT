package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Phone;

public interface PhoneRepository extends JpaRepository<Phone, Long>{
	Phone findById(long id);

}
