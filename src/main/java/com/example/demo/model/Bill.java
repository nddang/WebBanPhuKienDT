package com.example.demo.model;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.annotation.CreatedDate;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
@Table(name="bill")
public class Bill {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "cusId")
    private Customer customer;
	
	@Temporal(TemporalType.TIMESTAMP)
    @CreatedDate
    private LocalDateTime createdAt;
	
	private String paymentStatus;
	
	@Temporal(TemporalType.TIMESTAMP)
    @CreatedDate
    private LocalDateTime paymentAt;
	
	private String shipmentPlace;
	
	@OneToMany(mappedBy = "bill",cascade =  CascadeType.ALL )
	private List < Order > order;

	

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public List<Order> getOrder() {
		return order;
	}

	public void setOrder(List<Order> order) {
		this.order = order;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public LocalDateTime getPaymentAt() {
		return paymentAt;
	}

	public void setPaymentAt(LocalDateTime paymentAt) {
		this.paymentAt = paymentAt;
	}

	public String getShipmentPlace() {
		return shipmentPlace;
	}

	public void setShipmentPlace(String shipmentPlace) {
		this.shipmentPlace = shipmentPlace;
	}
}
