package com.freemind.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name = "PAYMENT_DETAILS")
public class PaymentDetails implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	private int id;

	@Column(name = "PAYMENT_MODE")
	private String paymentMode;

	@Column(name = "BANK_NAME")
	private String bankName;

	@Column(name = "BRANCH_NAME")
	private String branchName;

	@Column(name = "CHEQUE_TRANSACTION_NO")
	private String chequeTransactionNo;

	@Column(name = "AMOUNT")
	private double amount;

	@Column(name = "PAYMENT_DATE")
	private Date paymentDate;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SALE_PAYMENT_DETAILS_ID", nullable = true)
	private SalePaymentDetails salePaymentDetails;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PURCHASE_PAYMENT_DETAILS_ID", nullable = true)
	private PurchasePaymentDetails purchasePaymentDetails;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPaymentMode() {
		return paymentMode;
	}

	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getChequeTransactionNo() {
		return chequeTransactionNo;
	}

	public void setChequeTransactionNo(String chequeTransactionNo) {
		this.chequeTransactionNo = chequeTransactionNo;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public SalePaymentDetails getSalePaymentDetails() {
		return salePaymentDetails;
	}

	public void setSalePaymentDetails(SalePaymentDetails salePaymentDetails) {
		this.salePaymentDetails = salePaymentDetails;
	}

	public PurchasePaymentDetails getPurchasePaymentDetails() {
		return purchasePaymentDetails;
	}

	public void setPurchasePaymentDetails(PurchasePaymentDetails purchasePaymentDetails) {
		this.purchasePaymentDetails = purchasePaymentDetails;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

}
