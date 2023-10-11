package com.example.demo.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="orderProduct")
public class Order {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "billId")
    private Bill bill;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "prdId")
    private Product product;
	
	private long numberProduct;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public long getNumberProduct() {
		return numberProduct;
	}

	public void setNumberProduct(long numberProduct) {
		this.numberProduct = numberProduct;
	}
	
}
