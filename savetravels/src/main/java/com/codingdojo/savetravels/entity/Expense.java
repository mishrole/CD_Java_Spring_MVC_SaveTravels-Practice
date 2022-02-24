package com.codingdojo.savetravels.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Entity
@Table(name = "expenses")
@Data
public class Expense {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Size(min = 5, max = 200, message = "Expense name must be at least 5 characters long")
	private String name;
	
	@NotNull
	@Size(min = 5, max = 200, message = "Description must be at least 5 characters long")
	private String description;
	
	@NotNull
	@Min(value = 0, message = "Amount must be positive")
	private Double amount;
	
	@NotNull
	@Size(min = 5, max = 200, message = "Vendor must be at least 5 characters long")
	private String vendor;
	
    @Column(updatable = false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    public Expense() {}
    
    public Expense(String name, String description, Double amount, String vendor) {
    	this.name = name;
    	this.description = description;
    	this.amount = amount;
    	this.vendor = vendor;
    }
    
    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }
    
    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
}
