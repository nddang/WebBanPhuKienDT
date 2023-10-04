package com.example.demo.dto;

import com.example.demo.model.Product;

public class DtoOrder {
	private long numberproduct;
	private Product product;
	
	
	public long getNumberproduct() {
		return numberproduct;
	}
	public void setNumberproduct(long numberproduct) {
		this.numberproduct = numberproduct;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}
