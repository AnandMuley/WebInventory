package com.freemind.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "SALE_PAYMENT_DETAILS")
public class SalePaymentDetails implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	private int id;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SALE_ID", nullable = true)
	private Sale sale;

	@Column(name = "CREATED_BY")
	private int createdBy;

	@Column(name = "MODIFIED_BY")
	private int modifyBy;

	@Column(name = "INSERTION_DATE")
	private Date insertionDate;

	@Column(name = "LAST_MODIFIED_DATE")
	private Date lastModifyDate;

	@OneToMany(mappedBy = "salePaymentDetails", cascade = CascadeType.ALL)
	List<PaymentDetails> listPaymentDetails=new ArrayList<PaymentDetails>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Sale getSale() {
		return sale;
	}

	public void setSale(Sale sale) {
		this.sale = sale;
	}

	public List<PaymentDetails> getListPaymentDetails() {
		return listPaymentDetails;
	}

	public void setListPaymentDetails(List<PaymentDetails> listPaymentDetails) {
		this.listPaymentDetails = listPaymentDetails;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	public int getModifyBy() {
		return modifyBy;
	}

	public void setModifyBy(int modifyBy) {
		this.modifyBy = modifyBy;
	}

	public Date getInsertionDate() {
		return insertionDate;
	}

	public void setInsertionDate(Date insertionDate) {
		this.insertionDate = insertionDate;
	}

	public Date getLastModifyDate() {
		return lastModifyDate;
	}

	public void setLastModifyDate(Date lastModifyDate) {
		this.lastModifyDate = lastModifyDate;
	}

}
