package com.example.demo.model;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name="product")
public class Product {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	private String name;
	
	private long number;
	
	private double price;
	
	@Column(length = 2000)
	private String des;
	
	private String imgurl;
	
	@OneToMany(mappedBy = "product",cascade =  CascadeType.ALL )
	private List < Order > order;
	
	@ManyToOne
    @JoinColumn(name = "categoryId")
    private Category category;
	
	private String phonename;
	
}
