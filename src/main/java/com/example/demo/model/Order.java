package com.example.demo.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;

@Entity
@Table(name="orderProduct")
public class Order {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@ManyToOne
    @MapsId("id")
    @JoinColumn(name = "cartId")
    private Cart cart;

    @ManyToOne
    @MapsId("id")
    @JoinColumn(name = "prdId")
    private Product product;
	
	private long numberProduct;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
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
