package com.freemind.command;

public class PaymentDetails {
	private int id;
	private String paymentMode;
	private String bankName;
	private String branchName;
	private String chequeTransactionNo;
	private double amount;
	private int purchasePaymentDetailsId;
	private int salePaymentDetailsId;
	private String paymentDate;

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

	public int getPurchasePaymentDetailsId() {
		return purchasePaymentDetailsId;
	}

	public void setPurchasePaymentDetailsId(int purchasePaymentDetailsId) {
		this.purchasePaymentDetailsId = purchasePaymentDetailsId;
	}

	public int getSalePaymentDetailsId() {
		return salePaymentDetailsId;
	}

	public void setSalePaymentDetailsId(int salePaymentDetailsId) {
		this.salePaymentDetailsId = salePaymentDetailsId;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

}
