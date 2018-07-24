package com.freemind.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "SERVICE_TAX")
public class ServiceTax {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	int id;

	@Column(name = "SERVICE_TAX_PERCENT")
	double serviceTaxPercent;

	@Column(name = "IS_ACTIVE", nullable = false, columnDefinition = "boolean default true")
	boolean active = true;

	@Column(name = "CREATED_BY")
	int createdBy;

	@Column(name = "CREATED_DATE")
	Date createdAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getServiceTaxPercent() {
		return serviceTaxPercent;
	}

	public void setServiceTaxPercent(double serviceTaxPercent) {
		this.serviceTaxPercent = serviceTaxPercent;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

}
