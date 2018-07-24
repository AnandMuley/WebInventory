package com.freemind.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

@SuppressWarnings("serial")
@Entity
@Table(name = "SALE")
public class Sale implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	int id;

	@Column(name = "BILL_NO")
	int billNo;

	@Column(name = "SALE_ORDER_NO")
	int saleOrderNo;

	@Column(name = "BILL_DATE")
	private Date billDate;
	
	@Column(name = "DELIVERY_DATE")
	private Date deliveryDate;

	@Column(name = "TOTAL_AMOUNT")
	double totalAmount;

	@Column(name = "PAID_AMOUNT")
	double paidAmount;

	@Column(name = "NET_AMOUNT")
	double netAmount;

	@Column(name = "BALANCE_AMOUNT")
	double balanceAmount;

	@Column(name = "DISCOUNT_PERC")
	double discountPerc;

	@Column(name = "DISCOUNT_RS")
	double discountRs;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CUSTOMER_ID", nullable = true)
	Customer customer;

	@OneToMany(mappedBy = "sale", cascade = CascadeType.ALL)
	List<SaleDetails> listSaleDetails = new ArrayList<SaleDetails>();

	public double getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(double paidAmount) {
		this.paidAmount = paidAmount;
	}

	public void setNetAmount(double netAmount) {
		this.netAmount = netAmount;
	}

	public double getBalanceAmount() {
		return balanceAmount;
	}

	public void setBalanceAmount(double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}

	public double getNetAmount() {
		return netAmount;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBillNo() {
		return billNo;
	}

	public void setBillNo(int billNo) {
		this.billNo = billNo;
	}

	public int getSaleOrderNo() {
		return saleOrderNo;
	}

	public void setSaleOrderNo(int saleOrderNo) {
		this.saleOrderNo = saleOrderNo;
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

	public List<SaleDetails> getListSaleDetails() {
		return listSaleDetails;
	}

	public void setListSaleDetails(List<SaleDetails> listSaleDetails) {
		this.listSaleDetails = listSaleDetails;
	}

	public Date getBillDate() {
		return billDate;
	}

	public void setBillDate(Date billDate) {
		this.billDate = billDate;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

}
