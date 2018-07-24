package com.freemind.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "PURCHASE")
public class Purchase implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	int id;

	@Column(name = "PURCHASE_BILL_NO")
	int puchaseBillNo;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "VENDOR_ID")
	Vendors vendor;

	@Column(name = "PURCHASE_DATE")
	Date purchaseDate;

	@Column(name = "TOTAL_AMOUNT")
	double totalAmount;

	@Column(name = "DISCOUNT_PERC")
	double discountPerc;

	@Column(name = "DISCOUNT_RS")
	double discountRs;

	@Column(name = "PURCHASE_ORDER_NO")
	int puchaseOrderNo;

	@Column(name = "CREATED_BY")
	int createdBy;

	@Column(name = "MODIFIED_BY")
	int modifyBy;

	@Column(name = "INSERTION_DATE")
	Date insertionDate;

	@Column(name = "LAST_MODIFIED_DATE")
	Date lastModifyDate;

	@OneToMany(mappedBy = "purchase", cascade = CascadeType.ALL)
	List<PurchaseTaxDetails> listPurchaseTaxDetails;

	@OneToMany(mappedBy = "purchase", cascade = CascadeType.ALL)
	List<PurchaseDetails> listPurchaseDetails;

	@OneToMany(mappedBy = "purchase", cascade = CascadeType.ALL)
	List<PurchasePaymentDetails> listPurchasePaymentDetails;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPuchaseBillNo() {
		return puchaseBillNo;
	}

	public void setPuchaseBillNo(int puchaseBillNo) {
		this.puchaseBillNo = puchaseBillNo;
	}

	public Vendors getVendor() {
		return vendor;
	}

	public void setVendor(Vendors vendor) {
		this.vendor = vendor;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public double getDiscountPerc() {
		return discountPerc;
	}

	public void setDiscountPerc(double discountPerc) {
		this.discountPerc = discountPerc;
	}

	public double getDiscountRs() {
		return discountRs;
	}

	public void setDiscountRs(double discountRs) {
		this.discountRs = discountRs;
	}

	public int getPuchaseOrderNo() {
		return puchaseOrderNo;
	}

	public void setPuchaseOrderNo(int puchaseOrderNo) {
		this.puchaseOrderNo = puchaseOrderNo;
	}

	public List<PurchaseTaxDetails> getListPurchaseTaxDetails() {
		return listPurchaseTaxDetails;
	}

	public void setListPurchaseTaxDetails(List<PurchaseTaxDetails> listPurchaseTaxDetails) {
		this.listPurchaseTaxDetails = listPurchaseTaxDetails;
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

	public List<PurchaseDetails> getListPurchaseDetails() {
		return listPurchaseDetails;
	}

	public void setListPurchaseDetails(List<PurchaseDetails> listPurchaseDetails) {
		this.listPurchaseDetails = listPurchaseDetails;
	}

	public List<PurchasePaymentDetails> getListPurchasePaymentDetails() {
		return listPurchasePaymentDetails;
	}

	public void setListPurchasePaymentDetails(List<PurchasePaymentDetails> listPurchasePaymentDetails) {
		this.listPurchasePaymentDetails = listPurchasePaymentDetails;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

}
