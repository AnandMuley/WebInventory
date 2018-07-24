package com.freemind.command;

import java.util.ArrayList;
import java.util.List;

public class Sale {
	private int id;
	private int billNo;
	private int saleOrderNo;
	private double totalAmount;
	private double paidAmount;
	private double netAmount;
	private double balanceAmount;
	private double discountPerc;
	private double discountRs;
	private int customerId;
	private String billDate;
	private String deliveryDate;
	private List<SaleDetails> saleDetailsList = new ArrayList<SaleDetails>();
	private SalePaymentDetails salePaymentDetails = new SalePaymentDetails();

	public List<SaleDetails> getSaleDetailsList() {
		return saleDetailsList;
	}

	public void setSaleDetailsList(List<SaleDetails> saleDetailsList) {
		this.saleDetailsList = saleDetailsList;
	}

	public SalePaymentDetails getSalePaymentDetails() {
		return salePaymentDetails;
	}

	public void setSalePaymentDetails(SalePaymentDetails salePaymentDetails) {
		this.salePaymentDetails = salePaymentDetails;
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

	public double getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(double paidAmount) {
		this.paidAmount = paidAmount;
	}

	public double getNetAmount() {
		return netAmount;
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

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getBillDate() {
		return billDate;
	}

	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}

	public String getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

}
