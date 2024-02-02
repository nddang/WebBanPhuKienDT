package com.example.demo.model;

import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;
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

@Data
@Entity
@Table(name="bill")
public class Bill {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

    @ManyToOne
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
	
	private String shipmentStatus;
	
	@OneToMany(mappedBy = "bill",cascade =  CascadeType.ALL )
	private List < Order > order;

	private double totalPrice;
	
}
